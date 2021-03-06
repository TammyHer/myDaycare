require 'rails_helper'

RSpec.describe ChildrenController, type: :controller do

  let (:child) { create(:child) }
  let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:google]) }

  before :each do
    session[:user_id] = user.id
  end

  describe "GET index" do
    context "renders index page" do
      it "renders children index page" do
      get :index
      expect(response).to render_template :index
      end
      it "is successful" do
        get :index
        expect(response.status).to eq 200
      end
    end
  end

  describe "GET show" do
    context "renders index page" do
      it "renders children index page" do
      get :show, :user_id => user.id, :id => child.id
      expect(response).to render_template :show
      end
      it "is successful" do
        get :show, :user_id => user.id, :id => child.id
        expect(response.status).to eq 200
      end
    end
  end

  describe "POST" do
    context "it check attendance" do
      it "change the attend status from attend to not_attend" do
        post :attend, :id => child.id
        expect(child.reload.attend).to eq false
      end
      it "change the attend status from not_attend to attend"
      it "render empty json" do
        post :attend , :id => child.id, format: :json
        body = JSON.parse(response.body)
        expect(body).to eq []
      end
    end

    context "it send emails" do
      it "has redirect to the last page" do
        post :send_emails
        expect(response).to redirect_to my_class_path(user.id)
      end
    end

    context "it send MSM" do
      it "redirect to the class page" do
        post :send_text_message
        expect(response).to redirect_to my_class_path(user.id)
      end
    end
  end

  describe "PATCH 'update'" do
    let (:child_params) {
      { name: "name",
        last_name: "last name",
        email: "example@gmail.com"
      }
    }
    let (:child_bad_params) {
      { name: "",
        last_name: "",
        email: "example@gmail.com"
      }
    }
    context "it has valid information" do
      it "redirect to the child show page" do
        patch :update, :child => child_params , :user_id => user.id, :id => child.id
        expect(subject).to redirect_to user_child_path(user.id, child.id)
      end
    end
    context "it doesn't have valid information" do
      it "redirect to the child show page" do
        patch :update, :child => child_bad_params , :user_id => user.id, :id => child.id
        expect(subject).to render_template :edit
      end
    end
  end

#
#   describe "GET #index" do
#   it "returns http success" do
#     get :index
#     expect(response).to have_http_status(:success)
#   end
# end


end
