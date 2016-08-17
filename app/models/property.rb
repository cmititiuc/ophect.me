class Property < ActiveRecord::Base
  validates :key, uniqueness: true
end
