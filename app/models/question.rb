class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	belongs_to :exam_question, optional: true
end
