class Artist < ApplicationRecord
    belongs_to :artist_category

    has_many :reviews


    validates :name, presence: true
    validates :date_of_birth, presence: true
    validates :location, presence: true
    validates :work, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }


  #  validates :video_url, presence: true
  #  validates :thumbnail_url, presence: true
  

end
