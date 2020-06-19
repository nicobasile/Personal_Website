class Contact < ActiveRecord::Base
    # Contact form validations, 
    # Eventually can make email require @
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
end