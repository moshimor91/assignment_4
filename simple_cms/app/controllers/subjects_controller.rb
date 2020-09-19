class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @books= Book.sorted
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    # Instantiate a new object using form parameters
    @book = Book.new(book_params)

    # Save the object
    if @book.save
      flash[:notice] = "Book created successfully."
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      flash[:notice] = "Book information updated successfully."
      redirect_to(subjects_path(@book))
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted successfully."
    redirect_to(subjects_path)
  end

  private

  def book_params
    params.require(:book).permit(:title,:author,:genre,:price, :published_date)
  end

end
