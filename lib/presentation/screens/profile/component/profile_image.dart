import 'package:real_estate/state_inject_package_names.dart';
import '../../../../logic/cubit/profile/profile_state_model.dart';
import '../../../utils/constraints.dart';
import '../../../widget/custom_images.dart';

class ProfileImages extends StatelessWidget {
  const ProfileImages({Key? key, required this.profilePicture})
      : super(key: key);
  final String profilePicture;

  @override
  Widget build(BuildContext context) {
    final updateCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileStateModel>(
      //buildWhen: (previous, current) => previous.image != current.image,
      builder: (context, state) {
        String defaultImage =
            context.read<AppSettingCubit>().settingModel!.setting.defaultAvatar;
        String profileImage =
            profilePicture.isNotEmpty ? profilePicture : defaultImage;

        profileImage = state.image.isNotEmpty ? state.image : profileImage;

        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff333333).withOpacity(.1),
                blurRadius: 60.h,
              ),
            ],
          ),
          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: CustomImage(
                    path: profileImage,
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                    isFile: state.image.isNotEmpty,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: RempIconButton(
                    onTap: ()=> updateCubit.imageChange(), 
                    icon:  Icons.edit, 
                    colorIcon: whiteColor,
                  ),
                )
                
              ],
            ),
          ),
        );
      },
    );
  }
}
