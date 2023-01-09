import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/reja_modeli.dart';

class RejalarSoni extends StatelessWidget {
  List<RejaModeli> rejalar;

  RejalarSoni(this.rejalar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rejalar.length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Barcha Rejalaringiz",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rejalar.where((reja) => reja.bajarildi).length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Bajarilgan Rejalaringiz",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
