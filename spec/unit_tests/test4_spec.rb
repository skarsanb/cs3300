require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
    before(:each) do
        user = User.create!(email: 'test2@gmail.com', password: 'testing')
        sign_in user
    end
    let(:valid_attributes) do
        {
            'title' => 'Test Title',
            'description' => 'Test Description'
        }
    end
    describe 'GET /new' do
        it 'returns a success response' do
            #get new_project_url
            get :new
            expect(response).to be_successful
        end
    end
    describe 'GET /edit' do
        it 'returns a success response' do
            project = Project.new(valid_attributes) 
            #project.user = current_user
            project.save
            #get edit_project_url(project)
            get :edit, params: {id: project}
            expect(response).to be_successful
        end
    end
end