require 'rails_helper'

describe RevisionsController do
  before (:each) do
    controller.session[:user_id] = user.id
  end

  let!(:user) { User.create!(username: "hello-man", password: "hello", role: 'user') }

  let!(:article) { Article.create!(author_id: user.id, status: "published", title: 'test_title') }

  let!(:revision) { Revision.create!(editor_id: user.id, article_id: article.id, body: 'test_body1') }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index, params: {article_id: article.id}
      expect(response).to have_http_status 200
    end

    it "assigns the revisions of the article to @revisions" do
      get :index, params: {article_id: article.id}
      expect(assigns(:revisions)[0]).to eq(revision)
    end
  end

  describe "GET #new" do

    it "responds with status code 200" do
      get :new, params: {article_id: article.id}
      expect(response).to have_http_status 200
    end

    it "assigns a most recent revision to @previous_revision" do
      get :new, params: {article_id: article.id}
      expect(assigns(:previous_revision)).to eq(revision)
    end

    it "renders the :new template" do
      get :new, params: {article_id: article.id}
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create,  params: {article_id: article.id, revision: {body:'test_body2'}}
        expect(response).to have_http_status 302
      end

      it "creates a new revision in the database" do
        expect {post :create,  params: {article_id: article.id, revision: {body:'test_body2'}}}.to change(Revision, :count).by(1)
      end

      it "assigns the newly created revision as @revision" do
        post :create,  params: {article_id: article.id, revision: {body:'test_body2'}}
        expect(assigns(:revision)).to eq Revision.last
      end

      it "redirects to the updated article" do
        post :create,  params: {article_id: article.id, revision: {body:'test_body2'}}
        expect(response).to redirect_to assigns(:article)
      end
    end
    context "when invalid params are passed" do
      it "responds with status code 200" do
        post :create,  params: {article_id: article.id, revision: {body:''}}
        expect(response).to have_http_status 200
      end

      it "does not create a new game in the database" do
        expect {post :create,  params: {article_id: article.id, revision: {body:''}}}.to change(Revision, :count).by(0)
      end

      it "assigns the unsaved game as @game" do
        post :create,  params: {article_id: article.id, revision: {body:''}}
        expect(assigns(:revision).body).to eq ''
        expect(assigns(:revision)).to be_a(Revision)
        expect(assigns(:revision).invalid?).to be_truthy
      end

      it "renders the :new template" do
        post :create,  params: {article_id: article.id, revision: {body:''}}
        expect(response).to render_template(:new)
      end
    end
  end
end
