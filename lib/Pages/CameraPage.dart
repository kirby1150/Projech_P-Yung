import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? camera;
  Widget? cameraPreview;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    //first = back camera 
    //last = first camera 
    camera = cameras!.first;
    _controller = CameraController(camera!, ResolutionPreset.veryHigh);
    await _controller!.initialize();
    cameraPreview = Center(child: CameraPreview(_controller!));
    setState(() {
      cameraPreview = cameraPreview;
    });
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    //wen out of screen is close this screen
    _controller?.dispose();
    print("dispose Here");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Camera Page'), actions: [
          IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () async {
                final image = await _controller!.takePicture();
                print(image.path);
                Navigator.pushNamed(context, 'homestack/picture',
                    arguments: {'path': image.path});
              })
        ]),
        body: Center(
          child: cameraPreview,
        ));
  }
}
