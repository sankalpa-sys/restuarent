class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book= Book.new
  end
  def create
    @book = current_user.books.new(book_params)
    if @book.save
       flash[:notice] = "Table booked for you."
       redirect_to root_path
    else
      flash[:alert] = "Sorry! Not available right now. "
      redirect_to books_new_path
    end
  end
  private
  def book_params
    params.require(:book).permit(:table, :number, :occassion, :date, :time, :duration)
  end
end
