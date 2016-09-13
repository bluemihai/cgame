# Feature: Feedback
#   As a user
#   I want to share my feedback on C-Game
#   So that I can contribute

#   As an admin
#   I want to read C-Game feedback from users
#   So that I can improve C-Game and have it last for life

feature 'Feedback' do

  # Scenario: User sees feedback form
  #   Given I have a valid account
  #   And I have participated in a past C-Game
  #   When I sign in
  #   Then I see a prompt to fill out a feedback form
  scenario 'User sees feedback form' do
    signin
    game = FactoryGirl.create(:game)
    p 'User.all', User.all
    expect(page).to have_content('Any feedback')
  end

  scenario 'User can leave feedback' do
    
  end

end
