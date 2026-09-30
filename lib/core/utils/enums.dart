import 'package:laza/gen/assets.gen.dart';

enum NavItem {
  home(label: 'Home'),
  wishlist(label: 'Wishlist'),
  orders(label: 'Orders'),
  cart(label: 'Cart');

  const NavItem({required this.label});

  final String label;

  String get iconPath {
    switch (this) {
      case NavItem.home:
        return Assets.icons.home.path;
      case NavItem.wishlist:
        return Assets.icons.heart.path;
      case NavItem.cart:
        return Assets.icons.wallet.path;
      case NavItem.orders:
        return Assets.icons.wallet.path;
    }
  }
}
