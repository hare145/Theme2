class BooksController < ApplicationController
  
  def index
   @books = Book.all
   @book = Book.new
   @booker = Book.new
  end
  
  def create
   @booker = Book.new(book_params)
   if @booker.save
    flash[:notice] = "Book was successfully created."
    redirect_to bookid_path(@booker)
   else
    @books = Book.all
    @book = Book.new
    render :index
   end
   
  end
  
  def show
   @books = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end
  
  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Book was successfully updated." 
    redirect_to bookid_path(@book)
   else
   render :edit
   end
  end
  
  
  def destroy 
   book = Book.find(params[:id])
   book.destroy
   redirect_to '/book'
   flash[:notice] = "Book was successfully destroyed." 
  end 
  
  
  private
  
  def book_params
   params.require(:book).permit(:title, :body)
  end
end