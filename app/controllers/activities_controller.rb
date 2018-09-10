class ActivitiesController < ApplicationController
  include Collection

  def index
    @models = Activity.roots.navigated.page index_params[:page]
    super
  end


  def show
    @model = Activity.published.find show_params[:id]
    breadcrumbs t('activities.index.label', default: '<<') => activities_path
    breadcrumbs @model.parent.name => activity_path(@model.parent) if @model.has_parent?
    super
  end
end
