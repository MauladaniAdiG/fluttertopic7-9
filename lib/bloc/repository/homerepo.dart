import 'package:app/service/serviceapi.dart';

abstract class HomeRepo {
  Future getData(String page, String perPage);
}

class HomeSubRepo implements HomeRepo {
  @override
  Future getData(String page, String perPage) async {
    final result = await ServiceApi().getPhotoSource(page, perPage);
    return result;
  }
}
