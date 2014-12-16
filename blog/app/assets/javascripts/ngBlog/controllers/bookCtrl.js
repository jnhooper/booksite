blog.controller('bookCtrl', function ($scope, Books, hoopUte) {
    $scope.test = "testing";

    

    var books = Books.query(function(data){
        $scope.books = data.books;
    });
    console.log(books);

    //
    $scope.testBook = function(){
        $scope.edit=true;//flag for editing box.
        var book = {title:'Some other Book', author_ids:[1], description:"its okay"};
       
        Books.new({book:book}, function(){
            $scope.edit=false;
            var authors = hoopUte.getAuthors();
            book.authors = hoopUte.crossRef(book.author_ids, authors);
            $scope.books.push(book)
            hoopUte.setBooks($scope.books);
        });
//        http.newBook('books', $scope.getBooks, book);
    };

    $scope.deleteBook = function(book, index){
        Books.delete(book, function(){
        	$scope.books.splice(index, 1)
        });
//        http.deleteBook('books', $scope.getBooks, book);
    };

    $scope.testEdit = function(book){
        book.title = "different Title";
        book.author_ids = [3,2];
        Books.update({book:book, id:book.id});
//        http.editBook('books', function(){console.log("success!")},book)
    }
});