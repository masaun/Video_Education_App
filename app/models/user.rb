class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable


  validates :name, presence: true, length: {maximum: 25}

  

  def self.find_for_google_oauth2(acccess_token, signed_in_resourse=nil)
    data = acccess_token.info
    user = User.where(:provider => acccess_token.provider, :uid => acccess_token.uid).first

    if user
      return user
    else
      registered_user = User.where(:email => acccess_token.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: data["name"],
          provider: acccess_token.provider,
          email: data["email"],
          uid: acccess_token.uid,
          image: data["image"],
          password: Devise.friendly_token[0,20]
        )
      end
    end
  end

  def self.find_for_facebook_oauth(acccess_token, signed_in_resourse=nil)
    data = acccess_token.info
    user = User.where(:provider => acccess_token.provider, :uid => acccess_token.uid).first

    if user
      return user
    else
      registered_user = User.where(:email => data.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: acccess_token.extra.raw_info.name,
          provider: acccess_token.provider,
          email: data.email,
          uid: acccess_token.uid,
          image: data.image,
          password: Devise.friendly_token[0,20]
        )
      end
    end
  end

end
