class Image < ActiveRecord::Base
	has_many :mlas

	has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	  validates_attachment :pic, :presence => true,
	  :content_type => { :content_type => ["image/jpeg","image/jpg","image/gif","image/png"] },
	  :size => { :in => 0..1.megabytes }
end
