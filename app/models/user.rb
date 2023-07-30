class User < ApplicationRecord
    has_many :reviews


    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
    validates :username, presence: true,
                         length: { minimum: 3, maximum: 50 }
    validates :password, format: { with: %r{\A(?=.*[!@#$%^&*()\-_=+{};:,<.>‌​~\[\]|\\/])(?=.*\d).*\z},
                                   message: 'must include at least one special character and one number' },
                         length: { minimum: 4, message: 'must be at least 4 characters long' }
  
end
