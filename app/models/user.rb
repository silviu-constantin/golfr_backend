class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :scores, dependent: :destroy

  def send_email(score)
    UserMailer.sending_score(self,score).deliver_now
  end
end
