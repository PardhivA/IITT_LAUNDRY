// import 'package : flutter / material.dart';
// import 'package : qr_code_scanner / qr_code_scanner.dart';
// import 'package : firebase_auth / firebase_auth.dart';

/*


class QrScan extends StatefulWidget {
  @override
  _QrScanState createState() => _QrScanState();
}

class _QRScanState extends State<Qrscan>
{
  final _firebaseAuth = FirebaseAuth.instance;
  QrViewController controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  bool camState = false;

  @override
  void initState()
  {
    super.initState();
    _controller = QrViewController(
      qrKey: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
    );
  }
  
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  @override
 Widget build(BuildContext context )
 return Scaffold(
      appBar: AppBar(
        title: Text('Scan and Book'),
      ),
      body: Center(
        child: QRCodeScanner(
          controller: _qrController,
          onQRCodeScanned: (code) async {
            // TODO: book laundry using code
          },
          ),
        ),
      ),
    );
      
}









*/