import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayi_tahmin_uygulamasi/SayfaB.dart';

class SayfaA extends StatefulWidget {

  @override
  _SayfaAState createState() => _SayfaAState();

}

class _SayfaAState extends State<SayfaA> {

  late var ekranBoyutu = MediaQuery.of(context);
  late var ekranGenisligi = ekranBoyutu.size.width;
  late var ekranYuksekligi = ekranBoyutu.size.height;

  var tfGiris = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101); // 0 - 100
    print("Rasgele Sayı : $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Tahmin Ekranı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
             Padding(
               padding: EdgeInsets.only(top: ekranYuksekligi/8,bottom: ekranYuksekligi/10),
               child: Text("Kalan Hak : $kalanHak",style: TextStyle(fontSize: ekranGenisligi/14,color: Colors.purple),
               ),
             ),
              Text("$yonlendirme"),
              Padding(
                padding: EdgeInsets.only(left: ekranGenisligi/10,right: ekranGenisligi/10,top: ekranYuksekligi/8,bottom: ekranYuksekligi/8),
                child: TextField(
                  controller: tfGiris,
                  keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   labelText: "Tahmin",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),

                 ),
                  textAlign: TextAlign.center,
              ),
             ),
              SizedBox(
                width: ekranGenisligi/2,
                height: ekranYuksekligi/14,
                child: ElevatedButton(
                 child: Text("Tahmin ET",style: TextStyle(color: Colors.white),),
                 style: ElevatedButton.styleFrom(
                   primary: Colors.purple
                 ),
                 onPressed: ()
                  {
                    setState(() {
                      kalanHak = kalanHak - 1;
                    });

                    if(kalanHak == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB(sonuc: false,)));
                    }

                    int tahmin = int.parse(tfGiris.text);

                    if(tahmin == rasgeleSayi){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB(sonuc: true,)));
                      return;
                    }

                    if(tahmin > rasgeleSayi){
                      setState(() {
                        yonlendirme = "Tahmini Azalt..";
                      });
                    }

                    if(tahmin < rasgeleSayi){
                      setState(() {
                        yonlendirme = "Tahmini Arttır!";
                      });
                    }

                    if(kalanHak == 0){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaB(sonuc: false,)));
                    }



                    tfGiris.text = "";

                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
