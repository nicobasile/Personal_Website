class ContactsController < ApplicationController
    # GET request to /contact-me
    # Show new contact form
    def new
        @contact = Contact.new
    end
    
    # POST request to /contacts
    def create
        # Assignment of form fields to contact object
        @contact = Contact.new(contact_params)
        # Save contact object to database
        if @contact.save
            # Store form fields into local variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            # Plug variables into contact mailer email and send
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message Sent"
            redirect_to new_contact_path
        else
            # Flash hash is used to store message after redirect
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    private
        # To collect data from form, we need to use
        # strong parameters and whitelist form fields
        def contact_params
            params.require(:contact).permit(:name,:email,:comments)
        end
end