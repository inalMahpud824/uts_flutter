import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percobaan_apps/profile.dart';
import 'package:percobaan_apps/repository.dart';
import 'package:percobaan_apps/viewData.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateForm extends StatefulWidget {
  final Profile? profile;
  const UpdateForm({super.key, this.profile});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  Repository repository = Repository();
  Position? _currentPosition;
  final _nameController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kabupatenController = TextEditingController();
  File? image;
  dynamic oldImage;

  Future GetImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);

    setState(() {});
  }

  sendData() async {
    bool register = await repository.updateDataProfile(
        widget.profile!.id,
        File(image!.path),
        _currentPosition!.latitude,
        _currentPosition!.longitude,
        _nameController.text,
        _provinsiController.text,
        _kabupatenController.text);
    register
        ? Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewDataPage();
          }))
        : print('error');
  }

  @override
  void initState() {
    super.initState();
    if (widget.profile != null) {
      _nameController.text = widget.profile!.name;
      _provinsiController.text = widget.profile!.provinsi;
      _kabupatenController.text = widget.profile!.kabupaten;
      oldImage = widget.profile!.image.toString();
      // Pertimbangkan untuk memuat sebelumnya gambar jika URL tersedia
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Edit Profile'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 16),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _provinsiController,
                  decoration: InputDecoration(
                      hintText: 'Masukan Provinsi',
                      labelText: 'Provinsi',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _kabupatenController,
                  decoration: InputDecoration(
                      hintText: 'Masukan Kabupaten/kota',
                      labelText: 'Kabkot',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      // location section

                      ElevatedButton(
                        onPressed: () async {
                          final status = await Permission.location.request();
                          if (status.isGranted) {
                            // Izin lokasi diberikan, lanjutkan dengan pengambilan koordinat.
                            _getCurrentLocation();
                          } else {
                            print('location denied');
                            // Izin lokasi ditolak, tangani dengan baik.
                          }
                        },
                        child: Text("Get location"),
                      ),
                      SizedBox(height: 15),
                      if (_currentPosition != null)
                        Text(
                            "Latitude: ${_currentPosition?.latitude}, Longtitude: ${_currentPosition?.longitude}"),
                      SizedBox(height: 16),

                      const SizedBox(height: 16),

                      // Add Image Section

                      image == null
                          ? Container(
                              height: MediaQuery.of(context).size.width * 0.50,
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Image(fit: BoxFit.fill, image: NetworkImage(
                                  // 'http://localhost:8000/images/${profile.image}'
                                  'http://10.0.2.2:8000/images/${oldImage}')))
                          : Container(
                              height: MediaQuery.of(context).size.width * 0.50,
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.fill,
                              )),
                      ElevatedButton(
                        child: Text('Ambil Gambar'),
                        onPressed: () async {
                          await GetImage();
                        },
                      ),

                      SizedBox(height: 16),
                      ElevatedButton(
                          child: Text('Daftar'), onPressed: sendData),
                      SizedBox(height: 16),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        // print(_currentPosition!.latitude);
        // print(_currentPosition!.longitude);
      });
    }).catchError((e) {
      print(e);
    });
  }
}
