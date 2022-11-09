import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:patrol_app/page/form_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  final MobileScannerController cameraController = MobileScannerController();
  HomePage({super.key});

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
                child: MobileScanner(
                  allowDuplicates: false,
                  controller: cameraController,
                  onDetect: (barcode, args) {
                    final String code = barcode.rawValue!;
                    Navigator.pushNamed(context, FormPage.routeName,
                        arguments: code);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.torchState,
                        builder: (context, state, child) {
                          switch (state) {
                            case TorchState.off:
                              return const Icon(Icons.flash_off,
                                  color: Colors.black);
                            case TorchState.on:
                              return const Icon(Icons.flash_on,
                                  color: Colors.blue);
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.toggleTorch(),
                    ),
                    IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: cameraController.cameraFacingState,
                        builder: (context, state, child) {
                          switch (state) {
                            case CameraFacing.front:
                              return const Icon(
                                Icons.camera_front,
                                color: Colors.black,
                              );
                            case CameraFacing.back:
                              return const Icon(
                                Icons.camera_rear,
                                color: Colors.black,
                              );
                          }
                        },
                      ),
                      iconSize: 32.0,
                      onPressed: () => cameraController.switchCamera(),
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
