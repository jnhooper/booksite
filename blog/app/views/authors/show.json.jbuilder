json.(@author, :id, :first_name, :last_name, :website, :middle_name, :nickname, :bio,  :last_edit, :created_by)

json.books @author.books, :title, :description, :genre, :isbn, :price, :purchase_link, :release_date,  :last_edit, :created_by