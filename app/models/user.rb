# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  account_id      :integer
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :account_id, :is_primary, :updating_pw
  
  attr_writer :updating_pw
  
  has_one :account
  
  before_save { self.email.downcase! }
  before_save :create_remember_token
  after_create :create_account

  validates :name, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                   format: { with: VALID_EMAIL_REGEX }, 
                   uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 5 }, :if => :should_validate_password?
  validates :password_confirmation, presence: true, :if => :should_validate_password?
  
  def should_validate_password?
      if @updating_pw == 'false'
        false
      else
        true
      end
  end
  
  private

     def create_remember_token
       self.remember_token = SecureRandom.urlsafe_base64
     end
     
     def create_account
       if self.is_primary?
         account = Account.new
         account.name = self.name
         account.primary_user = 2
         account.save
         self.account_id = account.id
         self.save
       end
     end
end
