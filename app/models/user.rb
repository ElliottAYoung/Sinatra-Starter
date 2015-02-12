class User < ActiveRecord::Base
  include BCrypt

  validates :user_name, uniqueness: true

  def password
    @password = Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticated?(password)
    self.password == password
  end
end
