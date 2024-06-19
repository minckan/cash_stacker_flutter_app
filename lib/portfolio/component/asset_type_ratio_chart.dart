import 'package:cash_stacker_flutter_app/common/component/lib/Indicator.dart';
import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_detail_view_model.dart';
import 'package:cash_stacker_flutter_app/setting/model/asset_type_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetTypeRatioChart extends ConsumerStatefulWidget {
  const AssetTypeRatioChart({
    super.key,
    required this.categories,
    required this.assets,
  });

  final List<AssetTypeModel> categories;
  final List<Asset> assets; // Assume you have an AssetModel defined

  @override
  AssetTypeRatioChartState createState() => AssetTypeRatioChartState();
}

class AssetTypeRatioChartState extends ConsumerState<AssetTypeRatioChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final categoryRatios = _calculateCategoryRatios();

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
                  text: widget.categories[i].name,
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
      Map<AssetTypeModel, double> categoryRatios) {
    final items = categoryRatios.entries.fold([], (categoryItems, ratios) {
      for (var category in widget.categories) {
        if (category == ratios.key) {
          categoryItems.add(category);
        }
      }
      return categoryItems;
    });
    return categoryRatios.entries.map((entry) {
      final isTouched = items.indexOf(entry.key) == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final colorIndex = widget.categories.indexOf(entry.key) %
          _AppColors.categoryColors.length;

      return PieChartSectionData(
        color: _AppColors.categoryColors[colorIndex],
        value: entry.value,
        title: '${entry.value.toStringAsFixed(1)}%',
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

  Map<AssetTypeModel, double> _calculateCategoryRatios() {
    final Map<AssetTypeModel, double> categorySums = {};
    double totalSum = 0;

    for (var asset in widget.assets) {
      final vm = AssetDetailViewModel(asset: asset, ref: ref);

      final category = widget.categories
          .firstWhere((category) => category.id == asset.categoryId);

      categorySums.update(category, (value) => value + vm.ratioValue,
          ifAbsent: () => vm.ratioValue);
      totalSum += vm.ratioValue;
    }

    return categorySums
        .map((category, sum) => MapEntry(category, (sum / totalSum) * 100));
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
