require 'rails_helper'

describe 'User can see articles' do
  context 'an article exists' do
    before do
      create(:article)
    end
    it 'display article on the page' do
      visit root_path
      expect(page).to have_content('Sprint on Rails')
    end
  end
end
