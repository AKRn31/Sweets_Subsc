class Subsc < ApplicationRecord
  has_one_attached :subsc_image

  has_many :posts, dependent: :destroy


  def self.search_for(content, method)
    return Subsc.none if content.blank? 

    case method
    when 'perfect' 
      Subsc.where(name: content)
    when 'forward'
      Subsc.where('name LIKE ?', "#{content}%")
    when 'backward'
      Subsc.where('name LIKE ?', "%#{content}")
    else
      Subsc.where('name LIKE ?',  "%#{content}%")
    end
  end
end
