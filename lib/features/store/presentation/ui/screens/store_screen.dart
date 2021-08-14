import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:framework/core/entities/product.dart';
import 'package:framework/core/helpers/api_helper.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/widgets/custom_app_bar.dart';
import 'package:framework/features/store/presentation/ui/widgets/input_search.dart';
import 'package:framework/features/store/presentation/ui/widgets/shopping_cart_icon.dart';
import 'package:framework/features/store/presentation/ui/widgets/store_item.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final TextEditingController _inputSearchController = new TextEditingController();
  final FocusNode _inputSearchFocus = new FocusNode();

  List<Product> allProductsList = ApiHelper.instance.storeProducts();
  List<Product> productsList;
  String searchQuery = '';
  List<Product> _productsCartList = List<Product>();

  /// Filtra produtos na ListView
  void searchProducts(String query) {
    final products = allProductsList.where((product) {
      final productNameLower = product.name.toLowerCase();
      final productPriceLower = product.price.toLowerCase();
      final productSearchLower = query.toLowerCase();

      return productNameLower.contains(productSearchLower) || productPriceLower.contains(productSearchLower);
    }).toList();

    setState(() {
      this.searchQuery = query;
      this.productsList = products;
    });
  }

  String getTextButton(int index) {
    if (_productsCartList.contains(productsList[index])) {
      return 'Remover do carrinho';
    }
    return 'Adicionar ao carrinho';
  }

  Color getColorButton(int index) {
    if (_productsCartList.contains(productsList[index])) {
      return AppColors.danger_900;
    }
    return AppColors.secondary_800;
  }

  @override
  void initState() {
    super.initState();
    productsList = allProductsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Loja',
        actions: [ShoppingCartIcon(productsCartList: _productsCartList)],
      ),
      body: GestureDetector(
        onVerticalDragDown: (DragDownDetails details) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputSearch(
                controller: _inputSearchController,
                focusNode: _inputSearchFocus,
                onChanged: searchProducts,
                onPressed: () {
                  _inputSearchController.clear();
                  searchProducts(_inputSearchController.text);
                },
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: productsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return StoreItem(
                    image: productsList[index].image,
                    name: productsList[index].name,
                    price: productsList[index].price,
                    titleButton: getTextButton(index),
                    colorButton: getColorButton(index),
                    onPressed: () {
                      setState(() {
                        if (_productsCartList.contains(productsList[index])) {
                          _productsCartList.remove(productsList[index]);
                        } else {
                          _productsCartList.add(productsList[index]);
                        }
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 10);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
