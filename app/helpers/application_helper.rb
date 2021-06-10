module ApplicationHelper

  def page_title
    title = "Wiz"
    title = title + " | " + @page_title if @page_title
    title
  end

end
