import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rejalar_dasturi/widgets/yangi_reja.dart';
import './widgets/rejalar_sanasi.dart';
import './widgets/rejalar_soni.dart';
import './widgets/rejalar_ruyxati.dart';
import './widgets/reja.dart';
import './models/reja_modeli.dart';
import './widgets/yangi_reja.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RejalarDasturi(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.montserrat().fontFamily),
    );
  }
}

class RejalarDasturi extends StatefulWidget {
  @override
  State<RejalarDasturi> createState() => _RejalarDasturiState();
}

class _RejalarDasturiState extends State<RejalarDasturi> {
  Rejalar rejalar = Rejalar();

  DateTime belgilanganKun = DateTime.now();
  DateTime? rejaTanlash = DateTime.now();

  void sananiTanlash(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2024))
        .then((tanlanganKun) {
      if (tanlanganKun != null) {
        setState(() {
          belgilanganKun = tanlanganKun;
        });
      }
    });
  }

  void oldingiSana() {
    setState(() {
      belgilanganKun = DateTime(
          belgilanganKun.year, belgilanganKun.month, belgilanganKun.day - 1);
    });
  }

  void keyingiSana() {
    setState(() {
      belgilanganKun = DateTime(
          belgilanganKun.year, belgilanganKun.month, belgilanganKun.day + 1);
    });
  }

  void belgila(String rejaID) {
    setState(() {
      rejalar.KunBoyicha(belgilanganKun)
          .firstWhere((reja) => reja.id == rejaID)
          .bajarildiniUzgartirish();
    });
  }

  void rejaniUchir(String rejaID) {
    setState(() {
      rejalar.ruyxat.removeWhere((reja) => reja.id == rejaID);
    });
  }

  void kunniTanlash(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2031))
        .then((tanlangankKun) {
      if (tanlangankKun != null) {
        setState(() {
          rejaTanlash = tanlangankKun;
        });
      }
    });
  }

  void RejaQoshish(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return YangiReja(rejaniQoshish);
        });
  }

  void rejaniQoshish(String rejaNomi, DateTime rejaKuni) {
    setState(() {
      rejalar.addTodo(rejaNomi, rejaKuni);

      Navigator.of(context).pop();
    });
  }

  int get Rejalarsoni {
    return rejalar.KunBoyicha(belgilanganKun)
        .where((reja) => reja.bajarildi)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rejalar Dasturi"),
      ),
      body: Column(children: [
        RejalarSanasi(sananiTanlash, belgilanganKun, oldingiSana, keyingiSana),
        RejalarSoni(rejalar.KunBoyicha(belgilanganKun)),
        RejalarRoyhati(
            rejalar.KunBoyicha(belgilanganKun), belgila, rejaniUchir),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RejaQoshish(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

