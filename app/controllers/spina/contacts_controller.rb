module Spina
  class ContactsController < ApplicationController
    def create
      # TODO: Implement contact form handling
      redirect_back(fallback_location: main_app.root_path, notice: 'Thank you for your message!')
    end
  end
end
