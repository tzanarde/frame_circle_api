class Frame < ApplicationRecord
  # Associations
  has_many :circles, dependent: :restrict_with_error
  accepts_nested_attributes_for :circles

  # Validations
  validates :center_x, :center_y, :width, :height,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  # Custom Validations
  validate :must_not_overlap_or_touch_other_frames, if: :any_frames?

  # Scopes
  scope :frames_overlapping, -> (center_x, center_y, width, height, exclude_id) do
    where('ABS(center_x - ?) <= ((width / 2.0) + (? / 2.0))', center_x, width)
    .where('ABS(center_y - ?) <= ((height / 2.0) + (? / 2.0))', center_y, height)
    .where.not(id: exclude_id)
  end

  # Attribute Methods
  def topmost_circle = circles.order(center_y: :desc).first&.slice(:center_x, :center_y)
  def rightmost_circle = circles.order(center_x: :desc).first&.slice(:center_x, :center_y)
  def bottommost_circle = circles.order(center_y: :asc).first&.slice(:center_x, :center_y)
  def leftmost_circle = circles.order(center_x: :asc).first&.slice(:center_x, :center_y)
  def circles_amount = circles.count

  private

  def must_not_overlap_or_touch_other_frames
    return unless frame_overlaps_exist?
    
    errors.add(:base, I18n.t('messages.error.frame_overlap_or_touch_an_existing_frame'))
  end

  def frame_overlaps_exist?
    self.class.frames_overlapping(center_x, center_y, width, height, id).exists?
  end

  def any_frames? = self.class.exists?
end
