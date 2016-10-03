class Tool < ApplicationRecord

  belongs_to :gardener
  has_many :requests

end
