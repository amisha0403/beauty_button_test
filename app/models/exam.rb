class Exam < ApplicationRecord
	has_many :students, :through => :results, class_name: "User", foreign_key: "student_id"
	has_many :results, dependent: :destroy
	has_many :exam_questions, dependent: :destroy

	accepts_nested_attributes_for :students, allow_destroy: true
	accepts_nested_attributes_for :results, allow_destroy: true
	accepts_nested_attributes_for :exam_questions, allow_destroy: true

end
