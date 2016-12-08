require 'rails_helper'

describe CategoriesController do
  let!(:category) { Category.create(name: "I'm a Category.") }

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
    it 'needs testing- however, unsure how to proceed, due to admin access design is undecided.'
  end
end

