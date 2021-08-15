import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/core/ui/constants/app_dimens.dart';
import 'package:framework/core/ui/constants/app_styles.dart';
import 'package:framework/core/ui/widgets/custom_app_bar.dart';
import 'package:path_provider/path_provider.dart';

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
    templateHTML();
  }

  Future<void> templateHTML() async {
    final htmlContent = """
    <!DOCTYPE html>
    <html>
      <head>
        <style>
          html, body {
            width: 100%;
          }
        </style>
      </head>
      <body>
       <div style="width: 100%; display: flex; flex-direction: column;">
          <h2 style="font-size:20px; color: #5f3473;">Detalhes da compra</h2>
        
          <ul>
            <li><p style="font-size:16px;"><strong>Total do pedido: </strong> ${widget.purchaseValue}</p></li>
            <li><p style="font-size:16px;"><strong>Produtos do pedido: </strong> ${widget.purchaseProducts}</p></li>
          </ul>
  
          <div style="display:flex; flex-wrap:wrap; justify-content:center; margin-top:50px;">
            <img style="width:100px; height:100px; object-fit:contain;" src="https://media-exp1.licdn.com/dms/image/C560BAQEpMK9fjp29IA/company-logo_200_200/0/1519866108006?e=2159024400&v=beta&t=tH705_pZXOlqZGN9lqPaRUsmF6mxQVsAwxzGbSBG03E">
          </div>
        </div>
      </body>
    </html>
    """;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    final targetFileName = "example-pdf";

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PDFViewerScaffold(
                            appBar: CustomAppBar(
                              title: "Comprovante de pagamento",
                            ),
                            path: generatedPdfFilePath,
                          )),
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
