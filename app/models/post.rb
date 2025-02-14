class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :subsc
  has_many_attached :images


  

  validates :title, presence: true
  validates :body, presence: true, length:{ minimum: 2 ,maximum: 300 }

  private
    def images_length
      if images.length > 5
        images.purge
        errors.add(:images, "は5枚以内にしてください")
      end
    end
  end

