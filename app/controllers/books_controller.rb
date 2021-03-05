class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book = Book.new
  end
  def create
    @book= current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "Table has been booked for you."
      redirect_to root_path
    else
      flash[:alert] = "Sorry!! Not available at the moment."
      redirect_to books_new_path
    end
  end
  private
  def book_params
    params.require(:book).permit(:number, :people, :datetime, :duration)
  end
end
