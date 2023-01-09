import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejalar_dasturi/models/reja_modeli.dart';
import '../models/reja_modeli.dart';

class Reja extends StatelessWidget {
  final RejaModeli reja;
  final Function belgila;
  final Function rejaniUchir;

  Reja(this.reja, this.belgila, this.rejaniUchir);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
          onPressed: () {
            belgila(reja.id);
          },
          icon: Icon(
            reja.bajarildi ? Icons.check_circle_outline : Icons.circle_outlined,
            size: 20.0,
            color: reja.bajarildi ? Colors.green : Colors.red,
          )),
      title: Text(
        reja.nomi,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            decoration: reja.bajarildi
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: reja.bajarildi ? Colors.grey : Colors.black),
      ),
      trailing: IconButton(
          onPressed: () {
            rejaniUchir(reja.id);
          },
          icon: const Icon(
            Icons.delete_forever_outlined,
            size: 23.0,
            color: Colors.red,
          )),
    );
  }
}
