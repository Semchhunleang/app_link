import 'package:equatable/equatable.dart';

import '../../../utils/k_images.dart';

class OnBoardingModel extends Equatable {
  final String image;
  final String title;
  final String description;
  final String indicator;

  const OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.indicator,
  });

  @override
  List<Object?> get props => [image, title, description];
}

final List<OnBoardingModel> onBoardingData = [
  const OnBoardingModel(
      image: KImages.onBoarding01,
      title: 'Find Best House',
      indicator: KImages.indicator01,
      description:
          'Homec is a online on demand service. Its has as into the 50k+can buy every into a services in easy way.'),
  const OnBoardingModel(
      image: KImages.onBoarding03,
      title: 'Check features of house',
      indicator: KImages.indicator02,
      description:
          'Homec is a online on demand service. Its has as into the 50k+can buy every into a services in easy way.'),
  const OnBoardingModel(
      image: KImages.onBoarding02,
      title: 'Sell your House',
      indicator: KImages.indicator03,
      description:
          'Homec is a online on demand service. Its has as into the 50k+can buy every into a services in easy way.'),
  const OnBoardingModel(
      image: KImages.onBoarding04,
      title: 'Location Access',
      indicator: KImages.indicator04,
      description:
          'Homec is a online on demand service. Its has as into the 50k+can buy every into a services in easy way.'),
];
