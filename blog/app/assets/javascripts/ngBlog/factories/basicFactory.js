var hoop = angular.module('HoopResource', []);

hoop.factory('hoopUte', function(){
	
	var books, authors;

	var crossRef = function(myList, searchList){
		console.log(myList, searchList)
		var objectArray = [];
		_.each(myList, function(x){

			var myObj =_.findWhere(searchList, function(object){
				return object.id===x
				}
			)
			console.log(myObj)
			objectArray.push(myObj);
		})

		console.log(objectArray)
		return objectArray;

	}

	return {
		crossRef: function(myList, searchList){
			return crossRef(myList, searchList)		
		},
		setBooks:function(data){
			books = data;
		},
		getBooks:function(){
			return books;
		},
		setAuthors:function(data){
			authors=data;
		},
		getAuthors: function(){
			return authors;
		}
	}
})