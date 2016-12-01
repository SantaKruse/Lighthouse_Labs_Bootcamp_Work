class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validate :at_least_one_image


  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  mount_uploader :image, ImageUploader

  scope :search, lambda { |search, runtime|
    
    if search
      search = "%#{search.to_s}%"     
    else
      search = ""
    end

    sql = "title LIKE ? OR director LIKE ?"
    
    case runtime.to_i
    when 1 then sql += " AND runtime_in_minutes < 90"
    when 2 then sql += " AND runtime_in_minutes BETWEEN 90 AND 120"
    when 3 then sql += " AND runtime_in_minutes > 120"
    end
    
    where(sql, search, search)
  }



  def review_average
    if reviews.sum(:rating_out_of_ten) == 0 
      'No reviews yet'
    else
      "Average Rating: #{reviews.sum(:rating_out_of_ten)/reviews.size}/10"
    end
  end

  def at_least_one_image
    if [self.image, self.poster_image_url].reject(&:blank?).size == 0 || [self.image, self.poster_image_url].reject(&:blank?).size == 2
      errors[:base] << ("Please either upload an image or supply an image URL")
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end