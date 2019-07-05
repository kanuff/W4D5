require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

  describe "get#index" do
    it "renders the users index" do 
        get(:index)
        expect(response).to render_template(:index)
    end
  end

  describe "get#new" do
    it "renders the users new" do 
      get(:new)
      expect(response).to render_template(:new)
    end
  end

  describe "post#create" do
    let(:valid_params) { { user: { username: 'tim', password: 'starwars' } } }
    let(:invalid_params) { { user: { password: 'starwars' } } }

    context "with valid params" do
      it "creates the user" do 
        post(:create, params: valid_params)
        expect(response).to redirect_to(users_url)
      end
    end
    
    context "with invalid params" do
      before(:each) do
        post(:create, params: invalid_params)
      end

      it "shows an error on the page" do
        expect(flash[:errors]).to be_present
      end

      it "redirects to new_user_url" do
        expect(response).to render_template(:new)
      end
    end
  end




end