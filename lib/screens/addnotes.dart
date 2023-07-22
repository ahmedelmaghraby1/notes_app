import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

//functions not defined in addnotes class

class addnotes extends StatefulWidget {
  const addnotes({super.key});

  @override
  State<addnotes> createState() => _addnotesState();
}

class _addnotesState extends State<addnotes> {
//var declaration
  File? image;
//functions:-

//function to get images from gallery

  Future pickimagefromgallery() async {
    ImagePicker imagepicker = ImagePicker();
    var pickedimage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null)
      return File(pickedimage.path);
    else {
      return showmodalsheet(context);
    }
  }

// function to capture image from camera
  Future captureimage() async {
    ImagePicker imagepicker = ImagePicker();
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pickedimage != null)
      return File(pickedimage.path);
    else {
      return showmodalsheet(context);
    }
  }

//function to view selected image
  Future viewiselectediamgefromgallery() async {
    var img = await pickimagefromgallery();
    setState(() {
      image = img;
    });
  }

//function to save image
  Future saveimage() async {
    Directory image_directory = await getApplicationDocumentsDirectory();
    var imagepath = '${image_directory.path}/myimage.jpg';
    await image!.copy(imagepath);
  }

//function to build screen viewing image
  Future viewimagefromgallery() async {
    await viewiselectediamgefromgallery();
  }

//function to view captured image

  Future viewimagefromcamera() async {
    await captureimage();
    await viewiselectediamgefromgallery();

    // if (response == null)
    //   return null;
    // else {
    //   viewimagefromgallery();
    // }
  }

//function to showmodalsheet
  showmodalsheet(BuildContext context) {
    return showModalBottomSheet(
        context: (context),
        builder: ((context) {
          return Container(
            height: 150,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "choose photo from ",
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 50,
                            icon: Icon(Icons.image),
                            color: Colors.red,
                            onPressed: viewimagefromgallery,
                          ),
                          Center(
                            child: Text(
                              "Gallery",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 50,
                            icon: Icon(Icons.camera_alt),
                            color: Colors.blue,
                            onPressed: viewimagefromcamera,
                          ),
                          Center(
                            child: Text(
                              "Camera",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                )
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add note"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  labelText: "Note header",
                  hintText: "Note"),
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note),
                  labelText: "Note content",
                  hintText: "Content"),
            ),
            TextButton.icon(
                style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(TextStyle(color: Colors.white)),
                ),
                onPressed: () {
                  setState(() {
                    showmodalsheet(context);
                  });
                },
                icon: Icon(Icons.camera),
                label: Text("add image")),
            TextButton(
              onPressed: () {},
              child: Text(
                "Save note",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  backgroundColor: Color.fromARGB(223, 161, 148, 6),
                ),
              ),
            ),
            image != null
                ? Container(
                    child: Image.file(
                      image!,
                      height: 199,
                      width: 150,
                    ),
                  )
                : Container(
                    child: Center(
                    child: Text(
                      "No Photos selected",
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
          ],
        )),
      ),
    );
  }
}
