class Subsc < ApplicationRecord
  has_one_attached :subsc_image

  has_many :posts, dependent: :destroy

  def self.search_for(content, method)
    if method == 'perfect'
      Subsc.where(name: content)
    elsif method == 'forward'
      Subsc.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Subsc.where('name LIKE ?', '%'+content)
    else
      Subsc.where('name LIKE ?', '%'+content+'%')
    end
  end
end
