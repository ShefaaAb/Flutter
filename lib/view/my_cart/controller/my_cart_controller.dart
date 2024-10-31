import 'package:get/get.dart';
import 'package:products_api/model/products_model.dart';

class MyCartController extends GetxController{
  var cartItems = <Details>[];


  void addToCart(Details product) {
    cartItems.add(product);
    update();
  }

  void removeFromCart(Details product) {
    cartItems.remove(product);
    update();
  }

  void deleteAllCart() {
    cartItems.clear();
    update();
  }

  Map<Details, int> getCartItemsWithQuantities() {
    final Map<Details, int> quantities = {};
    for (var product in cartItems) {
      quantities[product] = productQuantity(product);
    }
    return quantities;
  }


  int get totalItems => cartItems.length;


  double get totalPrice => cartItems.fold(0, (sum, product) => sum + product.price);
  double get total=> cartItems.fold(0, (sum, product) => sum + product.price);

  int productQuantity(Details product) {
    return cartItems.where((p) => p == product).length;
  }


}