import 'package:flutter/material.dart';
import 'package:percobaan_apps/addForm.dart';
import 'package:percobaan_apps/profile.dart';
import 'package:percobaan_apps/repository.dart';
import 'package:percobaan_apps/updateForm.dart';

class ViewDataPage extends StatefulWidget {
  const ViewDataPage({Key? key}) : super(key: key);

  @override
  State<ViewDataPage> createState() => _HomePageState();
}

class _HomePageState extends State<ViewDataPage> {
  List<Profile> listProfile = [];
  Repository repository = Repository();

  getData() async {
    listProfile = await repository.getDataProfile();
  }

  deleteData(id) async {
    return await repository.deleteProfile(id);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('View Data'),
        ),
        body: Column(
          children: [
             ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddForm();
                }));
              },
              child: Text('Tambah Data +'),
            ),
            Expanded(
              child: FutureBuilder<dynamic>(
                  future: repository.getDataProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final listProfile =
                          snapshot.data!; // Akses aman setelah pemeriksaan null
                      return ListView.builder(
                        itemCount: listProfile.length,
                        itemBuilder: (context, index) =>
                            getRow(listProfile[index]),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Kesalahan: ${snapshot.error}'));
                    }
                    // return ListView.builder(
                    //   itemCount: listProfile.length,
                    //   itemBuilder: (context, index) => getRow(listProfile[index]),
                    // );

                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ));
  }

  Widget getRow(Profile profile) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        contentPadding: EdgeInsets.all(30),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Provinsi: ${profile.provinsi}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Kabupaten: ${profile.kabupaten}',
            ),
            Container(
              padding: EdgeInsets.only(left: 4, right: 4, top: 4),
              width: MediaQuery.of(context).size.width *
                  0.70, // Lebar selebar layar
              height: MediaQuery.of(context).size.height *
                  0.30, // Tinggi sekitar 20% dari layar
              // color: Colors.blue, // Ganti warna sesuai kebutuhan
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                    // 'http://localhost:8000/images/${profile.image}'
                    'http://10.0.2.2:8000/images/${profile.image}'
                    ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateForm(profile: profile,);
                }));
                    // Implementasi logika edit
                  },
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implementasi logika delete
                    setState(() {
                      deleteData(profile.id);
                    });
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
