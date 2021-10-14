feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark and is shown the new version' do
    bookmark = Bookmark.create(url: 'http://www.updateme.com', title: 'Update me!')
    visit('/bookmarks')
    expect(page).to have_link('Update me!', href: 'http://www.updateme.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in(:new_url, with: 'http://www.updated.com')
    fill_in(:new_title, with: 'Updated')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Update me!', href: 'http://www.updateme.com')
    expect(page).to have_link('Updated', href: 'http://www.updated.com')
  end
end
