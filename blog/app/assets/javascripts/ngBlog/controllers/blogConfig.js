blog.config(function($routeProvider) {
    $routeProvider
        // route for the home page
        .when('/fake', {
            templateUrl: 'customJS/Views/fakeData.html',
            controller: 'mainCtrl'
        })
        .when('/EOD-Report', {
            templateUrl: 'customJS/Views/EOD_Report.html',
            controller: 'mainCtrl'
        })
        .when('/', {
            templateUrl: 'customJS/Views/welcome.html',
            controller: 'mainCtrl'
        })
        .when('/Hourly-Report', {
            templateUrl: 'customJS/Views/Hourly_Report.html',
            controller: 'hourlyReportCtrl'
        })
        .when('/Employee-Hours', {
            templateUrl: 'customJS/Views/Employee_Hours.html',
            controller: 'employeeCtrl'
        });
})