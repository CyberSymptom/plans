import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RejalarSanasi extends StatelessWidget {
  final Function sananiTanlash;
  final DateTime belgilanganKun;
  final Function() oldingiSana;
  final Function() keyingiSana;

  RejalarSanasi(this.sananiTanlash, this.belgilanganKun, this.oldingiSana, this.keyingiSana);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: oldingiSana,
            icon: Icon(
              Icons.arrow_left,
              size: 40.0,
              color: Colors.amber,
            )),
        TextButton(
            onPressed: () {
              sananiTanlash(context);
            },
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                  children: [
                    TextSpan(
                        text: "${DateFormat.EEEE().format(belgilanganKun)}, ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${DateFormat("d MMM").format(belgilanganKun)}")
                  ]),
            )),
        IconButton(
            onPressed: keyingiSana,
            icon: Icon(
              Icons.arrow_right,
              size: 40.0,
              color: Colors.amber,
            ))
      ],
    );
  }
}
