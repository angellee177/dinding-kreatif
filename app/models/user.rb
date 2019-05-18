class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
end
