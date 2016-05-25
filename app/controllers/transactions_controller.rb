class TransactionsController < ApplicationController
  before_action :authenticate_user!, except: [:notify]

  def create
    product = Product.find(params[:product_id])
    if current_user == product.user
      redirect_to product, notice: "Ta-da Magic"
    else
      @transaction = current_user.transactions.create(transaction_params)
      if @transaction
        values = {
          business: 'mky.wee-facilitator@gmail.com',
          cmd: '_xclick',
          upload: 1,
          notify_url: 'http://localhost:3000/notify',
          amount: @transaction.price,
          item_name: @transaction.product.product_name,
          item_number: @transaction.id,
          quantity: '1',
          return: 'http://localhost:3000'
        }

        redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
      else
        redirect_to @transaction.product, alert: "Your transaction can't be made.."
      end
    end
  end

  protect_from_forgery except: [:notify]
  def notify
    params.permit!
    status = params[:payment_status]
    transaction = Transaction.find(params[:item_number])
    if status == "Completed"
      #user generate code
      transaction.update_attributes status: true
    else
      transaction.destroy
    end
    render nothing: true
  end

  private
  def transaction_params
    params.require(:transaction).permit(:price, :total, :product_id)
  end
end
