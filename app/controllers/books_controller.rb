class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    #book_paramsでストロングパラーメータとして取ったものを引数にしている
    #errorメッセジを受け取るときはインスタンス変数にしてviewでerrormesssageを受け取れるようにする
    @book = Book.new(book_params)
    if @book.save
      #flashメッセージを表示
      flash[:notice] = "Book was successfuly created."
      redirect_to "/books/#{@book.id}"
    else
      #renderだとインスタンス変数が引き継がれないため書く
      @books = Book.all
      render action: :index
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
      flash[:notice] = "Book was successfuly updated"
      redirect_to "/books/#{@book.id}"
    else
      render action: :edit
    end
    
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfuly destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end