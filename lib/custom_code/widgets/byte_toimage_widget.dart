// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
class ByteToimageWidget extends StatefulWidget {
  const ByteToimageWidget({
    Key? key,
    this.width,
    this.height,
    this.assets,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<FFUploadedFile>? assets;

  @override
  _ByteToimageWidgetState createState() => _ByteToimageWidgetState();
}

class _ByteToimageWidgetState extends State<ByteToimageWidget> {
  int? selectedImageIndex;
  int mainPhotoIndex = 0; // New variable to track the main photo index

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: widget.assets?.length ?? 0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (widget.assets != null && index < widget.assets!.length) {
            return Stack(
              children: [
                Container(
                  width: 160.0,
                  height: 160.0, // Set the maximum width and height
                  // color: Colors.green, // Set the container color
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.memory(
                          widget.assets![index].bytes!,
                          width: widget.assets![index].bytes!.length < 150
                              ? null
                              : 150.0,
                          height: widget.assets![index].bytes!.length < 150
                              ? null
                              : 150.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Checkbox(
                        value: selectedImageIndex == index,
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              selectedImageIndex = index;
                              mainPhotoIndex = index;

                              // Update FFAppState mainPhotoState
                              FFAppState().update(() {
                                FFAppState().mainPhotoState = mainPhotoIndex;
                              });
                            } else {
                              selectedImageIndex = null;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 40,
                  child: Visibility(
                    visible: selectedImageIndex == index,
                    child: Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Main Photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _deleteImage(index);
                    },
                  ),
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _deleteImage(int index) {
    setState(() {
      if (mainPhotoIndex == index) {
        mainPhotoIndex = 0;
      } else if (mainPhotoIndex > index) {
        // Decrement mainPhotoIndex if the deleted image is before it
        mainPhotoIndex = mainPhotoIndex - 1;
        selectedImageIndex = selectedImageIndex! - 1;
        FFAppState().update(() {
          FFAppState().mainPhotoState = mainPhotoIndex;
        });
      }
      widget.assets!.removeAt(index);
      if (selectedImageIndex == index) {
        mainPhotoIndex = 0;
        selectedImageIndex = 0;
        FFAppState().update(() {
          FFAppState().mainPhotoState = mainPhotoIndex;
        });
      }
    });
  }
}
