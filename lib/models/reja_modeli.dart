class RejaModeli {
  final String id;
  final String nomi;
  final DateTime kuni;

  bool bajarildi = false;

  RejaModeli({required this.id, required this.nomi, required this.kuni});

  void bajarildiniUzgartirish() {
    bajarildi = !bajarildi;
  }
}

class Rejalar {
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: "r1", nomi: "Kitob o'qish", kuni: DateTime.now()),
    RejaModeli(id: "r2", nomi: "Bozorga borish", kuni: DateTime.now()),
    RejaModeli(id: "r3", nomi: "Flutterni o'rganish", kuni: DateTime.now()),
  ];

  List<RejaModeli> get ruyxat {
    return _ruyxat;
  }

  List<RejaModeli> KunBoyicha(DateTime kun) {
    return _ruyxat.where((todo) => todo.kuni.day == kun.day && todo.kuni.month == kun.month && todo.kuni.year == kun.year
    ).toList();
  }

  void addTodo(String rejaNomi, DateTime rejaKuni) {
    _ruyxat.add(RejaModeli(
        id: "r${_ruyxat.length + 1}", nomi: rejaNomi, kuni: rejaKuni 
        ));
  }
}
