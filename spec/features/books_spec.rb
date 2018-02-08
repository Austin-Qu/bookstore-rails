require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:book) do
    FactoryGirl.create(:book)
  end

  before do
    user
    book
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit books_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a list of books' do
      book1 = FactoryGirl.create(:book)
      book2 = FactoryGirl.create(:second_book)
      visit books_path
      expect(page).to have_content(/Title|Another/)
    end
  end

  describe 'new' do
    it 'has an entry point from the homepage' do
      visit books_path

      click_link("new_book_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      book_delete = FactoryGirl.create(:book)
      visit books_path

      click_link("delete_book_#{book_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_book_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new book page' do
      fill_in 'book[title]', with: "Some Title"
      fill_in 'book[unit_price]', with: 75.5
      fill_in 'book[description]', with: "Some testing description"
      click_on "Save"

      expect(page).to have_content("Some testing")
    end

    it 'will have an author associated with it' do
      fill_in 'book[title]', with: "Some Title"
      fill_in 'book[author_name]', with: "New Author"
      fill_in 'book[unit_price]', with: 75.5
      fill_in 'book[description]', with: "Some testing description"
      click_on "Save"

      expect(Author.last.books.last.description).to eq("Some testing description")
    end
  end

  describe 'edit' do
    it 'can be reached by clicking edit on index page' do
      visit books_path
      click_link "edit_book_#{book.id}_from_index"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_book_path(book)
      fill_in 'book[published_date]', with: Date.today
      fill_in 'book[description]', with: "Edit content"
      click_on "Save"

      expect(page).to have_content("Edit content")
    end
  end
end
