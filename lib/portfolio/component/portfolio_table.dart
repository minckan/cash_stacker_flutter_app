import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PortfolioTable extends StatefulWidget {
  const PortfolioTable({super.key});

  @override
  State<PortfolioTable> createState() => _PortfolioTableState();
}

class _PortfolioTableState extends State<PortfolioTable> {
  List<Asset> assets = <Asset>[];
  late AssetDataSource assetDataSource;

  @override
  void initState() {
    super.initState();
    assets = getAssetData();
    assetDataSource = AssetDataSource(assetData: assets);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: assetDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'id',
            label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'ID',
                ))),
        GridColumn(
            columnName: 'name',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Name'))),
        GridColumn(
            columnName: 'designation',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text(
                  'Designation',
                  overflow: TextOverflow.ellipsis,
                ))),
        GridColumn(
            columnName: 'salary',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('Salary'))),
      ],
    );
  }

  List<Asset> getAssetData() {
    return [
    Asset(assetName: '엔화노출미장기채권(2621)', assetCategory: '외화 채권 etf', buyingPrice: 1000, buyingAmount: 100, proportion: , currentOriginalTotalValuation: currentOriginalTotalValuation, currentOriginalValuation: currentOriginalValuation, initialBuyingDate: initialBuyingDate,);
    ];
  }
}



/// An object to set the asset collection data source to the datagrid. This
/// is used to map the asset data to the datagrid widget.
class AssetDataSource extends DataGridSource {
  /// Creates the asset data source class with required details.
  AssetDataSource({required List<Asset> assetData}) {
    _assetData = assetData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _assetData = [];

  @override
  List<DataGridRow> get rows => _assetData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
