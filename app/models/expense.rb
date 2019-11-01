class Expense < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 10 }
    validates :name, :when, :value, presence: true
    validates_numericality_of :value, :on => :create
    validates_numericality_of :value, :on => :update
    validates :value, :numericality => { :greater_than => 0 }

end
