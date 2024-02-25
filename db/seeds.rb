Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.email = ENV['ADMIN_EMAIL']
  admin.password = ENV['ADMIN_PASSWORD']
end
  
category_names = ['トイレ',
                  '噛む',
                  '吠える',
                  'ハウス',
                  'おすわり',
                  'まて',
                  '伏せ',
                  'おいで',
                  'おて',
                  'ドッグダンス',
                  '引っ張る',
                  '食糞',
                  '歯磨き',
                  'お風呂',
                  'お留守番'
                  ]
category_names.each do |category_name|
  Category.find_or_create_by!(name: category_name) do |category|
    category.name = category_name
  end
end