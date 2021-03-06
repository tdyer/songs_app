# ActiveRecord is a Ruby Gem that is a
# Object to Relational Mapper (ORM)
# translates Ruby object to Rows in a DB table.
class Song < ActiveRecord::Base

  # validations, check that an attribute is correct
  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,2}(\.\d{0,2})?\z/ }
  validates :duration, :numericality => { :only_integer => true}

end
