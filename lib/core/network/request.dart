enum RequestMethod { get, post, put, delete }

sealed class Request {
  Request({
    required this.path,
    required this.method,
    this.queryParams,
    this.body,
  });

  final String path;
  final RequestMethod method;

  final Map<String, dynamic>? queryParams;
  final Object? body;

  String get uri {
    return 'https://dummyjson.com/$path';
  }
}
