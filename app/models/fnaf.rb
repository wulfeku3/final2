class Fnaf < ActiveRecord::Base
  validates_presence_of :name, :species, :gender
  validates_format_of :picture, :with => %r{\.(png|jpg|jpeg|gif)$}i, :message => "Please submit the URL of an image ending in .jpg, .jpeg, .png, or .gif OR leave this field blank", :multiline => true, allow_blank: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end