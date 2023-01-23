require "bcrypt"

class User
  @@users = []
  attr_accessor :username, :password
  
  def initialize(username, password)
    @username = username
    @password = User.hash_password(password)
    @@users << self
  end
  
  def self.all
    @@users
  end
  
  def self.authenticate_user(username, password)
    authenticated_user = nil
    @@users.each do |user|
      if user.username == username && user.password == password
        authenticated_user = user
        break;
      end
    end
    authenticated_user
  end
  
  def self.hash_password(password)
    BCrypt::Password.create(password)
  end
  
  def self.seed
    users = [
      {
        username: "johndoe123",
        password: "password"
      },
      {
        username: "amy123",
        password: "password"
      },
    ]
    
    users.each do |user|
      User.new(user[:username], user[:password])
    end
  end
  
end
