class Course < ApplicationRecord
	belongs_to :student, class_name: "User", foreign_key: "student_id", optional: true

	validates :name, presence: true
	validates_uniqueness_of :name

	enum name: { MCA: 'MCA', MBA: 'MBA', BE: 'BE', BCA: 'BCA' }
end
