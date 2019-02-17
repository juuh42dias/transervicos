# frozen_string_literal: true

json.array!(@services) do |service|
  json.extract! service, :id, :area, :subarea, :name, :description, :phone, :website
  json.url service_url(service, format: :json)
end
