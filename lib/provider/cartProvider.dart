import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testproject/model/productModel.dart';
import 'package:testproject/utils/app_colors.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];
  double shipmentCost = 0.0;
  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    int existingIndex = _cartItems.indexWhere((cartItem) => cartItem.id == product.id);

    if (existingIndex != -1) {
    print("already exist");

    Fluttertoast.showToast(
        msg: "Item already exist",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    }
    else{
      Fluttertoast.showToast(
          msg: "Product added successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.black,
          textColor: Colors.black,
          fontSize: 16.0);
      _cartItems.add(product);
    }
    notifyListeners();
  }
  void removeCart(int? index) {
    _cartItems.removeAt(index!);
    notifyListeners();
  }
  // int calculatedValue(int? index){
  //   int? total;
  //  total=total! + _cartItems[index!].price!.toInt();
  //  notifyListeners();
  //  return total;
  // }

  double calculateTotalCost() {
    double totalCost = 0.0;
    for (var item in _cartItems) {
      totalCost +=item.quantity* item.price!.toInt();
    }
    totalCost += shipmentCost;
    return totalCost;
  }
}