class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :username, uniqueness: true, length: { in:2..20 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guestuser"
    end
  end

  def display_status
    is_deleted ? '退会済み' : '有効'
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
