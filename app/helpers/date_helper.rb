module DateHelper
  def get_date(created_at, scope_type = 'common_scope')
	created_at = created_at.to_time
	other_values = [21, 31, 41, 51]
	few_values = (5..20).to_a
	custom_date = distance_of_time_in_words(Time.now, created_at)
	number = custom_date.gsub(/\D/, '').to_i
	scope_type = (other_values.include? number) ? 'other_scope' : (few_values.include? number) ? 'few_scope' : scope_type
	distance_of_time_in_words(Time.now, created_at, scope: "datetime.distance_in_words.#{scope_type}")
  end
end