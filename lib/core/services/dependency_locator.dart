import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/index.dart';
import 'package:laza/features/authentication/index.dart'
    show
        AuthenticationDatasource,
        AuthenticationDatasourceImpl,
        AuthenticationRepository,
        AuthenticationRepositoryImpl,
        ForgotPasswordBloc,
        LoginBloc,
        RegisterBloc;
import 'package:laza/features/cart/index.dart';
import 'package:laza/features/orders/index.dart'
    show
        OrdersBloc,
        OrdersDataSource,
        OrdersDataSourceImpl,
        OrdersRepository,
        OrdersRepositoryImpl;
import 'package:laza/features/products/index.dart';
import 'package:laza/features/profile/index.dart';
import 'package:laza/features/reviews/index.dart';
import 'package:laza/features/wishlist/index.dart';

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton(NetworkService.new)
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton<KeysRepository>(() => KeysRepository())
    ..registerLazySingleton<AppStateProvider>(
      () => AppStateProvider(firebaseAuth: getIt(), profileRepository: getIt()),
    )
    ..registerLazySingleton<AuthenticationDatasource>(
      () => AuthenticationDatasourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(datasource: getIt()),
    )
    ..registerLazySingleton<RegisterBloc>(() => RegisterBloc(getIt()))
    ..registerLazySingleton<LoginBloc>(() => LoginBloc(getIt()))
    ..registerLazySingleton<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(getIt()),
    )
    ..registerLazySingleton<ProductsDataSource>(
      () => ProductsDataSourceImpl(
        networkService: getIt(),
        firebaseFirestore: getIt(),
        firebaseAuth: getIt(),
      ),
    )
    ..registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<ProductsBloc>(() => ProductsBloc(getIt()))
    ..registerFactory<CategoriesBloc>(() => CategoriesBloc(getIt()))
    ..registerFactory<ProductCardBloc>(() => ProductCardBloc(getIt()))
    ..registerLazySingleton<ReviewsDataSource>(
      () => ReviewsDataSourceImpl(firebaseFirestore: getIt()),
    )
    ..registerLazySingleton<ReviewsRepository>(
      () => ReviewsRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<ReviewBloc>(() => ReviewBloc(getIt()))
    ..registerLazySingleton<WishlistDataSource>(
      () => WishlistDataSourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<WishlistRepository>(
      () => WishlistRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<WishlistBloc>(() => WishlistBloc(getIt()))
    ..registerLazySingleton<CartDataSource>(
      () =>
          CartDataSourceImpl(firebaseAuth: getIt(), firebaseFirestore: getIt()),
    )
    ..registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartDataSource: getIt()),
    )
    ..registerFactory<CartBloc>(() => CartBloc(getIt()))
    ..registerFactory<AddressBloc>(() => AddressBloc(getIt()))
    ..registerFactory<PaymentCardBloc>(() => PaymentCardBloc(getIt()))
    ..registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<ProfileBloc>(() => ProfileBloc(getIt()))
    ..registerLazySingleton<OrdersDataSource>(
      () => OrdersDataSourceImpl(
        firebaseAuth: getIt(),
        firebaseFirestore: getIt(),
      ),
    )
    ..registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(dataSource: getIt()),
    )
    ..registerFactory<OrdersBloc>(() => OrdersBloc(getIt()));
}
