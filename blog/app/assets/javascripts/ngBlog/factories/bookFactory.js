blog.factory('Books',['$resource', function($resource){
    return $resource('/books/:id',{id:"@id"},
        {
            'update':{
                method:'PUT',
                isArray:false
            },
            'query':{
                method:'GET'
            },
            'new':{
                method:'POST'
            }
        }
    )
}]);