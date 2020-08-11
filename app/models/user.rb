class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  has_many :comments
  has_many  :posts

  #profile pic
  has_one_attached :profile_pic
  after_commit :add_default_profile_pic, on: %i[create update]

  def profile_pic_default
    if profile_pic.attached? 
      profile_pic.variant(resize: "150x150!").processed
    else 
      "/default_profile.jpg"
    end
  end

  private
  
  def add_default_profile_pic
    unless profile_pic.attached?
      profile_pic.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.jpg'
          )
        ),
        filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
      end
    end
  end
