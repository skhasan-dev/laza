sealed class ProductsEvent {
  const ProductsEvent();
}

final class ProductsFetched extends ProductsEvent {
  const ProductsFetched();
}

final class ProductsSearched extends ProductsEvent {
  const ProductsSearched();
}
