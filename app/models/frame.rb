class Frame < ApplicationRecord
  # References
  has_many :circles

  # Validations
  validates :center_x, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :center_y, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :width, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  validates :height, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
end
