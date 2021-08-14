import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _inputUserController = new TextEditingController();
  final FocusNode _inputUserFocus = new FocusNode();

  final TextEditingController _inputPasswordController = new TextEditingController();
  final FocusNode _inputPasswordFocus = new FocusNode();

  String _formValidator(String value) {
    if (value.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return null;
    }
  }

  void _formSubmit() {
    bool isFieldsValid = _formKey.currentState.validate();

    if (isFieldsValid) {
      Navigator.of(context).pushReplacementNamed('store');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 780, allowFontScaling: false);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      // Cor bg StatusBar Android
      statusBarColor: Colors.transparent,
      // Cor ícones StatusBar Android
      statusBarIconBrightness: Brightness.dark,
      // Cor ícones StatusBar IOS
      statusBarBrightness: Brightness.dark,
      // Cor da Navigation Bar Android(Não disponível em todos os devices)
      systemNavigationBarColor: AppColors.endGradientColor,
    ));

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppDimens.medium, vertical: AppDimens.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/img/logo_purple.png',
                width: 240,
                height: 33,
              ),
              SizedBox(height: AppDimens.large),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 268),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _inputUserController,
                        focusNode: _inputUserFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Login',
                          labelStyle: AppStyles.regular16(),
                          counter: SizedBox.shrink(),
                          hintStyle: AppStyles.regular16(),
                        ),
                        onFieldSubmitted: (value) {
                          if (value.trim().isNotEmpty) {
                            _inputUserFocus.unfocus();
                            FocusScope.of(context).requestFocus(_inputPasswordFocus);
                          }
                        },
                        validator: _formValidator,
                      ),
                      TextFormField(
                        controller: _inputPasswordController,
                        focusNode: _inputPasswordFocus,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: AppStyles.regular16(),
                          counter: SizedBox.shrink(),
                          hintStyle: AppStyles.regular16(),
                        ),
                        onFieldSubmitted: (value) {
                          _formSubmit();
                        },
                        validator: _formValidator,
                      ),
                      SizedBox(height: AppDimens.largest),
                      ElevatedButton(
                        child: Text(
                          'Entrar',
                          style: AppStyles.regular12().copyWith(color: AppColors.white_900),
                        ),
                        onPressed: _formSubmit,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
