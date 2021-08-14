import 'package:flutter/material.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  ValueChanged<String> onFieldSubmitted;
  void Function() onPressed;
  ValueChanged<String> onChanged;

  InputSearch({
    @required this.controller,
    @required this.focusNode,
    @required this.onPressed,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.small),
      margin: EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Digite o nome de um produto',
          hintStyle: AppStyles.regular14(),
          prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondary, size: 24),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Theme.of(context).colorScheme.onSecondary, size: 15),
            onPressed: onPressed,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
