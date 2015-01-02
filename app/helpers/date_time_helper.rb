module DateTimeHelper
	def format_date(date)
		date ? date.to_formatted_s(:rfc822) : nil
	end
end