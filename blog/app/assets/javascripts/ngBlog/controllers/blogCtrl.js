var blog = angular.module('blogApp', ['ngResource','ngRoute', 'HoopResource', 'templates']);


blog.controller('mainctrl', function($scope){

});





// blog.factory('http',function($http){
//     var getBooks = function(model, callback){
//         $http.get('/'+model).success(callback);
//     };

//     var newBook = function(model, callback, book){
//         $http.post('/'+model, {book:book}).success(callback);
//     };

//     var deleteBook = function(model,callback, book){
//         $http.delete('/'+model+'/'+book.id).success(callback)
//     };

//     var editBook = function(model, callback, book){
//         $http.put('/'+model+'/'+book.id, {book:book}).success(callback);
//     };


//     return{
//         getBooks:function(model, callback){
//             return getBooks(model,callback)
//         },
//         newBook:function(model, callback, book){
//             return newBook(model, callback, book);
//         },
//         deleteBook:function(model, callback, book){
//             return deleteBook(model, callback, book);
//         },
//         editBook: function(model, callback, book){
//             return editBook(model, callback, book)
//         }
//     }

// });
