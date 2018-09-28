class StaticsController < ApplicationController
  def home
    @title = t '.title'
    @keywords = t '.keywords', default: ''
    @description = t '.description', default: ''
    @header = t '.header'
    @suffix = nil

    @breadcrumbs = nil

    begin
      @activities = Activity.published.find [1, 3, 4, 6]
    rescue
      @activities = nil
    end
    begin
      @targets = Target.published.limit(5) #.find [1, 2, 3, 4, 5]
    rescue
      @targets = nil
    end
  end


  def about
    @title = t '.title'
    @keywords = t '.keywords', default: ''
    @description = t '.description', default: ''
    @header = t '.header'
  end


  def privacy
    @title = t '.title'
    @keywords = t '.keywords', default: ''
    @description = t '.description', default: ''
    @header = t '.header'
  end
end
