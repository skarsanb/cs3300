require "rails_helper"

RSpec.describe Project, type: :model do
  before(:each) do
    user = User.create!(email: 'test2@gmail.com', password: 'testing')
    login_as user
  end

  context "validations tests" do
    it "ensures that a title and description must be present" do
      project = Project.new()
      expect(project.valid?).to eq(false) #no title or description so expect false
    end

    it "ensures that a title and description can be anything" do
      project = Project.new(title: "1234", description: "1")
      expect(project.valid?).to eq(true) #there are no limitations for length or if it can only be characters
    end
    
    it "ensures that title and description do not have to be strings" do
      project = Project.new(title: 1234, description: 1)
      expect(project.valid?).to eq(true) #titles and descriptions do not have to be strings
    end
  end
end 
