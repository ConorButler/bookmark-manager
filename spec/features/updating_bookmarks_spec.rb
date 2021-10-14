feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark and is shown the new version' do
    Bookmark.create(url: 'http://www.updateme.com', title: 'Update me!')
    visit('/bookmarks')
    expect(page).to have_link('Update me!', href: 'http://www.updateme.com')

    first('.bookmark').fill_in :new_url, with: 'http://www.updated.com'
    first('.bookmark').fill_in :new_title, with: 'Updated'
    first('.bookmark').click_button 'Update'

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Updated', href: 'http://www.updated.com')
  end
end
