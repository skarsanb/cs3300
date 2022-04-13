require "rails_helper"

RSpec.describe "/projects", type: :request do
    let(:valid_attributes) do
        {
            #'id' => '1',
            'title' => 'Test Title',
            'description' => 'Test Description',
            'created_at' => 'Test created_at',
            'updated_at' => 'Test updated_at'
        }
    end

    describe 'POST /create' do
        context 'with valid parameters' do
            it 'creates a new Project' do
                expect do
                    post projects_url, params: {project: valid_attributes} 
                end.to change(Project, :count).by(1)
            end

            it 'redirects to the created project' do
                post projects_url, params: {project: valid_attributes}
                expect(response).to redirect_to(project_url(Project.last))
            end
        end
    end
    end

                     

