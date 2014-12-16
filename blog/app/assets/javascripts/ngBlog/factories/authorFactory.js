
blog.factory('Authors',['$resource', function($resource){
    return $resource('/authors/:id',{id:"@id"},
        {
            'update':{
                method:'PUT',
                isArray:false
            },
            'query':{
                method:'GET',
                isArray:false
            },
            'new':{
                method:'POST'
            }
        }
    )
}]);