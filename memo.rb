require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

if memo_type =="1" 
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  puts "メモしたい内容を記入してください\n完了したら　Ctrl+Dを押してください"
  memos = $stdin.read.split("\n")

  CSV.open("#{file_name}.csv","w") do |csv|
    csv << memos
  end


elsif memo_type =="2" 
  csv_files = []
  all_files = Dir::entries(".")
  all_files.each do |file|
    if(file.include?(".csv")==true)
      csv_files << file
    end
  end
  puts "編集可能なCSVは下記の通りです"
  puts csv_files
  puts "編集したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp

  CSV.foreach("#{file_name}.csv") do |row|
    memos = row
  end
  puts "編集を行うメモは下記の通りです"
  memos.each do |memo|
    puts memo
  end

  puts "編集を行う行数を入力してください"
  memo_line = gets
  if(memo_line =~ /^[0-9]+$/)
    memo_line = memo_line.to_i
    if(memos.size >= memo_line)
      puts "選択した行にメモしたい内容を記入してください"
      memo = gets.chomp
      memos[memo_line-1] = memo
      CSV.open("#{file_name}.csv","w") do |csv|
        csv << memos
      end
    else
      puts "入力した行は存在しません。"
    end
  else
    puts "不正な値が入力されました"
  end

else 
  puts "1か2を入力してください。"
end