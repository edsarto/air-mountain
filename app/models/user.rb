class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates_presence_of :first_name, :last_name

  has_many :bookings, foreign_key: 'client_id', dependent: :destroy
  has_many :bookings, foreign_key: 'guide_id', dependent: :destroy

  # has_attached_file :picture
    # styles: { large: "1000x1000>", medium: "300x300>", thumb: "100x100>" }

  # validates_attachment_content_type :picture,
  #   content_type: /\Aimage\/.*\z/

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  # def self.find_for_facebook_oauth(auth)
  #   user = where(provider: auth.provider, uid: auth.uid).first
  #   return user if user

  #   user = new(
  #     provider: auth.provider,
  #     uid: auth.uid,
  #     email: auth.info.email,
  #     password: Devise.friendly_token[0,20],
  #     first_name: auth.info.first_name,
  #     last_name: auth.info.last_name,
  #     token: auth.credentials.token,
  #     token_expiry: Time.at(auth.credentials.expires_at)
  #   )

    # user.picture = auth.info.image.gsub('http', 'https') if auth.info.image
  #   user.save

  #   user
  # end
end
