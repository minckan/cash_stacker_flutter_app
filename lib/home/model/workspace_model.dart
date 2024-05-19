import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Workspace {
  Workspace({
    required this.members,
    required this.totalAmount,
    // required this.assets,
    // required this.transactions,
    required this.id,
  });

  final String id;
  final List<String> members;
  final double totalAmount;
  // final List<Asset> assets;
  // final List<Transaction> transactions;

  factory Workspace.fromJson(Map<String, dynamic> data) {
    return Workspace(
      id: data['id'],
      members: List<String>.from(data['user']),
      totalAmount: data['totalAmount'],
      // assets: List<Asset>.from(data['assets']),
      // transactions: List<Transaction>.from(data['transactions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': members,
      'totalAmount': totalAmount,
      // 'assets': assets,
      // 'transactions': transactions,
    };
  }
}
