class FeedbacksController < ApplicationController
  def index
    @models = Feedback.navigated.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t '.title'
    @keywords = t '.keywords', default: ''
    @description = t '.description', default: ''
    @header = t '.header'

    if index_params[:page]
      @title = "#{@title} # #{index_params[:page]}"
      @description = "#{@description} # #{index_params[:page]}"
    end
  end

  def show
    @model = Feedback.published.find show_params[:id]

    @schema = {page: 'ItemPage',
               main: 'Dataset'}
    @title = @model.title.blank? ? @model.name : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.header
  end

  private

  def index_params
    params.permit(:page)
  end


  def show_params
    params.permit(:id)
  end
end
