import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure;
import 'package:laza/features/products/index.dart'
    show
        ProductsRepository,
        CategoriesEvent,
        CategoriesState,
        CategoriesInitial,
        CategoriesFetched,
        CategoriesLoading,
        CategoriesFailure,
        CategoriesSuccess;

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this._productsRepository) : super(const CategoriesInitial()) {
    on<CategoriesFetched>(_onCategoriesFetched);
  }

  final ProductsRepository _productsRepository;

  Future<void> _onCategoriesFetched(
    CategoriesFetched event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());

    final result = await _productsRepository.getCategories(page: 1);

    result.fold(
      (failure) {
        emit(
          CategoriesFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (categories) {
        emit(CategoriesSuccess(categories));
      },
    );
  }
}
