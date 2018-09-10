module PermitsHelper

  # Link status class
  def link_status_permit_partner(id)
    if request.path == permits_path && request.query_parameters[:partner] == id.to_s
      request.query_parameters[:page].nil? && 'is-active active' || 'is-parent'
    end
  end

end
