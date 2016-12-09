module RevisionHelper
  def body_with_links(revision)
    body_str = h(revision.body.dup)
    links = Link.all
    links.each do |link|
      body_str.gsub!(/#{link.word}/, link_to(link.word, article_path(Article.find(link.article_id))))
    end
    body_str.html_safe
  end
end
