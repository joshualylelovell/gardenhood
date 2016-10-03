class Request < ApplicationRecord

  belongs_to :gardener
  belongs_to :tool
end
