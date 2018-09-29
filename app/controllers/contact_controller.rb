class ContactController < ApplicationController
  # protect_from_forgery only: [:deliver]

  def show
    @schema = {page: 'ContactPage'}
    @title = t '.title'
    @keywords = t '.keywords', default: ''
    @description = t '.description', default: ''
    @header = t '.header'
  end


  def deliver
    @model = ContactForm.new(deliver_params)
    if verify_recaptcha(model: @model)
      if @model.valid?
        if ContactMailer.contact_form(@model).deliver
          flash[:notice] = t '.success'
        else
          flash[:alert] = t '.errors.send'
        end
      else
        flash[:alert] = t '.errors.validation'
      end
    else
      flash[:alert] = t '.errors.recaptcha'
    end
    redirect_back fallback_location: contact_path
  end

  private

  def deliver_params
    params.require(:contact).permit(:name, :email, :phone, :subject, :content)
  end
end
