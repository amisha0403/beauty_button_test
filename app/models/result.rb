class Result < ApplicationRecord
	belongs_to :student, class_name: "User", foreign_key: "student_id"
	belongs_to :exam

	enum result: [:pass, :failed]
end
