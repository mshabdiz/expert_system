class Directive < ActiveRecord::Base
  belongs_to :state

  validates :name, :state_id, presence: true

  attr_accessible :name
end
