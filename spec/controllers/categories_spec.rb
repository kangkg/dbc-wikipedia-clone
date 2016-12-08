require 'rails_helper'

describe CategoriesController do
  let!(:category) { Category.create(name: "I'm a Category.") }
  let!(:user) { User.create!(username: "user-man", password: "user", role: 'user') }
  let!(:admin) { User.create!(username: "admin-man", password: "admin", role: 'superadmin') }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: category.id }
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, params: { id: category.id }
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

  describe "POST #create and #destroy" do
    it 'needs additional testing- however, unsure how to proceed, due to admin access design is undecided.'

    it "responds with status code 302" do
      post :create, params: { category: { name: "I'm a Category" } }
      expect(response).to have_http_status 302
    end

    it "does NOT assign a new category in the user lacks permissions" do
      session[:user_id] = user.id
      expect{ post :create, params: { category: { name: "I'm a Category" } } }.to change(Category, :count).by(0)
    end

    it "does assign a new category if user has permissions (admin)" do
      session[:user_id] = admin.id
      expect{ post :create, params: { category: { name: "I'm a Category" } } }.to change(Category, :count).by(1)
    end

    it "does NOT assign a new category if admin doesn't give a category name" do
      session[:user_id] = admin.id
      expect{ post :create, params: { category: { name: ''  }} }.to change(Category, :count).by(0)
    end

    # it "assigns the newly created article as @article" do
    #   post :create, params: { article: { title: "Article", author_id: user.id, status: "unpublished" } }
    #   expect(assigns(:article)).to eq (Article.last)
    # end

    # it "redirects to the created game" do
    #   post :create, params: { article: { title: "Article", author_id: user.id, status: "unpublished" } }
    #   expect(response).to redirect_to (Article.last)
    # end

  end
end




