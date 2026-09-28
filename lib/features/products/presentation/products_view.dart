import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/common/index.dart';
import 'package:laza/features/products/index.dart';
import 'package:laza/gen/assets.gen.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leading: Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.platinum,
          ),
          child: SvgPicture.asset(
            Assets.icons.openMenu.path,
            height: 25,
            width: 25,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: AppTextStyles.s28W600.copyWith(
                color: AppColors.carbonBlack,
              ),
            ),
            Text(
              'Welcome to Laza.',
              style: AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: AppTextStyles.s17W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                Text(
                  'View All',
                  style: AppTextStyles.s13W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [...categories.map((c) => CategoryCard(category: c))],
              ),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arrival',
                  style: AppTextStyles.s17W500.copyWith(
                    color: AppColors.carbonBlack,
                  ),
                ),
                Text(
                  'View All',
                  style: AppTextStyles.s13W400.copyWith(
                    color: AppColors.coolSteel,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 260,
              ),
              itemCount: products.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Category> categories = [
    Category(name: 'Nike', slug: 'nike', url: 'nike'),
    Category(name: 'Fila', slug: 'fila', url: 'fila'),
  ];

  List<Product> products = [
    Product(
      title: 'Nike Sportswear Club Fleece',
      price: 9.99,
      thumbnail: 'https://picsum.photos/200',
    ),
    Product(
      title: 'Trail Running Jacket Nike Windrunner',
      price: 8.99,
      thumbnail: 'https://picsum.photos/400',
    ),
    Product(
      title: 'Training Top Nike Sport Clash',
      price: 4.99,
      thumbnail: 'https://picsum.photos/600',
    ),
    Product(
      title: 'Nike Sportswear Club Fleece',
      price: 9.99,
      thumbnail: 'https://picsum.photos/200',
    ),
  ];
}
