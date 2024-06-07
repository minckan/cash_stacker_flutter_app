// currency_viewmodel.dart
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// CurrencyViewModelProvider 정의
final currencyViewModelProvider =
    StateNotifierProvider<CurrencyViewModel, List<Currency>>((ref) {
  return CurrencyViewModel();
});

class CurrencyViewModel extends StateNotifier<List<Currency>> {
  CurrencyViewModel() : super([]);

  final CollectionReference _currenciesRef =
      FirebaseFirestore.instance.collection('currencies');

  Currency get krwCurrency {
    return state.firstWhere((currency) => currency.currencyCode == 'KRW');
  }

  Future<void> loadCurrencies() async {
    try {
      QuerySnapshot snapshot = await _currenciesRef.get();
      List<Currency> currencies = snapshot.docs
          .map((doc) => Currency.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      state = currencies;
    } catch (e) {
      // Handle error
      print("Failed to fetch currencies: $e");
    }
  }

  Future<void> addCurrency(Currency currency) async {
    try {
      await _currenciesRef.doc(currency.countryCode).set(currency.toJson());
      state = [...state, currency];
    } catch (e) {
      // Handle error
      print("Failed to add currency: $e");
    }
  }

  Future<void> updateCurrency(Currency currency) async {
    try {
      await _currenciesRef.doc(currency.countryCode).update(currency.toJson());
      state = state
          .map((c) => c.countryCode == currency.countryCode ? currency : c)
          .toList();
    } catch (e) {
      // Handle error
      print("Failed to update currency: $e");
    }
  }

  Future<void> deleteCurrency(String countryCode) async {
    try {
      await _currenciesRef.doc(countryCode).delete();
      state = state.where((c) => c.countryCode != countryCode).toList();
    } catch (e) {
      // Handle error
      print("Failed to delete currency: $e");
    }
  }
}
