class Request < ActiveRecord::Base
	
	default_scope { where(:is_archive => false) }
	scope :archive, where(:is_archive=> true)

	belongs_to :user

	has_many :comments, :order => "created_at", :dependent => :destroy
	has_many :votes
  	has_many :interests
  	belongs_to :category
  	belongs_to :constituency

	validates :title, :presence => true, :length => {:maximum => 160}
	validates :description, :presence => true
	validates :tags, :presence => true
	validates :category, :presence => true
	validates :constituency, :presence => true


	
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "375x240>" }, :default_url => "/images/:style/missing.png"

    validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg","image/jpg","image/gif","image/png"] },
    :size => { :in => 0..1.megabytes }

	def no_of_votes
		self.votes.all.count
	end
end