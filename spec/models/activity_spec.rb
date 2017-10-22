require 'rails_helper'

RSpec.describe Activity, type: :model do
  before(:each) { @activity = FactoryGirl.create(:activity) }

  subject { @activity }

  it { should respond_to(:name, :color) }

  it "#color works" do
    expect(@activity.color).to match '#E1F0FE'
    @activity.mildness = 1
    expect(@activity.color).to match '#B5BD83'
    @activity.mildness = 5
    expect(@activity.color).to match '#ED9E87'
  end

end
