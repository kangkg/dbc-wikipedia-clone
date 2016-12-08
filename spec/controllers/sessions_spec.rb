require 'rails_helper'

describe SessionsController do
  let!(:user) { User.create!(username: "hello", password: "hello", role: 'user') }

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: { sessions: {username: 'hello', password: 'hello'} }
        expect(response).to have_http_status 302
      end

      it " user can login and session[:id] is set" do
        post :create, params: { sessions: {username: 'hello', password: 'hello'} }
        expect(session[:user_id]).to eq user.id
      end
      it " user cannot login with incorrect login params" do
        post :create, params: { sessions: {username: 'hello', password: 'wrong-password'} }
        expect(session[:user_id]).to be nil
      end
# need test for insuccessful login
      # it "assigns the newly created game as @game" do
      #   post :create, params: { user: {username: 'helloThere', password: "passwordy", role: "user" }}
      #   expect(assigns(:user)).to eq User.last
      # end
    end

  describe "DELETE #destroy" do
    it 'logs the user out'
  end
  end # end post#create

end






