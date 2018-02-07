class BooksController < ApplicationController
  before_action :get_ips
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :set_book, only: [:edit, :update, :destroy, :show]
  before_action :set_search, only: [:index]

  def index
    if params[:category].present?
      @books = Book.where(category_id: params[:category]).page(params[:page]).per(params[:page_limit] || 10)
    else
      @books = @q.result.page(params[:page]).per(params[:page_limit] || 10)
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    author = Author.create(name: @book.author_name)
    @book.author = author

    if @book.save
      redirect_to @book, notice: 'Book created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.delete
    redirect_to books_path, notice: 'Book deleted.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author_name, :publisher_name, :published_date, :unit_price, :category)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_search
    @q = Book.ransack(params[:q])
  end
end
