module LinkHelper

  def link_status(path)
    if request.path == path && request.query_string.blank?
      'is-active active'
    elsif request.path == path || (path != '/' && request.path.index(path) == 0)
      'is-parent'
    end
  end

end
