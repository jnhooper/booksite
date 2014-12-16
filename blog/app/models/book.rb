class Book < ActiveRecord::Base
  # before_save :save_user

  has_many :contributors
  has_many :authors, through: :contributors
  attr_accessor :author_ids

  validates_presence_of :title, :on => :create
  # validates_presence_of :author


end
