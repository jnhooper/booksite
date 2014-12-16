class BooksController < ApplicationController

  def new
    @book = Book.create
  end

  def create
    if current_user
      @book = Book.new(book_params)

      save_user(@book)
      add_authors(@book)
      if @book.save
        redirect_to root_url, :notice => "Book Created"

      else
        redirect_to root_url, :notice => "Error occured"
      end
    end
  end


  def destroy
    if current_user
      Book.find(params[:id]).destroy
      render "angular_app/content"
      # AngularAppController.show
    end
  end


  def save_user(book)
    if !book.created_by
      book.created_by = current_user.id
    end
    book.last_edit = current_user.id
  end

  def add_authors(book)
    if book.author_ids
      book.author_ids.each{|a|
        if Author.exists?(a)
          @author = Author.find(a)
          if !Contributor.find_by_author_id_and_book_id(@author[:id], book[:id])
            book.authors << @author
            # Contributor.create({author_id:@author[:id], book_id:book[:id]})

          end
        end
      }
      end
  end



  def update
   if current_user
      @book = Book.find(params[:id])

      @book.author_ids = book_params[:author_ids]

      @book.authors.each{|author|
        if !@book.author_ids  || !@book.author_ids.include?(author[:id])
          @dead_poet = Contributor.find_by_author_id_and_book_id(author[:id], @book[:id])
          @dead_poet.delete
        end
      }

      add_authors(@book)
      save_user(@book)

      if @book.update(book_params)
        render "angular_app/content"
      else
        p "oh fuck"
      end
   end
  end

  def index
    @books = Book.all
    render "index.json"
    # render json: @books
  end

  def show
    @book = Book.find(params[:id])

  end

  private

  def book_params
    params.require(:book).permit(:title, {:author_ids => []}, :description, :release_date, :isbn, :price,  :genre, :purchase_link)
  end
end
