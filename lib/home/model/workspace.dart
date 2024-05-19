import 'package:cash_stacker_flutter_app/portfolio/model/asset_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Workspace {
  Workspace({
    required this.user,
    required this.totalAmount,
    required this.assets,
    required this.transactions,
  });

  final List<User> user;
  final double totalAmount;
  final List<Asset> assets;
  final List<Transaction> transactions;
}
