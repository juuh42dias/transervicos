# frozen_string_literal: true

class Service < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_votable

  validates :subarea, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :website, format: {
    with: %r{\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z}i,
    message: 'Site deve estar no formato: www.meusite.com.br'
  }, if: proc { |a| a.website.present? }
  validate :description_cannot_contain_forbidden_word
  validate :name_cannot_contain_forbidden_word

  has_one :address, dependent: :destroy
  belongs_to :subarea
  belongs_to :user

  accepts_nested_attributes_for :address

  default_scope { order('name ASC') }

  before_save { |service| service.website = url_with_protocol(service.website) unless service.website.blank? }
  scope :text_search, lambda { |text|
    # rubocop:disable Metrics/LineLength
    where('unaccent(lower(services.name)) LIKE unaccent(:text) OR unaccent(lower(services.description)) LIKE unaccent(:text)', text: "%#{text.downcase}%")
  }
  scope :state_search, ->(state_id) { joins(address: :state).where(states: { id: state_id }) }
  scope :city_search, ->(city_id) { joins(address: :city).where(cities: { id: city_id }) }
  scope :list_services_with_reports, -> { joins('join reports on reports.service_id = services.id').distinct }

  def owner
    user.preferred_name
  end

  def reports_count
    Service.joins("join reports on reports.service_id = services.id and services.id = #{id}").count
  end

  private

  FORBIDDEN_WORD_ERROR_MESSAGE = 'do serviço contém palavras não permitidas. As palavras são: '

  def description_cannot_contain_forbidden_word
    forbidden_words_in_description = forbidden_words_in description
    validate_forbidden_words :description, forbidden_words_in_description
  end

  def name_cannot_contain_forbidden_word
    forbidden_words_in_name = forbidden_words_in name
    validate_forbidden_words :name, forbidden_words_in_name
  end

  def forbidden_words_in(content)
    word_list = ForbiddenWord.all.map(&:word)
    word_list.keep_if do |word|
      content =~ /\b#{Regexp.escape(word)}\b/i
    end
  end

  def validate_forbidden_words(field, forbidden_words)
    message = FORBIDDEN_WORD_ERROR_MESSAGE + forbidden_words.join(', ') + '.'
    errors.add(field, message) unless forbidden_words.empty?
  end

  def url_with_protocol(url)
    /^https?/i.match?(url) ? url : "http://#{url}"
  end
end
