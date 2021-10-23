import 'package:flutter/material.dart';

class SayfaB extends StatefulWidget {

  late bool sonuc;

  SayfaB({required this.sonuc});

  @override
  _SayfaBState createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {

  Future<bool> geriDonusTusu(BuildContext context) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

  late var ekranBoyutu = MediaQuery.of(context);
  late var ekranGenisligi = ekranBoyutu.size.width;
  late var ekranYuksekligi = ekranBoyutu.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
            children:
            [
             Padding(
               padding: EdgeInsets.only(top: ekranYuksekligi/7),
               child: SizedBox(
                 width: ekranGenisligi/3,
                 height: ekranYuksekligi/5,
                   child: widget.sonuc ? Image.asset("Resimler/gulucuk.jpg") : Image.asset("Resimler/uzgun.png"),
               ),
             ),
             Padding(
               padding: EdgeInsets.only(left: ekranGenisligi/8,right: ekranGenisligi/8,bottom: ekranGenisligi/10,top: ekranYuksekligi/6.5),
               child: Text(widget.sonuc ? "Kazandınız!" : "Kaybettiniz..",style: TextStyle(fontSize: ekranGenisligi/14),),
             ),
             Padding(
               padding: EdgeInsets.all(ekranYuksekligi/40),
               child: SizedBox(
               height: ekranYuksekligi/15,
               width: ekranGenisligi/2,
                 child: ElevatedButton(
                   child: Text("TEKRAR DENE"),
                   style: ElevatedButton.styleFrom(

                   ),
                   onPressed: ()
                   {
                     Navigator.of(context).popUntil((route) => route.isFirst);
                   },

                 ),
               ),
             ),
            ],

            ),
          ),
        ),
      ),

    );
  }
}
