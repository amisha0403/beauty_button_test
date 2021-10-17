class Answer < ApplicationRecord
	belongs_to :question
  has_many :student_answers, dependent: :destroy

	accepts_nested_attributes_for :student_answers, allow_destroy: true
	
	validates :answer, presence: true

end
