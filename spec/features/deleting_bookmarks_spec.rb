feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.deleteme.com', title: 'Delete me!')
    visit('/bookmarks')
    expect(page).to have_link('Delete me!', href: 'http://www.deleteme.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Delete me!', href: 'http://www.deleteme.com')
  end
end
