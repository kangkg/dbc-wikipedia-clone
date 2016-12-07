require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(username: "hello-man", password: "hello") }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: user.id }
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, { id: user.id }
      expect(response).to render_template(:show)
    end
  end

#   describe "GET #new" do
#     it "responds with status code 200" do
#       get :new
#       expect(response).to have_http_status 200
#     end

#     it "assigns a new game to @game" do
#       get :new
#       expect(assigns(:game)).to be_a_new Game
#     end

#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template(:new)
#     end
#   end

#   describe "POST #create" do
#     context "when valid params are passed" do
#       it "responds with status code 302" do
#         post :create,{game: {user_throw:'rock',computer_throw:'paper'}}
#         expect(response).to have_http_status 302
#       end

#       it "creates a new game in the database" do
#         expect {post :create,{game: {user_throw:'rock',computer_throw:'paper'}}}.to change(Game, :count).by(1)
#       end

#       it "assigns the newly created game as @game" do
#         post :create,{game: {user_throw:'rock',computer_throw:'paper'}}
#         expect(assigns(:game)).to eq Game.last
#       end

#       it "sets a notice that the game was successfully created" do
#         post :create,{game: {user_throw:'rock',computer_throw:'paper'}}
#         expect(flash[:notice]).to eq 'Game was successfully created.'
#       end

#       it "redirects to the created game" do
#         post :create,{game: {user_throw:'rock',computer_throw:'paper'}}
#         expect(response).to redirect_to assigns(:game)
#       end
#     end

#     context "when invalid params are passed" do
#       it "responds with status code 200" do
#         post :create, { game: { user_throw: "pineapple" } }
#         expect(response).to have_http_status 200
#       end

#       it "does not create a new game in the database" do
#         expect {post :create,{game: {user_throw:'pinabble'}}}.to change(Game, :count).by(0)
#       end
#       it "assigns the unsaved game as @game" do
#         post :create,{game: {user_throw:'pinreablle'}}
#         expect(assigns(:game).user_throw).to eq 'pinreablle'
#         expect(assigns(:game)).to be_a(Game)
#         expect(assigns(:game).invalid?).to be_truthy
#       end

#       it "renders the :new template" do
#         post :create,{game: {user_throw:'pinreablle'}}
#         expect(response).to render_template(:new)
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "responds with status code 302" do
#       delete :destroy, { id: game.id }
#       expect(response).to have_http_status 302
#     end

#     it "destroys the requested game" do
#       expect { delete(:destroy, { id: game.id }) }.to change(Game, :count).by(-1)
#     end

#     it "sets a notice that the game was destroyed" do
#       delete :destroy, { id: game.id }
#       expect(flash[:notice]).to match /Game was successfully destroyed/
#     end

#     it "redirects to the games list" do
#       delete :destroy, { id: game.id }
#       expect(response).to redirect_to games_url
#     end
#   end
end
