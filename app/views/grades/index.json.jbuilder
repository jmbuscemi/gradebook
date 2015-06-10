json.array!(@grades) do |grade|
  json.extract! grade, :id, :grade, :assignment_name, :student_id
  json.url grade_url(grade, format: :json)
end
