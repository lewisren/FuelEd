require 'spec_helper'

describe SchoolsController do

  before :each do
    @fake_school = {:id => 1, :name => "school", :location => "california"}
    @schl = School.new(:name => "school", :location => "california")
  end

  describe "adding a school" do
    it "should call create method in School model" do
      School.should_receive(:new).and_return(@schl)
      get :create, {:school => @fake_school}
    end
    it "should redirect to the school details page" do
      School.stub(:new).and_return(@schl)
      get :create, {:school => @fake_school}
      response.should redirect_to "/schools/#{@fake_school[:id]}"
    end
  end

  describe "viewing a school" do
    it "should redirect to school details page" do
      @schl.save
      get :show, {:id => @fake_school[:id]}
      response.should render_template :show
    end
  end

end
