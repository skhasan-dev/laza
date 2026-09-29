import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/products/index.dart'
    show ProductsRepository, Product;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._productsRepository) : super(const ProductsInitial()) {
    on<ProductsFetched>(_onProductsFetched);
    on<ProductFetechedById>(_onProductFetchedById);
    on<ProductAddedToCart>(_onProductAddedToCart);
  }

  final ProductsRepository _productsRepository;

  int page = 1;
  bool noMoreDataAvailable = false;
  List<Product> allProducts = [];

  Product? _product;

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductsState> emit,
  ) async {
    if (event.notify) {
      page = 1;
      noMoreDataAvailable = false;
      allProducts.clear();

      emit(const ProductsLoading());
    } else {
      if (noMoreDataAvailable) return;

      emit(ProductsPaginationLoading(allProducts));
    }

    final result = await _productsRepository.getProducts(
      page: page,
      category: event.category,
      search: event.query,
    );

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (products) {
        if (products.isEmpty || products.length < 10) {
          noMoreDataAvailable = true;
        } else {
          page += 1;
        }
        allProducts.addAll(products);
        emit(ProductsSuccess([...allProducts]));
      },
    );
  }

  Future<void> _onProductFetchedById(
    ProductFetechedById event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());

    final result = await _productsRepository.getProductById(id: event.uid);

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (product) {
        _product = product;
        emit(ProductsSuccess([?product]));
      },
    );
  }

  Future<void> _onProductAddedToCart(
    ProductAddedToCart event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductAddingToCart(_product));

    final result = await _productsRepository.addToCart(product: _product!);

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (_) {
        emit(ProductAddToCartSuccess(_product));
      },
    );
  }
}
