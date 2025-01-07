class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "Book created successfully."
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book, notice: "Book updated successfully."
    else
      render :edit
    end
  end
    
  def bulk_delete_books
    @books = Book.where(id: params[:book_ids])
    @books.delete_all

    format.js
  end

  private

  def book_params
    params.require(:book).permit(:titile, :price, :author, :genre)
  end
end
