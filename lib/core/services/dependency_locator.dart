import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/features/authentication/index.dart'
    show
        AuthenticationDatasource,
        AuthenticationDatasourceImpl,
        AuthenticationRepository,
        AuthenticationRepositoryImpl,
        LoginBloc,
        RegisterBloc;

GetIt getIt = GetIt.instance;

Future<void> initDependencyLocator() async {
  getIt
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
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
    ..registerLazySingleton<LoginBloc>(() => LoginBloc(getIt()));
}
