import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'CommonMethods.dart';
class PdfView extends StatefulWidget {
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Document"),centerTitle: true,backgroundColor: Colors.black,),
   body: Center(
    child: _isLoading
    ? Center(child: CircularProgressIndicator())
        : PDFViewer(document: document
    ,

    )),
    );




  }

  loadDocument()async{

    document = await PDFDocument.fromURL(
        CM.pdf);

    setState(() {
      _isLoading=false;
    });
  }

}
