class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    @books = Book.all
    @book = Book.create

    if book.save
        redirect_to "/books/#{book.id}", notice: "Book was successfully created."
    else
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroy."
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to "/books/#{@book.id}", notice: "Book was successfully update."
    else
      render :edit
    end
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
