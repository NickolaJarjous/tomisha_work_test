import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/local/get_storage_helper.dart';

class InitBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => GetStorageHelper(), fenix: true),
      Bind.lazyPut(() => GetStorage(), fenix: true),
    ];
  }
}
