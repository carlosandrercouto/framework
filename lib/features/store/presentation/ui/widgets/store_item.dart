import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';

class StoreItem extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String titleButton;
  final Color colorButton;
  final VoidCallback onPressed;

  StoreItem({
    @required this.image,
    @required this.name,
    @required this.price,
    @required this.titleButton,
    @required this.colorButton,
    @required this.onPressed,
  });

  @override
  _StoreItemState createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(AppDimens.small),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              widget.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.name,
                    style: AppStyles.bold16(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: AppDimens.small),
                  Text(widget.price, style: AppStyles.bold14()),
                  SizedBox(height: AppDimens.small),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(widget.colorButton)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.titleButton,
                          style: AppStyles.regular12().copyWith(color: AppColors.white_900),
                        ),
                        SizedBox(width: AppDimens.small),
                        Icon(
                          FontAwesomeIcons.shoppingCart,
                          color: AppColors.white_900,
                          size: 16,
                        )
                      ],
                    ),
                    onPressed: widget.onPressed,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
