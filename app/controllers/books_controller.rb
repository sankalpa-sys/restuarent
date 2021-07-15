class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = current_user.books
  end
  def new
    @book = Book.new
  end
  def create
    @book= current_user.books.new(book_params)
    redirect_to khalti_index_path
    if @book.save
      flash[:notice] = "Table has been booked for you."
    else
      flash[:alert] = "Sorry!! Not available at the moment."
      redirect_to books_path
    end
  end

  def show
    @book = current_user.books.find_by_id(params[:id])
  end

  def destroy
    @book = current_user.books.find_by_id(params[:id])

    if (Time.now.hour - @book.datetime.hour) > 2.hour
      redirect_to books_path
      flash[:notice] = "Sorry, The booking can no longer be cancelled!!"
    else
      @book.destroy
      flash[:notice] = "Your booking has been cancelled."
      redirect_to root_path
    end
  end
  private
  def book_params
    params.require(:book).permit(:number, :people, :datetime, :duration)
  end

end
