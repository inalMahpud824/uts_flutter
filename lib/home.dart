import 'package:flutter/material.dart';
import 'package:percobaan_apps/viewData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            children: [Text('Selamat Datang Wibu')],
          ),
          Container(
            padding: EdgeInsets.only(left: 4, right: 4, top: 4),
            width: MediaQuery.of(context).size.width, // Lebar selebar layar
            height: MediaQuery.of(context).size.height *
                0.30, // Tinggi sekitar 20% dari layar
            // color: Colors.blue, // Ganti warna sesuai kebutuhan
            child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1590815438/attack-on-titan-season-4-trailer-gives-first-look-at-humanity-s-final-battle_cjzfdm.jpg')),
          ),
          SizedBox(height: 16),
          Container(
            width: 80, 
            height: 80, 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, 
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewDataPage();
                }));
              },
              child: Text(
                'CRUD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
