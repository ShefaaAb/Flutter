import 'package:get/get.dart';
import 'package:products_api/core/classes/crud.dart';

class InitializeBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(Crud());
  }

}