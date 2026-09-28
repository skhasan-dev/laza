import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure;
import 'package:laza/features/products/index.dart'
    show
        ProductsEvent,
        ProductsState,
        ProductsInitial,
        ProductsFetched,
        ProductsRepository,
        ProductsLoading,
        ProductsFailure,
        ProductsSuccess,
        ProductFetechedById;

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this._productsRepository) : super(const ProductsInitial()) {
    on<ProductsFetched>(_onProductsFetched);
    on<ProductFetechedById>(_onProductFetchedById);
  }

  final ProductsRepository _productsRepository;

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());

    final result = await _productsRepository.getProducts(page: 1);

    result.fold(
      (failure) {
        emit(
          ProductsFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (products) {
        emit(ProductsSuccess(products));
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
        emit(ProductsSuccess([?product]));
      },
    );
  }
}
