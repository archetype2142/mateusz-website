module Spina
  module Admin
    class FormSubmissionsController < AdminController
      before_action :set_breadcrumb

      def index
        @form_submissions = Contact.order(created_at: :desc).page(params[:page]).per(10)
        # @form_submissions = Contact.all.order(created_at: :desc)
        # Replace YourFormModel with your actual model name that stores the form submissions
      end

      def show
        @form_submission = Contact.find(params[:id])
      end


      private

      def set_breadcrumb
        add_breadcrumb "Form Submissions"
      end
    end
  end
end
