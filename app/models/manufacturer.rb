class Manufacturer < ApplicationRecord
  # Direct associations

  has_many   :cars,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
