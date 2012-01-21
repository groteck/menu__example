module ApplicationHelper
  def auto_pages
    html = ""
    Page.tree.each_key do |key|
      html << "<li class='plegate'>"
      html << "<a href='/page/" + Page.tree[key].id.to_s + "'>" + Page.tree[key].name + "</a>"
      html << recursive_childs(Page.tree[key]["hijos"].rehash)
      html << "</li>"
    end
    return html.html_safe
  end

  def recursive_childs newtree={}
    newhtml = "<ul>"
    newtree.each_key do |key|
      newhtml << "<li class='plegate'>"
      newhtml << "<a href='/page/" + newtree[key].id.to_s + "'>" + newtree[key].name + "</a>"  
      newhtml << recursive_childs(newtree[key]["hijos"].rehash)
      newhtml << "</li>"
    end
    return newhtml << "</ul>"
  end   
end
