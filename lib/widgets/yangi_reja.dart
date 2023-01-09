import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YangiReja extends StatefulWidget {
  final Function rejaniQoshish;

  YangiReja(this.rejaniQoshish);

  @override
  State<YangiReja> createState() => _YangiRejaState();
}

class _YangiRejaState extends State<YangiReja> {
  
  DateTime? rejaTanlash;

  final rejaNomiController = TextEditingController();

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

  void submit() {
    if (rejaNomiController.text.isEmpty || rejaTanlash == null) {
      return;
    }
    widget.rejaniQoshish(rejaNomiController.text, rejaTanlash);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 16.0,
         left: 16.0,
         right: 16.0,
         bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 16 : 100
         ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: rejaNomiController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rejaTanlash == null
                    ? "Reja Kuni tanlanmagan!"
                    : DateFormat("EEEE, d MMMM, yyy").format(rejaTanlash!)),
                TextButton(
                  onPressed: () => kunniTanlash(context),
                  child: Text("Sanani Tanlash"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Bekor Qilish",
                      style: TextStyle(color: Colors.grey),
                    )),
                ElevatedButton(
                    onPressed: submit,
                    child: Text("Kiritish"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
