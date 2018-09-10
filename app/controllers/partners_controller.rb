class PartnersController < ApplicationController
  include Collection

  def index
    @models = Partner.navigated.page index_params[:page]
    super
  end


  def show
    @model = Partner.published.find show_params[:id]
    breadcrumbs t('partners.index.label', default: '<<') => partners_path
    super
  end
end
