class Subsc < ApplicationRecord
  has_one_attached : subsc_image

  has_many :posts, dependent: :destroy
end
