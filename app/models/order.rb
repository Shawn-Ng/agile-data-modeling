class Order < ApplicationRecord
  belongs_to :user

  # http://blog.blakesimpson.co.uk/read/59-fixing-the-you-tried-to-define-an-association-named-transaction-ruby-on-rails-error
  belongs_to :owner, foreign_key:"order_id", class_name:"Transaction"

  has_many	:order_items
end
