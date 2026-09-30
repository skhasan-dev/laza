extension StringExt on String {
  String get getInitials {
    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .take(2)
        .join();
  }
}
