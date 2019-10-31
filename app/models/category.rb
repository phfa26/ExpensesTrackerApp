class Category < ApplicationRecord
    has_many :expenses
    has_many :users
    validates :name, presence: true, uniqueness: { scope: :user_id,
        message: "should happen once per user" }
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 10 }
end
