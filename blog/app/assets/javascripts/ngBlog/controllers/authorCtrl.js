blog.controller('authorCtrl', function($scope, Authors, hoopUte){
    $scope.getAuthors = function(){
       Authors.query('authors', function(data){
            $scope.authors = data.authors
           console.log($scope.authors);
           hoopUte.setAuthors($scope.authors);
        })

    };
    $scope.getAuthors()


    $scope.testAuthor = function(){
        var author = {first_name:"Bill", last_name:"Murray", bio:"Call him", book_ids:[1], website:"https://www.youtube.com/watch?v=m9We2XsVZfc"};
        Authors.new({author:author}, function(){
            $scope.authors.push(author);
            console.log("new book created")
        });
    };

    $scope.testEdit = function(author){
        author.first_name = "Jeff";
        author.last_name = "Goldblum";
        author.book_ids = [2, 3];
        Authors.update({author:author, id:author.id});
    };

    $scope.deleteAuthor = function(author){
        Authors.delete(author)
    };
});