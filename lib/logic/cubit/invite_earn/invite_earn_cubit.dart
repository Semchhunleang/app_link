import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:real_estate/presentation/utils/image_covert_uint8list.dart';
import 'package:real_estate/presentation/utils/request_storage_permission.dart';
import 'package:real_estate/presentation/utils/save_image.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'invite_earn_state.dart';

class InviteEarnCubit extends Cubit<InviteEarnState> {
  InviteEarnCubit() : super(InviteEarnInitial());

  Future <void> shareWithSocialMedia(String link)async{
    // emit(InviteEarnLoading());
      await Share.share('Check out this amazing app! $link', subject: 'Invite Friends');
    // emit(InviteEarnLoaded());
  }

  Future <void> shareWithSMS(String link)async{
    // emit(InviteEarnLoading());
     final url ='sms:?body=Check out this amazing app! $link';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    // emit(InviteEarnLoaded());
  }

  Future<void> downloadQR(String link, BuildContext context)async{
    emit(InviteEarnLoading());
    String imageUrl = link;
    Uint8List? imageUint8List = await getImageUint8List(imageUrl);
    if(imageUint8List !=null){
      if (await requestStoragePermission()) {
      debugPrint('---------- before save image');
      final result = await ImageGallerySaver.saveImage(imageUint8List);
    // debugPrint('---------- before save image 1');
      if(result['isSuccess']) {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Qr code was downloaded in your gallery")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Something went wrong!")));
      }
      }else{
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("You denied to save image to gallery")));
      }
    }
    emit(InviteEarnLoaded());
  }
}
