import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:suhamv1_app/Home.dart';
import 'package:suhamv1_app/PageTwo.dart';
import 'package:suhamv1_app/data.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mb;
import 'dart:math' as mathdart;


class Detail extends StatefulWidget{
  @override
  _DetailState createState() => _DetailState();
}
class _DetailState extends State<Detail> {
  var token = 'pk.eyJ1IjoicGlsb3RqaW5peCIsImEiOiJja2p2c2Q0N24wODFqMndtbHlod2NvNnI0In0.TueBgQ2_KUtH4mnlVH8gyQ';
  mb.MapboxMapController mapController;

  Widget buildMap() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 200,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: new mb.CameraPosition(
          target: mb.LatLng(-7.798804, 110.327649),
          zoom: 12,
        ),
        onMapCreated: mapCreated,
      ),
    );
  }

  void mapCreated(mb.MapboxMapController controller) {
    print("Ini controller ${controller}");
    print("Ini controller ${mb.MapboxMapController}");
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-7.798804, 110.327649);
    print('lat lng clicked: ${lokasi.latitude}, ${lokasi.longitude}');
    mapController.addCircle(new mb.CircleOptions(
      circleRadius: 8,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));
  }

  Widget gesergambar(){
    return Container(
      child: Swiper(
        itemCount: gambar.length,
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(gambar[index]),
              fit: BoxFit.cover,
            ),
          );
        },
        viewportFraction: 0.5,
        scale: 0.5,
        layout: SwiperLayout.DEFAULT ,
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kopi Loer"),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 20),
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Penawaran Saham",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    "Gambar usaha UKM",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w300
                    ),
                  )

                ],
              ),
            ),
            Container(
                height: 200,
                child:gesergambar()
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 20),
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Cafe and Resto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 5,
                      color: Colors.blue
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Kopi Loer Jaya",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1
                    ),
                  ),
                  Text(
                    "PT Kopi Loer Jaya",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Stack(
                children: [
                  buildMap(),
                  Positioned(
                      bottom: 5,
                      right: 20,
                      child: GestureDetector(
                        onTap: ()=> Navigator.push(context , MaterialPageRoute(builder: (context) => Pagetwo())),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.map,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            //Mulai Dari
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mulai Dari",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "Rp 1.500.000",
                          style: TextStyle(
                              color: Colors.green
                          ),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Target ",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              Text(
                                "1.000.000.000",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pembagian Deviden",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "3 Bulan",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              width: 250,
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 20,
                animation: true,
                lineHeight: 15,
                animationDuration: 3000,
                percent: 0.25,
                center: Text(
                  "25.0%",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white
                  ),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            SizedBox(height: 12),
            GestureDetector(
              onTap: ()=> Navigator.push(context , MaterialPageRoute(builder: (context) => Pagetwo())),
              child: Container(
                margin: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    "Beli Saham",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3
                    ),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(85, 10, 85, 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
