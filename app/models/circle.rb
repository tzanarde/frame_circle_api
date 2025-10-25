class Circle < ApplicationRecord
  # Associations
  belongs_to :frame

  # Validations
  validates :center_x, :center_y, :diameter,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  # Custom Validations
  validate :must_be_within_frame, if: :has_frame?

  validate :inserting_circles_must_not_overlap_or_touch_each_other, if: :inserting_multiple_circles?

  validate :must_not_overlap_or_touch_other_circles, if: -> { has_frame? && any_circles? }

  # Scopes
  scope :circles_overlapping, -> (center_x, center_y, radius, exclude_id) do
    where('SQRT(POWER(ABS(? - center_x), 2) + POWER(ABS(? - center_y), 2)) <= (? + (diameter / 2.0))',
          center_x, center_y, radius)
    .where.not(id: exclude_id)
  end

  # Attribute Methods
  def radius = diameter / 2

  private

  def must_be_within_frame
    return if circle_within_the_frame?
    
    errors.add(:base, I18n.t('messages.error.circle_overlap_the_frame'))
  end

  def circle_within_the_frame?
    (frame.center_x - center_x).abs + radius <= (frame.width / 2.0) &&
    (frame.center_y - center_y).abs + radius <= (frame.height / 2.0)
  end

  def inserting_circles_must_not_overlap_or_touch_each_other
    return if self.frame.circles.none? { |circle| inserting_circle_overlaps_or_touches_exist?(circle) }

    errors.add(:base, I18n.t('messages.error.circle_overlap_or_touch_an_inserting_circle'))
  end

  def inserting_circle_overlaps_or_touches_exist?(circle)
    return false if circle == self

    centers_distance(circle) <= (radius + (circle.diameter / 2.0))
  end

  def must_not_overlap_or_touch_other_circles
    return unless circle_overlaps_or_touches_exist?
    
    errors.add(:base, I18n.t('messages.error.circle_overlap_or_touch_an_existing_circle'))
  end

  def circle_overlaps_or_touches_exist?
    self.class.circles_overlapping(center_x, center_y, radius, id).exists?
  end

  def centers_distance(circle)
    Math.sqrt(((center_x - circle.center_x) ** 2) + ((center_y - circle.center_y) ** 2))
  end

  def has_frame? = frame

  def any_circles? = frame.circles.exists?

  def inserting_multiple_circles?
    self.frame.present? && self.frame.circles.size > 1
  end
end
