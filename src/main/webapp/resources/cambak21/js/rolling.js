// 공지들을 배열로 넣는 함수
		function rolling() {
			let notices = new Array();
						index = 0;

						notices.push("공지1");
						notices.push("공지2");
						notices.push("공지3");

						// 공지 롤링 함수를 호출하는 함수
						setInterval(rolling(), 500);

						// 배열에 넣은 공지를 0번째부터 출력하여 롤릴하는 함수(+무한 롤링)
						function rolling() {
							$("#rollNot")
									.fadeOut(
											3000,
											function() {
												for (let j = 0; j < 3; j++) {
													if (index == j) {
														$("#rollNot")
																.html(
																		"<a href='http://zinsimi.cafe24.com/1_project/Do_bbsDetail.html?contentId=1116925&title=갈산근린공원&firstImage=http://tong.visitkorea.or.kr/cms/resource/62/2612062_image2_1.bmp'>"
																				+ notices[j]
																				+ "<a>")
																.fadeIn(3000);
													}
													;
												}
												;
												index++;
												rolling();
												if (index >= notices.length) {
													index = 0;
												}
												console.log(index);
											});
						}
						;
						dataLoading();

						$(".row").on("click", ".heartIcon", function() {
							fix(this);
						});

						$(".row").on("click", ".commentIcon", function() {
							fix2(this);
						});
			
		}
						