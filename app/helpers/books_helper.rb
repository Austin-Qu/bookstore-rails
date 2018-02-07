module BooksHelper
  def get_category_name(category)
    category.present? ? Category.find(category).name : 'All'
  end

  def show_description(book)
    book.description.present? ? book.description : 'No description'
  end
end
