function UserCtrl($scope, $http) {

    $scope.registerUser = function() {
        $http.put('/register_user/', {
            username: $scope.userName,
            email: $scope.userEmail,
            password: $scope.userPassword,
            password_confirmation: $scope.passwordConfirm
        } ).success(function(){
                $scope.userName = '';
                $scope.userEmail = '';
                $scope.userPassword = '';
                $scope.passwordConfirm = '';
                $('body').css({'background-color': '#ccc'})
        });

    }

}