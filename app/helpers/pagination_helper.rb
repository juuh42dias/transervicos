# frozen_string_literal: true

module PaginationHelper
  def paginate_services(services, records_per_page, page = 1)
    services.paginate(page: page, per_page: records_per_page)
  end
end
