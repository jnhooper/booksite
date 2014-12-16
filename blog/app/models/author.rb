class Author < ActiveRecord::Base

  has_many :contributors
  has_many :books, through: :contributors

  attr_accessor :book_ids

end

