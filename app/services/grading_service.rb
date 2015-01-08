class GradingService
	def self.assign_grade(term_class, marks)
		case term_class
			when 1..5 then grade_primary(marks)
			when 6..12 then grade_secondary(marks)
		end
	end

	def self.grade_primary(marks)
		case marks
			when 90..100 	then { marks_obtained: marks, grade: 'A+', grade_point: 5.0 }
			when 75..89 	then { marks_obtained: marks, grade: 'A', grade_point: 4.0 }
			when 56..74 	then { marks_obtained: marks, grade: 'B', grade_point: 3.0 }
			when 35..55 	then { marks_obtained: marks, grade: 'C', grade_point: 2.0 }
			when 0..34 		then { marks_obtained: marks, grade: 'D', grade_point: 2.0 }
		end
	end

	def self.grade_secondary(marks)
		case marks
			when 91..100 	then { marks_obtained: marks, grade: 'A1', grade_point: 10.0 }
			when 81..90 	then { marks_obtained: marks, grade: 'A2', grade_point: 9.0 }
			when 71..80 	then { marks_obtained: marks, grade: 'B1', grade_point: 8.0 }
			when 61..70 	then { marks_obtained: marks, grade: 'B2', grade_point: 7.0 }
			when 51..60 	then { marks_obtained: marks, grade: 'C1', grade_point: 6.0 }
			when 41..50 	then { marks_obtained: marks, grade: 'C2', grade_point: 5.0 }
			when 33..40 	then { marks_obtained: marks, grade: 'D',  grade_point: 4.0 }
			when 21..32 	then { marks_obtained: marks, grade: 'E1', grade_point: 3.0 }
			when 0..20 		then { marks_obtained: marks, grade: 'E2', grade_point: 2.0 }
		end
	end

	def self.co_scholastic_grade(marks)
		case marks
			when 4.1..5.0 then 'A'
			when 3.1..4.0 then 'B'
			when 2.1..3.0 then 'C'
			when 1.1..2.0 then 'D'
			when 0.0..1.0 then 'E'
		end
	end
end