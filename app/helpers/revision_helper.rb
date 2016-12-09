module RevisionHelper

  def body_with_links_and_images(revision)
    body_str = h(revision.body.dup)
    body_str = add_links(body_str)
    p body_str
    body_str = add_images(body_str)
    body_str.html_safe
  end

  def add_links(str)
    links = Link.all
    p links
    links.each do |link|
      str.gsub!(/(^|\s)(#{link.word})(\.|\s)/, link_to(link.word, article_path(Article.find(link.article_id)))+" ")
    end
    str
  end

  def add_images(str)
    str.gsub(/\[img:\](\S*)\[:img\]/, '<img src="\1"style="width:400px;margin:20px;">')
  end

end
