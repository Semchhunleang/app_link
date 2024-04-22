import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  final permissionStatus = await Permission.storage.request();
  if (permissionStatus == PermissionStatus.granted) {
    return true;
  } else {
    // Handle permission denied case (e.g., show a snackbar)
    return false;
  }
}
