extension ListtoJsonExtension<K, V> on List<MapEntry<K, V>> {
  Map<K, V> get asMap => Map.fromEntries(this);
}
