import 'dart:math';

GridXY convertLatLonToGrid(double lat, double lon) {
  const double PI = pi;
  const double DEGRAD = PI / 180.0;

  final lamc = LamcParameter();
  final double re = lamc.Re / lamc.grid;
  final double slat1 = lamc.slat1 * DEGRAD;
  final double slat2 = lamc.slat2 * DEGRAD;
  final double olon = lamc.olon * DEGRAD;
  final double olat = lamc.olat * DEGRAD;

  double sn = tan(PI * 0.25 + slat2 * 0.5) / tan(PI * 0.25 + slat1 * 0.5);
  sn = log(cos(slat1) / cos(slat2)) / log(sn);
  double sf = tan(PI * 0.25 + slat1 * 0.5);
  sf = pow(sf, sn) * cos(slat1) / sn;
  double ro = tan(PI * 0.25 + olat * 0.5);
  ro = re * sf / pow(ro, sn);

  double ra = tan(PI * 0.25 + lat * DEGRAD * 0.5);
  ra = re * sf / pow(ra, sn);
  double theta = lon * DEGRAD - olon;
  if (theta > PI) theta -= 2.0 * PI;
  if (theta < -PI) theta += 2.0 * PI;
  theta *= sn;

  int x = (ra * sin(theta) + lamc.xo + 0.5).floor();
  int y = (ro - ra * cos(theta) + lamc.yo + 0.5).floor();

  return GridXY(x, y);
}

class LamcParameter {
  final double Re = 6371.00877; // 지도 반경
  final double grid = 5.0; // 격자 간격 (km)
  final double slat1 = 30.0; // 표준 위도 1
  final double slat2 = 60.0; // 표준 위도 2
  final double olon = 126.0; // 기준점 경도
  final double olat = 38.0; // 기준점 위도
  final double xo = 210 / 5.0; // 기준점 X좌표 (격자 단위)
  final double yo = 675 / 5.0; // 기준점 Y좌표 (격자 단위)
}

class GridXY {
  final int x;
  final int y;
  GridXY(this.x, this.y);
}
