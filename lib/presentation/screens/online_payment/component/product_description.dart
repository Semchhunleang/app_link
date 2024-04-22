import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/state_inject_package_names.dart';

import '../../../../data/model/online_payment/description_product_mode.dart';
import '../../../utils/constraints.dart';

class ProductDescription extends StatelessWidget {
  final DescriptionProductModel descriptionModel;

  const ProductDescription({super.key, required this.descriptionModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.done_outlined, color: Colors.green),
          const SizedBox(width: 5.0),
          Flexible(
            child: Text(
              descriptionModel.name,
              style: GoogleFonts.dmSans(
                  fontSize: 16.0,
                  color: grayColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
