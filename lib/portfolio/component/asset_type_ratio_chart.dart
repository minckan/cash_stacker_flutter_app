import 'package:cash_stacker_flutter_app/common/component/lib/Indicator.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetTypeRatioChart extends ConsumerStatefulWidget {
  const AssetTypeRatioChart({
    super.key,
    required this.categories,
    required this.ratios,
  });

  final List<AssetType> categories;
  final Map<String, PortfolioRatiosValue>
      ratios; // Assume you have an AssetModel defined

  @override
  AssetTypeRatioChartState createState() => AssetTypeRatioChartState();
}

class AssetTypeRatioChartState extends ConsumerState<AssetTypeRatioChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final categoryRatios = widget.ratios;

    if (widget.categories.isEmpty) {
      return const CircularProgressIndicator();
    }

    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }

                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(categoryRatios),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.categories.length, (i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Indicator(
                  color: _AppColors
                      .categoryColors[i % _AppColors.categoryColors.length],
                  text: widget.categories[i].assetTypeName!,
                  isSquare: true,
                ),
              );
            }),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      Map<String, PortfolioRatiosValue> ratios) {
    final items = ratios.entries.fold([], (categoryItems, ratios) {
      for (var category in widget.categories) {
        if (category.assetTypeId == int.parse(ratios.key)) {
          categoryItems.add(category);
        }
      }
      return categoryItems;
    });
    return ratios.entries.map((entry) {
      final isTouched = items.indexOf(widget.categories
              .firstWhere((e) => e.assetTypeId == int.parse(entry.key))) ==
          touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final colorIndex = widget.categories.indexOf(widget.categories
              .firstWhere((e) => e.assetTypeId == int.parse(entry.key))) %
          _AppColors.categoryColors.length;

      return PieChartSectionData(
        color: _AppColors.categoryColors[colorIndex],
        value: double.tryParse('${entry.value.totalAssets}'),
        title: '${entry.value.totalAssets?.toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: _AppColors.mainTextColor1,
          shadows: shadows,
        ),
      );
    }).toList();
  }
}

// Assume you have defined _AppColors and AssetModel
class _AppColors {
  static const List<Color> categoryColors = [
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.lime,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
  ];
  static const Color mainTextColor1 = Colors.black;
}
