class Address < ApplicationRecord
  belongs_to :service
  belongs_to :state
  belongs_to :city

  validates_with CityValidator
  validates_with StateValidator

  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :state
end
