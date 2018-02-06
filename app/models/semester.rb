class Semester < ActiveRecord::Base
  validates :info, presence: true
  has_many :courses
end

