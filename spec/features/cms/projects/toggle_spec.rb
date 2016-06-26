require 'rails_helper'

feature "Toggle the existing project's accepted status", js: true do

  context 'when toggling true from false' do
    scenario 'they see unaccepted icon and visible button' do
      create(:project, :accepted)
      sign_in_and_redirect_to("/cms/projects")
      expect(page).to have_css('h1', 'Project')
      within(:xpath, '//tbody/tr[1]') do
        find("button[class^='toggleButton']").click
        expect(page).to have_selector("svg[name='unaccepted']")
        expect(page).to have_selector("svg[class^='visibleIcon']")
      end
    end
  end

  context 'when toggling false from true' do
    scenario 'they see accepted icon and invisible button' do
      create(:project, :accepted, accepted: false)
      sign_in_and_redirect_to("/cms/projects")
      expect(page).to have_css('h1', 'Project')
      within(:xpath, '//tbody/tr[1]') do
        find("button[class^='toggleButton']").click
        expect(page).to have_selector("svg[name='accepted']")
        expect(page).to have_selector("svg[class^='inVisibleIcon']")
      end
    end
  end
end

