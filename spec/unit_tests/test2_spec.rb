require "rails_helper"

RSpec.describe "/projects", type: :request do
    let(:valid_attributes) do
        {
            'title' => 'Test Title',
            'description' => 'Test Description'
        }
    end

    describe 'PATCH /update' do
        context 'with valid parameters' do
            let(:new_attributes) do
                {
                    'id' => '1',
                    'title' => 'Test Title',
                    'description' => 'Test Description',
                    'created_at' => 'Test created_at',
                    'updated_at' => 'Test updated_at' 
                }
            end

        it 'updates the requested project' do
            project = Project.create! valid_attributes
            patch project_url(project), params: {project: new_attributes}
            project.reload
        end

        it 'redirects to the project' do
            project = Project.create! valid_attributes
            patch project_url(project), params: {project: new_attributes}
            project.reload
            expect(response).to redirect_to(project_url(project))
        end
    end
    end
end

