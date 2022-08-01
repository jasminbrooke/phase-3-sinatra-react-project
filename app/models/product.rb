class Product < ActiveRecord::Base
    belongs_to :user

    validates :productname, presence: true, uniqueness: true
end