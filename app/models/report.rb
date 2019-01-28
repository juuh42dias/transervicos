class Report < ApplicationRecord
  belongs_to :service
  validates :detail, presence: true
  validates :service, presence: true
  validates :email, presence: true

  def self.get_by_service(service_id)
    Report.where(service_id: service_id)
  end
end
