class Mla < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :constituency
  belongs_to :image
  has_many :comments,as: :commentee, :order => "created_at DESC", :dependent => :destroy
  # has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # validates_attachment :profile_pic, :presence => true,
  # :content_type => { :content_type => ["image/jpeg","image/jpg","image/gif","image/png"] },
  # :size => { :in => 0..1.megabytes }
  
  # validates :name, :presence => true
  # validates :address, :presence => true
  # validates :party, :presence => true

end
