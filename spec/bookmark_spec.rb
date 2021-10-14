require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  
  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'www.test.com', title: 'Test')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test'
      expect(bookmark.url).to eq 'www.test.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'www.deleteme.com', title: 'Delete me!')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a bookmark url and title' do
      bookmark = Bookmark.create(url: 'www.updateme.com', title: 'Update me!')
      updated =  Bookmark.update(id: bookmark.id, url: 'http://www.updated.com', title: 'Updated')

      expect(updated).to be_a Bookmark
      expect(updated.id).to eq bookmark.id
      expect(updated.title).to eq 'Updated'
      expect(updated.url).to eq 'http://www.updated.com'
    end
  end

  describe '.find' do
    it 'finds a specific bookmark and returns it as an object' do
      bookmark = Bookmark.create(url: 'http://www.findme.com', title: 'Find me!')

      found = Bookmark.find(id: bookmark.id)

      expect(found).to be_a Bookmark
      expect(found.id).to eq bookmark.id
      expect(found.title).to eq 'Find me!'
      expect(found.url).to eq 'http://www.findme.com'
    end
  end
end

