import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/SayfaA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late var ekranBoyutu = MediaQuery.of(context);
  late var ekranGenisligi = ekranBoyutu.size.width;
  late var ekranYuksekligi = ekranBoyutu.size.height;
  late var r = Random();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Tahmin Oyunu"),
        centerTitle: true,
        actions:
        [

          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: (){

              showDialog(
               context: context,
               builder: (BuildContext context){
                 return AlertDialog(
                   shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                   backgroundColor: Colors.orangeAccent,
                   title: Text("Nasıl Oynanır?",textAlign: TextAlign.center,),
                   content: Text("Oyunu başlattığınızda 0 ile 100 arasında rastgele bir sayı seçilir ve bunun yanında size 5 tahmin hakkı verilir. Seçilen sayıyı bulmak için 5 hakkınız var ve yaptığınız her tahminde size sayıyı bulmanıza yardım edecek bir ipucu verilir. \n Sayıyı Bulun, Bol Şans! ",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic),),
                 );
              }
             );
            },
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Padding(
                padding: EdgeInsets.only(top: ekranYuksekligi/12),
                child: Text("Tahmin Etmeye \nBaşla!",textAlign: TextAlign.center,style: TextStyle(fontSize: ekranGenisligi/12,color: Colors.black,fontStyle: FontStyle.italic),),
              ),
              Padding(
                padding: EdgeInsets.all(ekranGenisligi/5),
                child: Image.asset("Resimler/zar.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ekranYuksekligi/8),
                child: SizedBox(
                  width: ekranGenisligi/2.0,
                  height: ekranYuksekligi/13,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    ),
                    child: Text("Oyuna Başla!"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
