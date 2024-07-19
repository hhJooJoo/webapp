<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<h4>Account 테이블 - Ajax</h4>


	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>ID</th>
				<th>PW</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>가입일자</th>
			</tr>
		</thead>

		<!-- js로 가져온 테이블을 아래 출력 -->
		<tbody></tbody>
	</table>

	<br>

	<div>
		<button>POST</button>
		<button>PUT</button>
		<button>DELETE</button>
	</div>
	
	<!-- js 코드-->
	<script>
		let btns = document.querySelectorAll('button');
		let tbody = document.querySelector('tbody');

		// 1. GET
		// 여기서 ajax구문으로 서버로 부터 데이터를 받고 아래 부분에서 출력하면 끝
		let url = 'http://localhost:8080/day78/ex02/account';

		function get() {
			fetch(url, {method: 'get'})
			.then(Response => Response.json())
			.then(data =>{
	
				tbody.innerHTML = ''; // 싹다 날리고 추가?
				
				for (let i = 0; i < data.length; i++) {
					//				console.log(data[i]);

					tbody.innerHTML += 
						'<tr>' + 
							'<td>' + data[i].idx + '</td>' + 	
							'<td>' + data[i].userid + '</td>' + 	
							'<td>' + data[i].userpw.substr(0,6) + '</td>' + 	
							'<td>' + data[i].nick + '</td>' + 	
							'<td>' + data[i].email + '</td>' + 	
							'<td>' + data[i].join_date + '</td>' + 	
						'</tr>'
	
				}
			})
		}

		get();


		// 2. POST
		btns[0].onclick = () => {

			let newAccount = {
				'userid': prompt('ID 입력'),
				'userpw': prompt('PW 입력'),
				'nick': prompt('닉네임 입력'),
				'email': prompt('이메일 입력')
			}
			
			fetch(url, {
				method: 'post',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(newAccount)
			})
			.then(response => response.json())
			.then(data => {
				console.log(data);

				get(); // POST 추가/변경된 내용을 출력하기 위해
			})
		}

		// 3. PUT
		btns[1].onclick = () => {
			let upAccount = {
				'idx': Number(prompt('수정할 계정 번호')),
				'userid': prompt('ID 입력'),
				'userpw': prompt('PW 입력'),
				'nick': prompt('닉네임 입력'),
				'email': prompt('이메일 입력')
			}

			fetch(url, {
				method: 'put',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(upAccount)
			})
			.then(response => response.json())
			.then(data => {
				console.log(data);

				get(); // POST 추가/변경된 내용을 출력하기 위해
			})
		}

		// 4. DELETE
		btns[2].onclick = () => {
			let idx = prompt('삭제할 계정 번호');

			fetch(url + '?idx=' + idx, {method: 'delete'})
			.then(response => response.json())
			.then(data => {
				console.log(data);

				get();
			})
		}

	</script>

	
</body>
</html>