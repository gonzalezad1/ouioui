
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook]
    validates :fullname, presence: true, length: {maximum: 50}
    
    has_many :products
    
    has_many :galleries
    has_many :photos

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50#", profile: '200x200>' }, default_url: nil
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name   # assuming the user model has a name
        user.avatar = auth.info.image # assuming the user model has an image
        end
    end
end
