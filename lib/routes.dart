import 'package:get/get.dart';
import 'package:products_api/view/auth/screen/register_account_screen.dart';
import 'package:products_api/view/auth/screen/sign_in_screen.dart';
import 'package:products_api/view/details/screen/details_screen.dart';
import 'package:products_api/view/favourite/screen/favourite_screen.dart';
import 'package:products_api/view/home/screen/home_screen.dart';
import 'package:products_api/view/my_cart/screen/my_cart_screen.dart';
import 'package:products_api/view/notifications/screen/notifications_screen.dart';
import 'package:products_api/view/profile/screen/profile_screen.dart';
import 'package:products_api/view/search/screen/search_screen.dart';
import 'package:products_api/view/side_menu/screen/side_menu_screen.dart';

List<GetPage<dynamic>>? routes=[

  GetPage(name: '/registerScreen', page: ()=> RegisterAccountScreen()),
  GetPage(name: '/signInScreen', page: ()=> SignInScreen()),

  GetPage(name: '/homeScreen', page: ()=> HomeScreen()),
  GetPage(name: '/profileScreen', page: ()=> ProfileScreen()),

  GetPage(name: '/detailsScreen', page: ()=> DetailsScreen()),
  GetPage(name: '/favouriteScreen', page: ()=> FavouriteScreen()),
  GetPage(name: '/myCartScreen', page: ()=> MyCartScreen()),

  GetPage(name: '/notificationsScreen', page: ()=> NotificationsScreen()),
  GetPage(name: '/searchScreen', page: ()=> SearchScreen()),
  GetPage(name: '/sideMenuScreen', page: ()=> SideMenuScreen()),

  //welcome screen addddddddd



];
