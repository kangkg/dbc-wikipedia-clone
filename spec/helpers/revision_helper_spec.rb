require 'rails_helper'
require "erb"
include ERB::Util

describe RevisionHelper do

  let!(:user) { User.create!(username: "hello-man", password: "hello", role: 'user') }

  let!(:article) { Article.create!(author_id: user.id, status: "published", title: 'test_title') }

  let!(:revision) { Revision.create!(editor_id: user.id, article_id: article.id, body: 'test_body1') }

  let!(:link) { Link.create!(word: 'Coffee', article_id: article.id) }

  it "removes dangerous text from being displayed as html" do
    dangerous_str = '<script></script>'
    revision.body = dangerous_str
    expect(body_with_links_and_images(revision)).to eq('&lt;script&gt;&lt;/script&gt;')
  end

  it "returns text with keywords turned into links" do
    link = 'Coffee'
    revision.body = link
    expect(body_with_links_and_images(revision)).to include('>Coffee</a>')
  end
end
