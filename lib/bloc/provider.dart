import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/bloc/repository/homerepo.dart';
import 'package:app/bloc/notifier/homenotifier.dart';
import 'package:app/bloc/repository/loginrepo.dart';
import 'package:app/bloc/notifier/loginnotifier.dart';

final homeRepoProvider = Provider.autoDispose<HomeRepo>((ref) {
  return HomeSubRepo();
});

final homeNotifierProvider = StateNotifierProvider.autoDispose(
  (ref) => HomeNotifier(ref.watch(homeRepoProvider)),
);

final loginRepoProvider = Provider.autoDispose<LoginRepo>((ref) {
  return LoginSubRepo();
});
final loginNotifierProvider = StateNotifierProvider.autoDispose(
  (ref) => LoginNotifier(ref.watch(loginRepoProvider)),
);
