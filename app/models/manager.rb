class Manager < ActiveRecord::Base

    has_many :projects
    has_secure_password 
    validates :email, presence: true, uniqueness: true

end