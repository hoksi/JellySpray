<!doctype html>
<html lang="en" ng-app="myApp">
<head>
  <meta charset="utf-8">
  <title>My HTML File</title>
  <link rel="stylesheet" href="/assets/css/bootstrap.css">
  <script src="/assets/js/angular.min.js"></script>
  <script>
  	var myApp = angular.module('myApp', []);
 
	myApp.controller('AppCtrl', function ($scope) {
	  $scope.name = 'Guest';
	});
  </script>
</head>
<body>
<div ng-controller="AppCtrl">
	<h1>Hello, {{name}}</h1>
	<div>
		<label for="name">My Name is</label>
		<input name="name" ng-model="name" />
	</div>
</div> 

</html>