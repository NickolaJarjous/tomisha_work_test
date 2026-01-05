import 'package:get/get.dart';

import '../../local/get_storage_helper.dart';

class EndPoints {
  static String baseUrl = Get.find<GetStorageHelper>().baseUrl;
  static String searchBaseUrl = 'https://search.inkcode.io/searchy_backend/api/';
  static String imageSearchBaseUrl = 'http://ai.inkcode.io:8000/';
  static String mediaBaseUrl = '';
  static const Duration receiveTimeout = Duration(seconds: 50000);
  static const Duration connectionTimeout = Duration(seconds: 50000);

  static const category = 'api/category';
  static const news = 'api/news';
  static const products = 'api/products';
  static const colors = 'api/color';
  static const variations = 'api/variations';
  static const addToCartGuest = 'api/guestcart';
  static const addToCartLoggedIn = 'api/cart';
  static const getCart = 'api/cartuuid';
  static const deleteCartItem = 'api/cart';
  static const getCountriesAndStates = 'api/country';
  static const register = 'api/register';
  static const login = 'api/login';
  static const getShippingMethods = 'api/shipping-rule';
  static const storeOrder = 'api/mobile-order';
  static const checkIfAccountExists = 'api/check-account';
  static const checkIfProductInWishlist = 'api/checkwishlist';
  static const wishlist = 'api/wishlist';
  static const removeFromWishlist = 'api/remove-wishlist';

}
