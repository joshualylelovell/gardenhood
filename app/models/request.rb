class Request < ApplicationRecord

  belongs_to :gardener
  belongs_to :tool

  # # After initialization, set default values
  # after_initialize :set_default_values
  #
  # def set_default_values
  #   # Only set if status IS NOT set
  #   request.status ||= "pending"
  # end

end
