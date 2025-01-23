class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :subsc
  has_many_attached :images


  def get_images
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  validates :title, presence: true
  validates :body, presence: true, length:{ maximum: 300 }

  private
    def avatar_length
      if images.length > 5
        images.purge
        errors.add(:images, "は5枚以内にしてください")
      end
    end
  end

