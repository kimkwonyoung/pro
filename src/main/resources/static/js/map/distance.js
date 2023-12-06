// turf.js import하는 부분. HTML이 아니므로, <script>태그를 사용할 수 없다. document.write 를 사용하여 감싸면 해결
// 이를 통해, turf.js를 사용했음을 한 번 더 감출 수 있고-> 보안성 향상
// 지도 API가 카카오가 아닌 공공API, 구글, 네이버 어디를 쓰더라도 이 루틴은 유지할 수 있다.
document.write("<script src='https://unpkg.com/@turf/turf@6.3.0/turf.min.js'></script>")

// distance.js 파일 시작
function calculateDistance(coord1, coord2) {
  const point1 = turf.point(coord1);
  const point2 = turf.point(coord2);

  const options = { units: 'meters' };
  const distance = turf.distance(point1, point2, options);

  return distance;
}
// distance.js 파일 끝
