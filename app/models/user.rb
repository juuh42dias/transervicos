# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  before_save :set_name_preference

  validates :social_name, presence: true
  validates :birth_date, presence: true
  validates :terms_of_service, acceptance: true
  validates :username, uniqueness: true, allow_blank: true
  validate :age
  has_many :services

  SOCIAL_NAME_PREFERENCE = 'S'
  CIVIL_NAME_PREFERENCE = 'C'

  attr_accessor :birth_date_picker

  def age
    today = Date.current
    return if birth_date && (birth_date + 18.years) < today

    errors.add(:_, 'É preciso ser maior de idade.')
  end

  def preferred_name
    if name_preference == CIVIL_NAME_PREFERENCE
      civil_name.empty? ? social_name : civil_name
    elsif name_preference == SOCIAL_NAME_PREFERENCE
      social_name.empty? ? civil_name : social_name
    end
  end

  def set_name_preference
    self.name_preference = social_name.blank? ? CIVIL_NAME_PREFERENCE : SOCIAL_NAME_PREFERENCE
  end

  rails_admin do
    configure :birth_date do
      strftime_format '%d-%m-%Y'
    end
  end
end
