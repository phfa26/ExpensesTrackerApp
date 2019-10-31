class User < ApplicationRecord
    has_secure_password
    has_many :expenses
    has_many :categories
    validates :email, presence: true, uniqueness: true
    validates   :password, :presence => true,
                :confirmation => true,
                :length => {:within => 6..12},
                :on => :create
end