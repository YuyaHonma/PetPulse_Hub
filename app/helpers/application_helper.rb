module ApplicationHelper
  def calculate_age(birth_date)
    now = Time.now.utc.to_date
    age = now.year - birth_date.year
    age -= 1 if now.month < birth_date.month || (now.month == birth_date.month && now.day < birth_date.day)
    age
  end
end
