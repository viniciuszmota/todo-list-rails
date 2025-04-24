class User < ApplicationRecord
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, format: {
    with: /\A[a-zA-Z0-9_]+\z/,
    message: "não pode conter espaços ou caracteres especiais"
  }
end
