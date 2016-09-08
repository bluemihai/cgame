class Haiku < ApplicationRecord
  belongs_to :activity
  belongs_to :author, class_name: 'User', required: false
end
