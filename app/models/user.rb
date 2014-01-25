class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests
  has_many :comments,as: :commentee, :order => "created_at DESC", :dependent => :destroy
  has_many :votes
  has_many :interests
  has_many :messages
  has_many :set_conversations, class_name: 'Conversation', foreign_key: 'setter_id'
  has_many :get_conversations, class_name: 'Conversation', foreign_key: 'getter_id'

  belongs_to :constituency

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment :profile_pic, :presence => true,
  :content_type => { :content_type => ["image/jpeg","image/jpg","image/gif","image/png"] },
  :size => { :in => 0..1.megabytes }

  validates :username, :presence => true, :length => {:in => 8..16}, :uniqueness => { :case_sensitive => false }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :phone_number, length: {in: 10..10}, :on => :update


  def name
  	"#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end