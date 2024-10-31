import 'package:get/get.dart';
import 'package:products_api/model/products_model.dart';

class FavouriteController extends GetxController{
  var favouriteProducts = <Details>[].obs;
  var cartItems = <Details>[];


  // Add to favorite
  void addToFavourite(Details product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
    update();
  }

  // Check if product is in favorites
  bool isFavourite(Details product) {
    return favouriteProducts.contains(product);
  }

  void removeFromFavourite(Details product) {
    favouriteProducts.remove(product);
    update();
  }

  void deleteAllFavourite() {
    favouriteProducts.clear();
    update();
  }

}