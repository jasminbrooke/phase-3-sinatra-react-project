class User < ActiveRecord::Base
    has_many :products

    validates :displayname, :username, presence: true
    validates :username, uniqueness: true
end