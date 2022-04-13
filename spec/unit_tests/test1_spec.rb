require "rails_helper"

RSpec.describe "/projects", type: :request do
    #current_user = User.new(email: 'test@gmail.com', password: 'testing')
    let(:valid_attributes) do
        {
            'title' => 'Test Title',
            'description' => 'Test Description'
        }
    end

    describe 'DELETE /destroy' do
        it 'deletes or destroys the requested project' do
            project = Project.create! valid_attributes
            expect do
                delete project_url(project)
            end.to change(Project, :count).by(-1)
        end

        it 'redirects to the project list' do
            project = Project.create! valid_attributes
            delete project_url(project)
            expect(response).to redirect_to(projects_url)
        end
    end

end
