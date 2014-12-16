class AuthorsController < ApplicationController


    def new
      @author = Author.create
    end

    def create
      if current_user
        @author = Author.new(author_params)

        save_user(@author)
        add_books(@author)
        if @author.save
          redirect_to root_url, :notice => "author Created"
        else
          redirect_to root_url, :notice => "Error occured"
        end
      end
    end





    def destroy
      if current_user
        Author.find(params[:id]).destroy
        render "angular_app/content"
        # AngularAppController.show
      end
    end



    def save_user(author)
      if !author.created_by
        author.created_by = current_user.id
      end
      author.last_edit = current_user.id
    end

    def add_books(author)
      if author.book_ids
        author.book_ids.each{|b|
          if Book.exists?(b)
            @book = Book.find(b)
            if !Contributor.find_by_author_id_and_book_id(author[:id], @book[:id])
              author.books << @book
            end
          end
        }
      end
    end





    def update
      if current_user
        @author = Author.find(params[:id])

        @author.book_ids = author_params[:book_ids]


        @author.books.each{|book|
          if !@author.book_ids  || !@author.book_ids.include?(book[:id])
            @burned_book = Contributor.find_by_author_id_and_book_id(@author[:id], book[:id])
            @burned_book.delete
          end
        }

        add_books(@author)
        save_user(@author)
        if @author.update(author_params)
          render "angular_app/content"
        else
          p "oh fuck"
        end
      end
    end





    def index
      @authors = Author.all
      render "index.json"
      # render json: @authors
    end

    def show
      @author = Author.find(params[:id])
    end

    private

    def author_params
      params.require(:author).permit(:first_name, {:book_ids => []}, :last_name, :nickname, :middle_name, :website, :bio)
    end


end
