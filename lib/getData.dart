import 'package:flutter/material.dart';
import 'package:percobaan_apps/model.dart';
import 'package:percobaan_apps/repository.dart';

class AmbilData extends StatefulWidget {
  const AmbilData({super.key});

  @override
  State<AmbilData> createState() => _AmbilDataState();
}

class _AmbilDataState extends State<AmbilData> {
  List<Akun> listAkun = [];
  Repository repository = Repository();

  getData() async {
    listAkun = await repository.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Form Sederhana'),
            ),
            body: Text('berhasil')
            // FutureBuilder<dynamic>(
            //   future: repository.getData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       final listAkun =
            //           snapshot.data!; // Akses aman setelah pemeriksaan null
            //       return ListView.separated(
            //           itemBuilder: (context, index) {
            //             return Container(
            //               child: Text(listAkun[index].body),
            //             );
            //           },
            //           separatorBuilder: (context, index) {
            //             return Divider();
            //           },
            //           itemCount: listAkun.length);
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Kesalahan: ${snapshot.error}'));
            //     }

            //     // Tampilkan indikator pemuatan saat data sedang diambil
            //     return Center(child: CircularProgressIndicator());
            //   },
            // )));
        )
    );
  }
}
