APP.config(function($routeProvider) {
    $routeProvider.when('/', {
        templateUrl: 'render.html', 
        reloadOnSearch: false,
        controller: 'RenderController',
    });
    $routeProvider.when('/auth', {
        templateUrl: 'template/home.html', 
        reloadOnSearch: false,
        controller: 'AuthController',
      // data: {
      //      current_bg: 'bg'
      // }
    });
    
    $routeProvider.when('/login', {
        templateUrl: 'template/login.html', 
        reloadOnSearch: false,
        controller: 'AuthController',
    });
    $routeProvider.when('/register', {
        templateUrl: 'template/register.html', 
        reloadOnSearch: false,
        controller: 'AuthController',
    });
    $routeProvider.when('/forgot', {
        templateUrl: 'template/forgot.html', 
        reloadOnSearch: false,
        controller: 'AuthController',
    });

    $routeProvider.when('/profile', {
        templateUrl: 'template/profile.html', 
        reloadOnSearch: false,
        controller: 'ProfileController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/profile/update', {
        templateUrl: 'template/profile-update.html', 
        reloadOnSearch: false,
        controller: 'ProfileController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/profile/update-password', {
        templateUrl: 'template/profile-update-password.html', 
        reloadOnSearch: false,
        controller: 'ProfileController',
        data: {
             current_bg: 'white-bg'
        }
    });

    $routeProvider.when('/list', {
        templateUrl: 'template/project-list.html', 
        reloadOnSearch: false,
        controller: 'MainController',
    });
    $routeProvider.when('/project/add', {
        templateUrl: 'template/add-project.html', 
        reloadOnSearch: false,
        controller: 'AddProjectController',
    });
    $routeProvider.when('/project/:pid', {
        templateUrl: 'template/project.html', 
        reloadOnSearch: false,
        controller: 'ProjectController'
    });
    $routeProvider.when('/project/:pid/edit', {
        templateUrl: 'template/add-project.html', 
        reloadOnSearch: false,
        controller: 'AddProjectController'
    });
    $routeProvider.when('/share/:pid', {
        templateUrl: 'template/share.html', 
        reloadOnSearch: false,
        controller: 'ShareController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/send/:pid', {
        templateUrl: 'template/send.html', 
        reloadOnSearch: false,
        controller: 'ShareController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/chart/:pid', {
        templateUrl: 'template/chart.html', 
        reloadOnSearch: false,
        controller: 'ChartController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/download/:pid', {
        templateUrl: 'template/download.html', 
        reloadOnSearch: false,
        controller: 'DownloadController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/chart/:pid/:cid', {
        templateUrl: 'template/chart.html', 
        reloadOnSearch: false,
        controller: 'ChartController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/project/:pid/:cid', {
        templateUrl: 'template/category.html', 
        reloadOnSearch: false,
        controller: 'ProjectController'
    });
    $routeProvider.when('/tutorial', {
        templateUrl: 'template/tutorial.html', 
        reloadOnSearch: false,
        controller: 'TutorialController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/tutorial/:cid', {
        templateUrl: 'template/tutorial.html', 
        reloadOnSearch: false,
        controller: 'TutorialController',
        data: {
             current_bg: 'white-bg'
        }
    });
    $routeProvider.when('/info/:id', {
        templateUrl: 'template/content.html', 
        reloadOnSearch: false,
        controller: 'ContentController',
        data: {
             current_bg: 'white-bg'
        }
    });
    
});