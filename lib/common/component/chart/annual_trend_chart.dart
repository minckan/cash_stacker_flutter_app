import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/extensions/color_extensions.dart';
import 'package:cash_stacker_flutter_app/home/model/asset_summary_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({required this.assetSummaries});

  final List<AssetSummaryDecile> assetSummaries;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 10,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 0,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            final assetSummary = getAssetSummary(groupIndex);

            return BarTooltipItem(
              assetSummary.assetSummary.formattedTotalAssets,
              const TextStyle(
                color: AppColors.bodyText,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: AppColors.bodyTextDark.darken(20),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text = '${value.toInt() + 1}월';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          AppColors.mainTabInactive.darken(20),
          AppColors.primary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => List.generate(
        12,
        (index) {
          final assetSummary = getAssetSummary(index);

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: assetSummary.normalizedValue,
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: [0],
          );
        },
      );

  AssetSummaryDecile getAssetSummary(int index) {
    return assetSummaries.firstWhere(
      (decile) =>
          getDateFromMonthKey(decile.assetSummary.month).month == index + 1,
      orElse: () => AssetSummaryDecile.empty(), // 조건을 만족하는 요소를 찾지 못하면 null 반환
    );
  }
}

class AnnualTrendChart extends ConsumerStatefulWidget {
  const AnnualTrendChart({super.key});

  @override
  ConsumerState<AnnualTrendChart> createState() => AnnualTrendChartState();
}

class AnnualTrendChartState extends ConsumerState<AnnualTrendChart> {
  List<AssetSummaryDecile> normalizedSummaries = [];

  @override
  Widget build(BuildContext context) {
    final assetSummaries = ref.watch(assetSummaryProvider);
    final normalized = normalizeAssetSummaries(assetSummaries);
    normalizedSummaries = normalized;
    if (normalizedSummaries.isNotEmpty) {
      return AspectRatio(
        aspectRatio: 1.6,
        child: _BarChart(assetSummaries: normalizedSummaries),
      );
    } else {
      return const Center(
        child: Text('월간 자산 규모 추이를 확인할 수 없습니다.'),
      );
    }
  }
}
