class Plant < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validate :name, presence: true, length: { minimum: 3 }
end
