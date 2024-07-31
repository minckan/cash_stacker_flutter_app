/// 수익율 계산
double calculatePercentageIncrease(num previousPrice, num currentPrice) {
  if (previousPrice == 0) {
    throw ArgumentError('이전 가격은 0이 될 수 없습니다.');
  }
  num increase = currentPrice - previousPrice;
  double percentageIncrease = (increase / previousPrice) * 100;
  return percentageIncrease;
}
