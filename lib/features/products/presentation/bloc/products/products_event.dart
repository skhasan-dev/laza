sealed class ProductsEvent {
  const ProductsEvent();
}

final class ProductsFetched extends ProductsEvent {
  const ProductsFetched({this.category});
  final String? category;
}

final class ProductsSearched extends ProductsEvent {
  const ProductsSearched();
}

final class ProductFetechedById extends ProductsEvent {
  const ProductFetechedById(this.uid);
  final String uid;
}
