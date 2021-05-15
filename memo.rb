require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

if memo_type =="1" 
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  CSV.open('#{file_name}.csv','w') do |test|
    test << ["A","B","C"]
  end

elsif memo_type =="2" 


else 
  puts "1か2を入力してください。"
end