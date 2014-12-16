json.(@book, :id, :title, :description, :created_by, :last_edit)

json.authors @book.authors, :first_name, :bio