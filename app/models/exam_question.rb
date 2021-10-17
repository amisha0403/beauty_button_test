class ExamQuestion < ApplicationRecord
	has_many :student_answers, dependent: :destroy
	has_many :questions, dependent: :destroy
	belongs_to :exam

	accepts_nested_attributes_for :student_answers, allow_destroy: true
	accepts_nested_attributes_for :questions, allow_destroy: true
end
