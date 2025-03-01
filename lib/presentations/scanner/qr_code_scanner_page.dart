import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String qrText = 'Scan a QR Code';

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller for scanning effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    double screenHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double availableHeight = screenHeight - statusBarHeight;
    double overlayHeight = (availableHeight - 200) / 2; // Ensures equal spacing

    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),

          // Overlay with a transparent square at the center
          Positioned.fill(
            child: Column(
              children: [
                Container(
                    height: overlayHeight,
                    color: Colors.black.withOpacity(0.6)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: width, color: Colors.black.withOpacity(0.6)),
                    ),
                    ScannerSection(width: width, animation: _animation),
                    Expanded(
                      child: Container(
                          height: width, color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),

          // Text showing scanned QR code
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.w),
                color: Colors.black54,
                child: Text(
                  qrText,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      Utils.handleError(context, scanData.code ?? 'No Data');
      setState(() {
        qrText = scanData.code ?? 'No Data';
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ScannerSection extends StatelessWidget {
  const ScannerSection({
    super.key,
    required this.width,
    required Animation<double> animation,
  }) : _animation = animation;

  final double width;
  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.transparent,
          ),
        ),

        // Animated scanning line
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Align(
                alignment: Alignment(
                    0, _animation.value * 2 - 1), // Moves from top to bottom
                child: Container(
                  width: width,
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.green.withOpacity(0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
