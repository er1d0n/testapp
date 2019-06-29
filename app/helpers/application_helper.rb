module ApplicationHelper
  def page_title
    title = "Morning Glory"
    title = @page_title+ " - " + title if @page_title
    title
  end
  def menu_link_to(text, path, options = {}) #第三引数が省略可能、省略された場合は＝の値がデフォルト値
    content_tag :li do
      link_to_unless_current(text, path, options) do #現在のページの場合はリンクせずにspanタグでテキストを囲むようにすう
        content_tag(:span, text)
      end
    end
  end
end
