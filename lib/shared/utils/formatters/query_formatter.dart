/// Responsible for converting query parameters
class QueryFormatter {
  /// Responsible for forming the query parameters
  static String formatQueryParameters({
    required Map<String, dynamic>? parameters,
  }) {
    var queryParameters = '?';
    if (parameters != null) {
      parameters.forEach((String k, dynamic v) => queryParameters = '$queryParameters$k=$v&');
    }
    return queryParameters.substring(0, queryParameters.length - 1);
  }
}

extension QueryFormatterExt on Map<String, dynamic>? {
  /// Responsible for converting the query parameters
  Map<String, String> parseQueryParameters() {
    final query = this;
    if (query != null) {
      final queryParameters = query.map((key, dynamic value) {
        if (value is List) {
          return MapEntry<String, String>(key, value.join(','));
        } else {
          return MapEntry<String, String>(key, '$value');
        }
      });
      return queryParameters;
    }
    return {};
  }
}
