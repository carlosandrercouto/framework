import 'dart:io';

import 'package:flutter/material.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';
import 'package:framework/core/ui/widgets/custom_app_bar.dart';
import 'package:framework/features/store/presentation/ui/screens/view_pdf_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class PurchaseConfirmationScreen extends StatefulWidget {
  final String purchaseValue;
  final String purchaseProducts;

  PurchaseConfirmationScreen({
    this.purchaseValue,
    this.purchaseProducts,
  });

  @override
  _PurchaseConfirmationScreenState createState() => _PurchaseConfirmationScreenState();
}

class _PurchaseConfirmationScreenState extends State<PurchaseConfirmationScreen> {
  String generatedPdfFilePath;

  @override
  void initState() {
    super.initState();
  }

  _creatPdf({contex, purchaseProducts, purchaseValue}) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    pdf.addPage(pdfLib.MultiPage(
        build: (context) => [
              pdfLib.Column(
                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                mainAxisSize: pdfLib.MainAxisSize.max,
                children: [
                  pdfLib.Center(
                    child: pdfLib.Text(
                      'Comprovante de pagamento',
                      style: pdfLib.TextStyle(fontSize: 18, color: PdfColor.fromInt(0xFF5f3473)),
                    ),
                  ),
                  pdfLib.SizedBox(height: AppDimens.large),
                  pdfLib.Text(
                    'Resumo do pedido:',
                    style: pdfLib.TextStyle(fontSize: 14),
                  ),
                ],
              ),
              pdfLib.SizedBox(height: AppDimens.small),
              pdfLib.Table.fromTextArray(data: <List<String>>[
                <String>['Produtos', 'Valor total'],
                [purchaseProducts, purchaseValue]
              ])
            ]));

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/pdfExample.pdf';
    final File file = File(path);
    file.writeAsBytesSync(pdf.save());

    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => ViewPdfScreen(
              path,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Compra confirmada'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.medium, vertical: AppDimens.medium),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppDimens.small),
              decoration: BoxDecoration(
                color: AppColors.warning_100,
                borderRadius: BorderRadius.circular(AppDimens.smallest),
              ),
              child: Text(
                'Tudo certo, o pedido foi confirmado, clique no botão abaixo para visualizar o comprovante de pagamento.',
                style: AppStyles.regular14(),
              ),
            ),
            SizedBox(height: AppDimens.large),
            ElevatedButton(
              child: Text(
                "Comprovante de pagamento",
                style: AppStyles.regular12().copyWith(color: AppColors.white_900),
              ),
              onPressed: () {
                _creatPdf(
                  contex: context,
                  purchaseProducts: widget.purchaseProducts,
                  purchaseValue: widget.purchaseValue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PurchaseConfirmationScreenArguments {
  final String purchaseValue;
  final String purchaseProducts;

  PurchaseConfirmationScreenArguments({
    @required this.purchaseValue,
    @required this.purchaseProducts,
  });
}
