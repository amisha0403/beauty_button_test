class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :token_authenticatable

  has_many :authentication_tokens
  has_many :student_answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :answered_exams, :class_name => "exam", :through => :results, :foreign_key => "exam_id"
  has_one :course

  validates :name, :enrolment_number, presence: true
  validates :enrolment_number, uniqueness: true
end
