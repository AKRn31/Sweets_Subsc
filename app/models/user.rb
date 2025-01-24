class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :username, uniqueness: true, length: { in:2..20 }

  def get_images
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(username: content)
    elsif method == 'forward'
      User.where('username LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('username LIKE ?', '%' + content)
    else
      User.where('username LIKE ?', '%' + content + '%')
    end
  end
 
end
