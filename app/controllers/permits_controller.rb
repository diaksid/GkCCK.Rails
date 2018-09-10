class PermitsController < ApplicationController
  include Collection

  def index
    @description = t '.description', default: ''
    @header = t '.header'
    @models = Permit.navigated

    if index_params[:partner]
      begin
        @partner = Partner.find index_params[:partner]
        @models = @models.where partner: @partner
        @suffix = @partner.name
        @header += " #{@partner.name}"
        @description += " (#{@partner.name})"
        breadcrumbs t('permits.index.label', default: '<<') => permits_path
      end
    end

    @models = @models.page index_params[:page]
    super
  end


  def show
    @model = Permit.published.find show_params[:id]
    @suffix = @model.partner.name
    @header = @model.name
    breadcrumbs t('permits.index.label', default: '<<') => permits_path,
                @model.partner.name => permits_path(partner: @model.partner.id)
    super
  end

  private

  def index_params
    params.permit(:partner, :page)
  end
end
