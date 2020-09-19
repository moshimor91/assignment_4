class Book < ApplicationRecord
  has_many :pages

  scope :sorted, lambda { order("id") }

end
