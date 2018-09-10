class TargetsController < ApplicationController
  include Collection

  def index
    @models = Target.navigated.page index_params[:page]
    super
  end


  def show
    @model = Target.published.find show_params[:id]
    breadcrumbs t('targets.index.label', default: '<<') => targets_path
    super
  end
end
