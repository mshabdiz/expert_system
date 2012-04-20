class Directive < ActiveRecord::Base
  belongs_to :state, inverse_of: :directive

  validates :name, :state, presence: true

  attr_accessible :name
end
