Map<String, dynamic> convertToStandardJson(dynamic serialized) {
  if (serialized is List) {
    Map<String, dynamic> result = {};
    for (int i = 0; i < serialized.length; i += 2) {
      result[serialized[i]] = serialized[i + 1];
    }
    return result;
  }
  return serialized as Map<String, dynamic>;
}
