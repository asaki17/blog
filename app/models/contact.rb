class Contact < ApplicationRecord
    validates :name, presence: true
    validates :mail, presence: true
    validates :content, presence: true
    validates :content, length: {in: 1..140}
end
