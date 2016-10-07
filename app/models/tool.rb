class Tool < ApplicationRecord

  belongs_to :gardener
  has_many :requests

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end
