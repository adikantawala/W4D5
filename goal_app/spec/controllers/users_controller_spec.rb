require "rails_helper"

RSpec.describe UsersController, type: :controller do 
  
  describe "GET #new" do 
    it "renders the new user template" do 
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do 
    context 'with invalid params' do
      it "validates the presence of the user's username and password" do
        post :create, params: { user: { username: 'jack_bruce', password: '' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it 'validates that the password is at least 6 characters long' do
        post :create, params: { user: { username: 'jack_bruce', password: 'short' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
    
    context "with valid params" do 
      it "successfully redirects to user's homepage" do 
        post :create, params: { user: { username: "BILLYBOB", password: "password" } }
        user = User.find_by(username: "BILLYBOB")
        
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
  
  # describe "GET #show" do 
  #   it "renders the user's template" do 
  #     get :show
  #     expect(response).to render_template(:show)
  #   end
  # end
  
end