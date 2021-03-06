import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suhamv1_app/Home.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool tampilkan = false;
  File imgcamera;

  final imagePicker = ImagePicker();

  Future viewcamera() async{
    imgcamera = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
    });
  }

  viewgalery() async{
    imgcamera = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(0),
        title:Text (
            "Profile",
          style:TextStyle(
            color: Colors.blue
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: <Widget>[
              SizedBox(height: 5,),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imgcamera == null ? AssetImage("assets/me.jpg") : FileImage(File(imgcamera.path))
                        )
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: ((builder) => popup()),);
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              buildTextField("Nama Lengkap", "Muhammad Agung Santoso", false),
              buildTextField("E-Mail", "agungsantoso557@gmail.com", false),
              buildTextField("Password", "******", true),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
                    child: Text(
                      "Cencel",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? tampilkan : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  tampilkan = !tampilkan;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100,
              color: Colors.black,
            )),
      ),
    );
  }


  Widget popup(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Pilih Perangkat Anda",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: viewcamera,
                  icon: Icon(
                    Icons.camera
                  ),
                  label: Text(
                    "Kamera"
                  ),
              ),
              FlatButton.icon(
                onPressed: viewgalery,
                icon: Icon(
                    Icons.image
                ),
                label: Text(
                    "Galery"
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}