import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_calismasi/SayfaA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> veriKaydi() async {

    var sp = await SharedPreferences.getInstance();

    sp.setString("ad", "İzem");
    sp.setInt("yas", 25);
    sp.setDouble("boy", 1.64);
    sp.setBool("bekarMi", true);


    var arkadasListe = <String>[];
    arkadasListe.add("Nisa");
    arkadasListe.add("Aleyna");
    
    sp.setStringList("arkadasListe", arkadasListe);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Geçiş Yap"),
              onPressed: (){
                veriKaydi();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sayfaa()));

              },
            ),
          ],
        ),
      ),
    );
  }
}
