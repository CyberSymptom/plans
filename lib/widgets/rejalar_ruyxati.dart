import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejalar_dasturi/models/reja_modeli.dart';
import './reja.dart';
import '../models/reja_modeli.dart';


class RejalarRoyhati extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function belgila;
  final Function rejaniUchir;
  RejalarRoyhati(this.rejalar, this.belgila, this.rejaniUchir);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: rejalar.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Reja(rejalar[index], belgila, rejaniUchir);
              },
              itemCount: rejalar.length,
            )
          : Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Hozircha Rejalar yo'q, Uxlang!",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  "assets/images/sleep.png",
                  fit: BoxFit.cover,
                  width: 250.0,
                )
              ],
            ),
    );
  }
}
