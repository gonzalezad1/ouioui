module ApplicationHelper
<<<<<<< HEAD
=======
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    if user.image
      user.image
    else
      "http://gravatar.com/avatar/#{gravatar_id}.jpg?s=150"
    end
  end
>>>>>>> 0478bb66c5aeed21944167d5aa1235cba3cbc3ed
end
