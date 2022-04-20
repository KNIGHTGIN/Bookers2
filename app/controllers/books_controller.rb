class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
    @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id!= current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def delete
  flash[:notice] = "Signed out successfully."
  end

  def create
  @newbook = Book.new(book_params)
  @newbook.user_id = current_user.id
   if @newbook.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@newbook)
   else
    @books = Book.all
    @user = current_user
    render 'index'
   end
  end

  private

  def book_params
    params.require(:book). permit(:title, :body)
  end

end
