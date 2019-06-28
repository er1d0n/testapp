module LessonHelper
  def tiny_format(text) #tiny_formatメソッド　改行をＨＴＭＬのｂｒタグに置換
    h(text).gsub("\n", "<br />").html_safe #h HTML特殊文字の変換,gsub 改行文字/nをｂｒに一括置換　html.erbでbrをそのまま出力
  end
end
