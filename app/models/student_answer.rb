class StudentAnswer < ApplicationRecord
	belongs_to :student, class_name: "User", foreign_key: "student_id"
	belongs_to :exam_question
	belongs_to :answer
end
