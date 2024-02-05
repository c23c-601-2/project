<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
nav {
	/*display: flex;*/ /* 열면 왼쪽으로 가버림 */
	text-align: center;
	align-items: center;
	justify-content: space-between;
	height: auto;
	background-color: #F5ECE4;
	border: 1px solid #F5ECE4;
}

nav > ul {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
	margin: 8px 0 16px 0;
	background-color: #F5ECE4;
	
}
 
nav > ul > li {
	position: relative;
	flex: 0 0 auto;
	margin: 0 16px;
}

.menu {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	border: 0;
}

nav .menu > a {
	display: flex;
	align-items: center;
	justify-content: center;
	width: auto;
	white-space: nowrap;
}

nav > ul > li .dropdownBtn {
	display: none;
}

nav > ul > li > ul {
	position: absolute;
	z-index: 5;
	display: none;
	width: auto;
	text-align: center;
}

nav > ul > li > ul > li {
	display: flex;
	align-items: center;
	justify-content: start;
}

nav:hover > ul > li:hover > ul {
	display: block;
}

nav > ul > li > ul > li > a {
	display: flex;
	align-items: center;
	justify-content: start;
	width: 100%;
	white-space: nowrap;
}
.fa-solid {
	font-weight: 900;
	-webkit-font-smoothing: antialiased;
	display: var(-- inline-block);
	font-style: normal;
	line-height: 1;
	text-rendering: auto;
}

div {
	display: block;
}
ul {
	list-style: none;
}
li {
	display: list-item;
	text-align: -webkit-match-parent;
}
a {
	text-decoration: none;
	color: inherit;
	font-size: 18px;
	/* background-color: #F5ECE4; */
}

a:-webkit-any-link {
	cursor: pointer;
}
</style>    
<nav>
	<ul>
		<li>	
			<div class="menu">
				<a style="color: inherit; text-decoration: none;" href=/pdsList><img src="./assets/img/instagram.png" alt="601스타그램" width="34" height="auto" style="margin-right: 10px;">601스타그램</a>
				<div class="dropdownBtn">
					<i class="fa-solid fa-caret-up"> </i>
				</div>	
			</div>
		</li>
		<li>	
			<div class="menu">
				<a style="color: inherit; text-decoration: none;" href=/food><img src=".//assets/img/restaurant.jpg" alt="601맛집" width="34" height="auto" style="margin-right: 10px;">601맛집</a>
				<div class="dropdownBtn">
					<i class="fa-solid fa-caret-up"> </i>
				</div>	
			</div>
		</li>
		<li>
			<div class="menu">
				<a style="" ><img src=".//assets/img/jobnews.png" alt="601취업정보" width="34" height="auto" style="margin-right: 10px;">601취업정보</a>
				<div class="dropdownBtn">
					<i class="fa-solid fa-caret-up"> </i>
				</div>	
			</div>
			<ul class="active" style="border: 1px solid blue; padding: 0;">
				<li style="background-color: inherit; border: 1px solid red">
					<a style="border: 1px solid black; background-color: #FFDC9F;" href="/best">👍인기글</a>
				</li >
				<li style="background-color: inherit; border: 1px solid red">
					<a style="border: 1px solid black; background-color: #FFDC9F;" href="/best">🏛️알렉산드리아 도서관</a>
				</li>
			</ul>
		</li>
		<li>	
			<div class="menu">
				<a style="color: inherit; text-decoration: none;" href=/login><img src=".//assets/img/login.png" alt="로그인" width="34" height="auto" style="margin-right: 10px;">로그인</a>
				<div class="dropdownBtn">
					<i class="fa-solid fa-caret-up"> </i>
				</div>	
			</div>
		</li>
	</ul>
</nav>