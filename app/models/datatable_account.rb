class DatatableAccount < ActiveRecord::Base
  include ArelHelpers::ArelTable

  def readonly?
    true
  end
end
