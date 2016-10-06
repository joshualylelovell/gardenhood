class Tool < ApplicationRecord

  belongs_to :gardener
  has_many :requests

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
