require 'rails_helper'

describe ArticlesController do
  let!(:user) { User.create(username: 'a', password: 'b', role: 'user') }
  let!(:article) { Article.create!(title: "Article", author_id: user.id, status: "published") }
  let!(:category) { Category.create!(name: "category man") }
  let!(:unpublished_article) { Article.create!(title: "unpub-arty", author_id: user.id, status: "unpublished") }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: article.id }
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, params: { id: article.id }
      expect(response).to render_template(:show)
    end

  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before (:each) do
      controller.session[:user_id] = user.id
    end

    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: {
          article: { title: "Article", author_id: user.id, status: "unpublished", category: {name: category.name } }
        }
        expect(response).to have_http_status 302
      end

      it "assigns a new article in the DB" do
        expect{ post :create, params: {
          article: { title: "Article", author_id: user.id, status: "unpublished", category: {name: category.name } } } }
        .to change(Article, :count).by(1)
      end

      it "assigns the newly created article as @article" do
        post :create, params: {
          article: { title: "Article", author_id: user.id, status: "unpublished", category: {name: category.name } }
        }
        expect(assigns(:article)).to eq (Article.last)
      end

      it "redirects to the created game" do
        post :create, params: {
          article: { title: "Article", author_id: user.id, status: "unpublished", category: {name: category.name } }
        }
        expect(response).to redirect_to (Article.last)
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 200" do
        post :create, params: { article: { status: "unpublished", category: {name: category.name }}}
        expect(response).to have_http_status 200
      end

      it "does not create a new article in the database" do
        expect{ post :create, params: { article: { status: "unpublished", category: {name: category.name }}} }
        .to change(Article, :count).by(0)
      end

      it "assigns the unsaved article as @article" do
        post :create, params: { article: { status: "unpublished", category: {name: category.name }}}
        expect(assigns(:article)).not_to eq(Article.last)
      end

      it "renders the :new template" do
        post :create, params: { article: { author_id: user.id, status: "unpublished", category: {name: category.name }}}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the user has admin" do
      before (:each) do
        controller.session[:user_id] = user.id
        controller.current_user.role = "admin"
      end

      it "responds with status code 302" do
        delete :destroy, params: { id: article.id }
        expect(response).to have_http_status 302
      end

      it "destroys the requested article" do
        expect { delete(:destroy, params: { id: article.id }) }.to change(Article, :count).by(-1)
      end

      it "redirects to the articles list" do
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to articles_path
      end
    end

    context "when a user doesn't have admin" do
      it "doesn't destroy the requested article and is logged in" do
        session[:user_id] = user.id
        expect { delete(:destroy, params: { id: article.id }) }.to change(Article, :count).by(0)
      end
    end
  end
end
