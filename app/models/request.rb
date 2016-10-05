class Request < ApplicationRecord

  belongs_to :gardener
  belongs_to :tool

  after_initialize do |request|
    puts "You have initialized an object!"
    request.status = "pending" if request.new_record?
  end

end
