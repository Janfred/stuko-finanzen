class User < ApplicationRecord
  devise :trackable, :omniauthable, :omniauth_providers => [:shibboleth]

  def update_data(auth)
  end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      end
  end
end
