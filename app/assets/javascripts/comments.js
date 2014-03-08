app.controller("CommentsController",function($scope,$http){
	$http.get("/request/2/comments");
});