# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    has_secure_password 

    #this validates there is an email address prior to creating the new user.
    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
end
