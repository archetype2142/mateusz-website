module Spina
  class ContactsController < ApplicationController
    def create
      # TODO: Implement contact form handling
      byebug

      Contact.create!(contact_params)

      redirect_back(fallback_location: main_app.root_path, notice: 'Thank you for your message!')
    end

    private

    def contact_params
      params.permit(:email, :name, :message, :phone)
    end
  end
end
