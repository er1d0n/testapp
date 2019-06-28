class LessonController < ApplicationController
  def step1
    render plain: "こんにちは、#{params[:name]}さん"
  end
  #paramsでコントローラ名とアクション名を呼び出す
  def step2
  #render 直接文字列を送信
    render plain: params[:controller] + "#" + params[:action]
  end
  #redirect_toメソッドでstep3を表示するとstep4にリダイレクトされる
  def step3
    redirect_to action: "step4"
  end
  def step4
    render plain: "step4に移動しました"
  end
  def step5
    flash[:notice] = "step6に移動します"
    redirect_to action: "step6"
  end
  def step6
    render plain: flash[:notice]
  end
  def step7
    @price = (2000*1.08).floor
  end
  #HTML特殊文字の変換,<>が&lt;&gt;二変換される
  def step9
    @comment = "<script>alert('危険！')</script>こんにちは"
  end
  #<%==>タグをタグとして表示
  def step10
    @comment = "<strong>安全なＨＴＭＬ</strong>"
  end
  #sprintf 第一引数二書式を指定、第二引数以降に書式を埋め込む変数を並べる
  #step11.html.erb　%d(整数) %f(浮動小数点数) %s(文字列)
  # %3（幅）.2(精度）f　幅はこの桁数より小さい場合左は半角空白がうめられる。精度は小数点以下の桁数を指定
  def step11
    @population = 704414
    @surface = 141.31
  end
  #strftime 日時日付オブジェクトのメソッド
  def step12
    @time = Time.current
  end
  #number_with_delimiterメソッド　3桁ごとニカンマを入れて数字表示
  def step13s
    @population = 127767944
  end
  #ヘルパーメソッド
  def step14
    @message = "ごきげんいかが？\nRailsの勉強をがんばりましょう"
  end
end
