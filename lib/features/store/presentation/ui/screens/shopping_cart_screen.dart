import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:framework/core/entities/product.dart';
import 'package:framework/core/formatters/formatters.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';
import 'package:framework/core/ui/widgets/custom_app_bar.dart';

class ShoppingCartScreen extends StatefulWidget {
  List<Product> productsCartList;

  ShoppingCartScreen({this.productsCartList});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState(this.productsCartList);
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  _ShoppingCartScreenState(this.productsCartList);

  List<Product> productsCartList;

  String shoppingCartTotal;

  void updateShoppingCartTotal() {
    List<double> prices = [];

    if (productsCartList.isEmpty) {
      shoppingCartTotal = Formatters.parseCurrency(0);
    }

    for (Product data in productsCartList) {
      prices.add(data.price);
      double sum = prices.reduce((previous, current) => previous + current);

      shoppingCartTotal = Formatters.parseCurrency(sum);
    }
  }

  @override
  void initState() {
    super.initState();
    updateShoppingCartTotal();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Carrinho de Compras',
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: AppDimens.medium, bottom: 120),
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                  itemCount: productsCartList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      child: Card(
                        elevation: 4.0,
                        child: ListTile(
                          title: Text(productsCartList[index].name),
                          leading: Text(Formatters.parseCurrency(productsCartList[index].price)),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  productsCartList.remove(productsCartList[index]);
                                });
                                updateShoppingCartTotal();
                              }),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 100,
                padding: EdgeInsets.all(AppDimens.small),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(6, 0),
                      blurRadius: 5,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total do pedido:', style: AppStyles.bold14()),
                        Text(shoppingCartTotal ?? '', style: AppStyles.bold16().copyWith(color: AppColors.primary_800)),
                      ],
                    ),
                    SizedBox(height: AppDimens.small),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          'Confirmar a compra',
                          style: AppStyles.regular12().copyWith(color: AppColors.white_900),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartScreenArguments {
  final List<Product> productsCartList;

  ShoppingCartScreenArguments({
    @required this.productsCartList,
  });
}
