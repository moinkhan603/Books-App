import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

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
        "https://firebasestorage.googleapis.com/v0/b/basic-84916.appspot.com/o/Labmongodb.pdf?alt=media&token=9525c5f6-f835-4343-a3eb-7319e692f643");

    setState(() {
      _isLoading=false;
    });
  }

}
