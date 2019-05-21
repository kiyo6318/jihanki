# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# # 例

# # irb
# require '/Users/tanabe/workspace/myapp/test.rb'
# # （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# # 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new

# # 作成した自動販売機に100円を入れる
# vm.slot_money (100)

# # 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

# # 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class VendingMachine
   # ステップ０　お金の投入と払い戻しの例コード
   # ステップ１　扱えないお金の例コード

   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
   MONEY = [10, 50, 100, 500, 1000].freeze

   # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
   def initialize
     # 最初の自動販売機に入っている金額は0円(このクラスの初期値として設定している)
     @slot_money = 0
   end

   # 投入金額の総計を取得できる。
   def current_slot_money
     # 自動販売機に入っているお金を表示する
     @slot_money
   end

   def init_sales
     @sales = 0
   end

   def sales
     @sales
   end

   # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
   # 投入は複数回できる。
   def slot_money(money)
     # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
     # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
     return false unless MONEY.include?(money)
     # 自動販売機にお金を入れる
     @slot_money += money
   end

   # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
   def return_money
     # 返すお金の金額を表示する
     puts @slot_money
     # 自動販売機に入っているお金を0円に戻す
     @slot_money = 0
   end

   def setting
     @juices = [{name: "cola",price:120,stock:5},{name: "redbull",price:200,stock:5},{name: "water",price:100,stock:5}]
   end

   def can_buy
    @juices.each do |juice|
      if juice[:price] <= @slot_money && juice[:stock]>=1
        puts "#{juice[:name]}買えます"
      else
        puts "#{juice[:name]}買えません"
      end
    end
  end

  def buy
    puts "1:コーラ"
    puts "2:レッドブル"
    puts "3:水"
    @choice = gets.to_i
    case @choice
    when 1
      puts @juices[0][:name]
      if @slot_money >= @juices[0][:price] && @juices[0][:stock] >= 1
        puts "コーラがでてきました"
        @slot_money -= @juices[0][:price]
        @sales += @juices[0][:price]
        @juices[0][:stock] -= 1
      elsif @slot_money < @juices[0][:price]
        puts "お金が足りません"
      elsif @juices[0][:stock] == 0
        puts "売り切れです"
      end
    when 2
      puts @juices[1][:name]
      if @slot_money >= @juices[1][:price] && @juices[1][:stock] >= 1
        puts "レッドブルがでてきました"
        @slot_money -= @juices[1][:price]
        @sales += @juices[1][:price]
        @juices[1][:stock] -= 1
      elsif @slot_money < @juices[1][:price]
        puts "お金が足りません"
      elsif @juices[1][:stock] == 0
        puts "売り切れです"
      end
    when 3
      puts @juices[2][:name]
      if @slot_money >= @juices[2][:price] && @juices[2][:stock] >= 1
        puts "水がでてきました"
        @slot_money -= @juices[2][:price]
        @sales += @juices[2][:price]
        @juices[2][:stock] -= 1
      elsif @slot_money < @juices[2][:price]
        puts "お金が足りません"
      elsif @juices[2][:stock] == 0
        puts "売り切れです"
      end
    end
  end
end

vm = VendingMachine.new