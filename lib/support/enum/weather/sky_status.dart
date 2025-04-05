enum SkyStatus {
  clear('1', '맑음'),
  mostlyCloudy('3', '구름많음'),
  cloudy('4', '흐림'),
  unknown(null, '알 수 없음');

  final String? code;
  final String label;

  const SkyStatus(this.code, this.label);

  static SkyStatus fromCode(String? code) {
    return SkyStatus.values.firstWhere(
      (status) => status.code == code,
      orElse: () => SkyStatus.unknown,
    );
  }
}
