class BooksController < ApplicationController
  def top
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    book.edit
    redirect_to book_path
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  
  def update
    @book = Book.find(params[:id])
    book.update
    redirect_to book_path
  end
  
  private
  def book_params
    params.require(@book).permit(:title, :body)
  end
end
