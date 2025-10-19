class Circle < ApplicationRecord
  # References
  belongs_to :frame

  # Validations
  validates :center_x, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :center_y, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :diameter, presence: true,
                       numericality: { greater_than_or_equal_to: 0 }

  validates :frame_id, presence: true
end
