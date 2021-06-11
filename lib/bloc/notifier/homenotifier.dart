import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/bloc/repository/homerepo.dart';
import 'package:app/model/photo.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInit extends HomeState {
  const HomeInit();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeOnEvent extends HomeState {
  final List<Photo> listPhoto;
  const HomeOnEvent(this.listPhoto);
}

class HomeErrorEvent extends HomeState {
  const HomeErrorEvent();
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeRepo _homeRepo;
  HomeNotifier(this._homeRepo) : super(HomeInit());

  void changeToEvent() {
    try {
      state = HomeLoading();
      state = HomeOnEvent([]);
    } catch (e) {
      state = HomeErrorEvent();
    }
  }

  Future getPhotoList(String page, String perPage) async {
    try {
      state = HomeLoading();
      final result = await _homeRepo.getData(page, perPage);
      state = HomeOnEvent(result);
    } catch (e) {
      state = HomeErrorEvent();
    }
  }
}
