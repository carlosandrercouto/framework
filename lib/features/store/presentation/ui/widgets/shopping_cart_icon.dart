import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:framework/core/entities/product.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';
import 'package:framework/features/store/presentation/ui/screens/shopping_cart_screen.dart';

class ShoppingCartIcon extends StatefulWidget {
  BuildContext context;
  List<Product> productsCartList;
  ShoppingCartIcon({
    this.context,
    @required this.productsCartList,
  });

  @override
  _ShoppingCartIconState createState() => _ShoppingCartIconState();
}

class _ShoppingCartIconState extends State<ShoppingCartIcon> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      value: 'Carrinho de compras',
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: AppDimens.medium),
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.shoppingCart,
                color: Theme.of(context).appBarTheme.iconTheme.color,
                size: 22,
              ),
              if (widget.productsCartList.length > 0)
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.danger_900,
                    foregroundColor: Colors.white,
                    child: Text(widget.productsCartList.length.toString(), style: AppStyles.regular12()),
                  ),
                ),
            ],
          ),
          onTap: () {
            if (widget.productsCartList.isNotEmpty) {
              Navigator.of(context).pushNamed(
                'shoppingCart',
                arguments: ShoppingCartScreenArguments(productsCartList: widget.productsCartList),
              );
            }
          },
        ),
      ),
    );
  }
}
