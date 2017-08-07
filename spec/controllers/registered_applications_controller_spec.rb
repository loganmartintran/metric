require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:user) { User.create!(email: 'user@user.com', password: 'password') }
  let(:app) { RegisteredApplication.create!(name: 'app', url: 'app@app.com', user: user) }

  describe "GET #index" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :show, {id: app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: app.id}
      expect(response).to render_template :show
    end

    it "assigns app to @registered_application" do
      get :show, {id: app.id}
      expect(assigns(:app)).to eq(app)
    end
  end

  describe "GET #new" do
    before do
      sign_in user
    end
    
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "initializes a new @registered_application" do
      get :new
      expect(assigns(:app)).not_to be_nil
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before do
      sign_in user
    end

    it "increases the number of RegisteredApplications by 1" do
      expect{ post :create, app: {name: 'app', url: 'app@app.com', user: user} }.to change(RegisteredApplication,:count).by(1)
    end

    it "assigns the new RegisteredApplication to a new @registered_application" do
      post :create, app: {name: 'app', url: 'app@app.com', user: user}
      expect(assigns(:app)).to eq RegisteredApplication.last
    end

    it "redirects to the new RegisteredApplication" do
      post :create, app: {name: 'app', url: 'app@app.com', user: user}
      expect(response).to redirect_to RegisteredApplication.last
    end
  end

  describe "GET #edit" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :edit, {id: app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: app.id}
      expect(response).to render_template :edit
    end

    it "assigns app to be edited to @registered_application" do
      get :edit, {id: app.id}
      app_instance = assigns(:app)
      expect(app_instance.id).to eq(app.id)
      expect(app_instance.name).to eq(app.name)
      expect(app_instance.url).to eq(app.url)
    end
  end

  describe "PUT #update" do
    before do
      sign_in user
    end

    it "updates the app with the correct attributes" do
      new_name = "new name"
      new_url = "new url"

      put :update, id: app.id, app:{name: new_name, url: new_url, user: user}

      updated_app = assigns(:app)
      expect(updated_app.id).to eq(app.id)
      expect(updated_app.name).to eq(new_name)
      expect(updated_app.url).to eq(new_url)
      expect(updated_app.user).to eq(app.user)
    end

    it "redirects to the updated app" do
      new_name = "new name"
      new_url = "new url"

      put :update, id: app.id, app:{name: new_name, url: new_url, user: user}

      expect(response).to redirect_to app
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in user
    end

    it "deletes the app" do
      delete :destroy, {id: app.id}
      count = RegisteredApplication.where({id:app.id}).size
      expect(count).to eq(0)
    end

    it "redirects to the #index view" do
      delete :destroy, {id: app.id}
      expect(response).to redirect_to registered_applications_path
    end
  end

end
