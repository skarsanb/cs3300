require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  before(:each) do
    user = User.create!(email: 'test2@gmail.com', password: 'testing')
    login_as user
  end
  
  context "GET #index" do
    it "returns a success response" do
      get :index
      #expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end
 