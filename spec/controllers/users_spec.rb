require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(username: "hello-man", password: "hello", role: 'user') }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: { user: {username: 'helloThere', password: "passwordy", role: "user" } }
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        expect {post :create, params: { user: {username: 'helloThere', password: "passwordy", role: "user" }}}.to change(User, :count).by(1)
      end

      it "assigns the newly created game as @game" do
        post :create, params: { user: {username: 'helloThere', password: "passwordy", role: "user" }}
        expect(assigns(:user)).to eq User.last
      end
    end
  end # end post#create

  it "redirects to the created game" do
    post :create, params: { user: {username: 'helloThere', password: "passwordy", role: "user" }}
    expect(response).to redirect_to root_path
  end


  context "when invalid params are passed" do
    it "responds with status code 200" do
      post :create, params: { user: { username: "" } }
      expect(response).to have_http_status 200
    end

    it "does not create a new game in the database" do
      expect {post :create, params: { user: { username: "" } }}.to change(User, :count).by(0)
    end

    it "renders the :new template" do
      post :create, params: { user: { username: "" }}
      expect(response).to render_template(:new)
    end

  end
end






