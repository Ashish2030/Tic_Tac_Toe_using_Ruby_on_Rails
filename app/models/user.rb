class User < ApplicationRecord

  def message1
    logger.info "======================creation start====================="
  end
  def message2
    logger.info "======================created======================"
  end

  def password_requirements_are_met
    if password_digest
      rules = {
        " must contain at least one lowercase letter"  => /[a-z]+/,
        " must contain at least one uppercase letter"  => /[A-Z]+/,
        " must contain at least one digit"             => /\d+/,
        " must contain at least one special character" => /[^A-Za-z0-9]+/
      }

      rules.each do |message, regex|
        errors.add( :password, message ) unless password.match( regex )
      end
    end
  end

  validates :username,presence: true, uniqueness: { scope: :username, message: "Username already Taken " }
  validate :password_requirements_are_met
  has_secure_password


  after_initialize do |user|
    puts "=============You have initialized an object!=================="
  end
  after_find do |user|
    puts "You have found an object!"
  end
  before_validation :message1, on: :create
  after_validation :message2, on: [ :create, :update ]
end
