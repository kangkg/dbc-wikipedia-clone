module RevisionHelper

  def body_with_links_and_images(revision)
    body_str = revision.body.dup
    body_str = add_links(body_str)
    body_str = add_images(body_str)
    sanitize(body_str.html_safe,tags: %w(strong em img a p u br hr),attributes:%w(src style href))
  end

  def add_links(str)
    links = Link.all
    links.each do |link|
      str.gsub!(/(#{link.word})/, link_to(link.word, article_path(Article.find(link.article_id)))+" ")
    end
    str
  end

  def add_images(str)
    str.gsub(/\[img:\](\S*)\[:img\]/, '<img src="\1"style="width:600px;margin:20px;">')
  end
end
