class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :status, presence: true

  enum status: {
    pendente: "pendente",
    em_andamento: "em_andamento",
    concluida: "concluida"
  }
end
