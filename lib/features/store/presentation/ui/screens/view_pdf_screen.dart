import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:share_extend/share_extend.dart';

class ViewPdfScreen extends StatefulWidget {
  ViewPdfScreen(this.path);

  final String path;

  @override
  _ViewPdfScreenState createState() => _ViewPdfScreenState();
}

class _ViewPdfScreenState extends State<ViewPdfScreen> {
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    initPdf();
  }

  initPdf() async {
    setState(() {
      _loading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    File file = new File.fromUri(Uri.parse(widget.path));
    PDFDocument doc = await PDFDocument.fromFile(file);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Comprovante de pagamento'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.center,
              child: IconButton(
                  icon: Icon(Icons.share, color: AppColors.white_900),
                  iconSize: 30,
                  onPressed: () {
                    ShareExtend.share(widget.path, "file", sharePanelTitle: "Compartilhar PDF", subject: "example-pdf");
                  }),
            )
          ],
        ),
        body: _loading ? Center(child: CircularProgressIndicator()) : PDFViewer(document: _doc));
  }
}
