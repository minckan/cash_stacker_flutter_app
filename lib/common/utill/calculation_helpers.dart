/// 수익율 계산
double calculatePercentageIncrease(double previousPrice, double currentPrice) {
  if (previousPrice == 0) {
    throw ArgumentError('이전 가격은 0이 될 수 없습니다.');
  }
  double increase = currentPrice - previousPrice;
  double percentageIncrease = (increase / previousPrice) * 100;
  return percentageIncrease;
}
