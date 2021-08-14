import 'package:flutter/material.dart';
import 'package:framework/core/ui/constants/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final double elevation;
  final bool enableLeading;
  final Function customOnPopFunction;
  CustomAppBar({
    this.title,
    this.actions,
    this.elevation = 0,
    this.enableLeading = true,
    this.customOnPopFunction = null,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: actions,
      toolbarOpacity: 1.0,
      elevation: elevation,
      leading: enableLeading && Navigator.of(context).canPop()
          ? Semantics(
              value: 'Voltar',
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).appBarTheme.iconTheme.color,
                ),
                iconSize: 22,
                onPressed: customOnPopFunction == null ? () => Navigator.of(context).pop() : customOnPopFunction,
              ),
            )
          : null,
      title: new Text(
        title,
        style: AppStyles.bold14(),
      ),
      iconTheme: IconThemeData(color: Color(0xff4f8eb9)),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
