class User < ActiveRecord::Base
  has_many :authentications
  has_many :comments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :avatar
  mount_uploader :avatar, AvatarUploader

  def apply_omniauth(omniauth)
    if omniauth['provider'] == 'twitter'
      logger.warn(omniauth['info'].inspect)
      # self.username = omniauth['info']['nickname']
      self.name = omniauth['info']['name']
      self.name.strip!
      self.email = omniauth['info']['nickname'] + '@twitteruser.com'
      identifier = self.name

    elsif omniauth['provider'] == 'facebook'
      self.email = omniauth['info']['email'] if email.blank?
      # self.username = omniauth['info']['nickname']
      self.name = omniauth['info']['first_name'] + ' ' + omniauth['info']['last_name']
      self.name.strip!
      identifier = self.name
      # self.location = omniauth['extra']['user_hash']['location']['name'] if location.blank?
    elsif omniauth['provider'] == 'google_oauth2'
      self.email = omniauth['info']['email'] 
      self.name = omniauth['info']['name']
      # self.username = omniauth['info']['email']
      identifier = self.name
    end
    self.email = omniauth['info']['email'] if email.blank?
    self.password = SecureRandom.hex(32) if password.blank?  # generate random password to satisfy validations
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :username => identifier)
  end
  
  def icon(size = :avatar)
    avatar.blank? ? 'mystery.jpg' : avatar.url(size)
  end
  
end
