import 'package:flutter/material.dart';
import 'package:patrol_app/page/form_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey qrKey = GlobalKey();
  QRViewController? cameraController;
  bool flashStatus = false;
  bool cameraStatus = false;

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 500,
          height: 500,
          child: Column(
            children: [
              const Text(
                'Scan Qr',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (QRViewController controller) {
                    cameraController = controller;
                    controller.scannedDataStream.listen((value) {
                      cameraController!.pauseCamera();
                      Navigator.pushNamed(context, FormPage.routeName,
                          arguments: value.code);
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.refresh),
                        iconSize: 32.0,
                        onPressed: () {
                          cameraController!.resumeCamera();
                        }),
                    IconButton(
                        icon: flashStatus
                            ? const Icon(
                                Icons.flash_on,
                                color: Colors.amber,
                              )
                            : const Icon(Icons.flash_off),
                        iconSize: 32.0,
                        onPressed: () {
                          cameraController!.toggleFlash();
                        }),
                    IconButton(
                      icon: cameraStatus
                          ? const Icon(
                              Icons.camera_front,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.camera_rear,
                              color: Colors.black,
                            ),
                      iconSize: 32.0,
                      onPressed: () {
                        cameraController!.flipCamera();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
