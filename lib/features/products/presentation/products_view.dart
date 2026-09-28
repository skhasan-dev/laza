import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/common/index.dart';
import 'package:laza/gen/assets.gen.dart';

class ProductsView extends StatefulWidget {
  const new({super.key});

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
          ],
        ),
      ),
    );
  }
}
