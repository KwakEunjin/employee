<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" data-ng-app="employeeApp">
<!-- 기본 이름 -->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<%@ include file="/WEB-INF/view/common.jspf"%><!-- jspf는 조각 부분을 의미함. -->

<style type="text/css">
.red {
	background: red;
	color: blue;
}
</style>

<script type="text/javascript">
	var app = angular.module("employeeApp", []);
	app.controller("examController", function($scope, $http) {
		/* $scope - model 영역 호출, $http - angular가 ajox 호출.*/
		$scope.title = "Angular 기본구조 연습";
		$scope.titleClick = function() {
			$scope.title += "+";
		};

		$scope.name = "홍길동";

		$scope.depts = [ {
			deptno : 10,
			dname : '총무부1총무부1총무부1총무부1총무부1총무부1총무부1총무부1총무부1총무부1총무부1',
			loc : 'seoul1'
		}, {
			deptno : 20,
			dname : '총무부2',
			loc : 'seoul2'
		}, {
			deptno : 30,
			dname : '총무부3',
			loc : 'seoul3'
		}, {
			deptno : 40,
			dname : '총무부4',
			loc : 'seoul4'
		}, {
			deptno : 50,
			dname : '총무부5',
			loc : 'seoul5'
		}

		];

		$scope.deleteDept = function(index) {
			var deptno = $scope.depts[index].deptno;
			alert("deptno = " + deptno);

			$scope.depts.splice(index, 1); //지우는 기능. 숫자는 개수
		};

		$scope.imgs = [
			{alt :'100',src :'http://www.placehold.it/100x100/ff0000/0000ff?text=cat'},
			{alt :'200',src :'http://www.placehold.it/200x200/00ff00/0000ff?text=cat1'},
			{alt :'300',src :'http://www.placehold.it/300x300/0000ff/ff00ff?text=dog'},
			{alt :'400',src :'http://www.placehold.it/400x400/ff00ff/0000ff?text=dog1'},
			{alt :'500',src :'http://www.placehold.it/500x500/ffff00/0000ff?text=zebra'}	
		];

	});
</script>

<title>angular.jsp</title>
</head>
<body data-ng-controller="examController">
	<h1 data-ng-click="titleClick()">{{title}}</h1>
	<p>3+4 = {{3+4}}</p>
	<hr>
	<input type="text" data-ng-model="name" />
	<h3>{{name}}</h3>

	<hr>
	<div class="table-responsive">
		<!-- 화면이 작아지면 스크롤이 생긴다 -->
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>deptno</th>
					<th>dname</th>
					<th>loc</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr data-ng-repeat="dept in depts">
					<td>{{$index}}</td>
					<td>{{dept.deptno}}</td>
					<td>{{dept.dname}}</td>
					<td>{{dept.loc}}</td>
					<td><a href="#" class="btn btn-primary"	data-ng-click="deleteDept($index)">삭제</a></td>
				</tr>
			</tbody>




		</table>
	</div>

	<div class="table-responsive">
		<!-- 화면이 작아지면 스크롤이 생긴다 -->
		<table class="table table-condensed">
			<!-- cell padding을 줄인다. 글자 위아래 사이  -->
			<thead>
				<tr>
					<th>deptno</th>
					<th>dname</th>
					<th>loc</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="red">{{depts[0].deptno}}</td>
					<td>{{depts[0].dname}}</td>
					<td>{{depts[0].loc}}</td>
				</tr>
				<tr>
					<td>{{depts[1].deptno}}</td>
					<td>{{depts[1].dname}}</td>
					<td>{{depts[1].loc}}</td>
				</tr>
				<tr>
					<td>{{depts[2].deptno}}</td>
					<td>{{depts[2].dname}}</td>
					<td>{{depts[2].loc}}</td>
				</tr>
				<tr>
					<td>{{depts[3].deptno}}</td>
					<td>{{depts[3].dname}}</td>
					<td>{{depts[3].loc}}</td>
				</tr>
				<tr>
					<td>{{depts[4].deptno}}</td>
					<td>{{depts[4].dname}}</td>
					<td>{{depts[4].loc}}</td>
				</tr>
			</tbody>

		</table>
	</div>

	<ul class="list-group">		<!-- list-group하고 아래에 list-group-item을 넣으면 list처럼 나누어 준다. -->
		<li class="list-group-item" data-ng-repeat="img in imgs">
			<h3>{{img.src}}</h3>
			<img class="img-circle img-responsive" alt="{{img.alt}}" src="{{img.src}}">
			<!-- img-responsive - 화면에 따라 이미지가 작아진다. -->
		</li>
	</ul>



</body>
</html>