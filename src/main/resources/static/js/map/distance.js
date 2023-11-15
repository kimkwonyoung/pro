// distance.js 파일 시작
function calculateDistance(coord1, coord2) {
  const point1 = turf.point(coord1);
  const point2 = turf.point(coord2);

  const options = { units: 'meters' };
  const distance = turf.distance(point1, point2, options);

  return distance;
}
// distance.js 파일 끝
