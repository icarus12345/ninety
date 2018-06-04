function AuthFactory($rootScope, $http, SharedState, $mdDialog, API, StorageService,Dialog) {
    var Auth = this;
    
    $rootScope.Auth = Auth;
    return Auth;
}
