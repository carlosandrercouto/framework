import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:framework/core/entities/product.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Carrinho de Compras',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: AppDimens.medium),
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
                    leading: Text('R\$ ${productsCartList[index].price}'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            productsCartList.remove(productsCartList[index]);
                          });
                        }),
                  ),
                ),
              );
            }),
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
