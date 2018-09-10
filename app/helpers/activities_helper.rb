module ActivitiesHelper

  def link_status_activity(model)
    if @model && @model.instance_of?(Activity)
      if model == @model
        'is-active active'
      elsif model.descendants.exists? @model.id
        'is-parent'
      end
    end
  end

end
