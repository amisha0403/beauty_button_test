class Course < ApplicationRecord
	validates :name, presence: true
	validates_uniqueness_of :name

	enum name: { MCA: 'MCA', MBA: 'MBA', BE: 'BE', BCA: 'BCA' }
end
