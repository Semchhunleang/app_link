import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/presentation/utils/constraints.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  const DatePicker({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 130,
      child: DateTimeField(
        onChanged: (value) => onChanged(value),
        style: const TextStyle(fontSize: 13, height: 2.2),
        controller: controller,
        decoration: const InputDecoration(
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8),
          labelText: "DD/MM/YYYY",
          labelStyle: TextStyle(fontSize: detailFontSize),
          // counterStyle: TextStyle(fontSize: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          // suffixIcon:  SizedBox(
          //   width: 10,
          //   child: Icon(Icons.date_range, color: Colors.grey, size: 16)),
        ),
        
        format: dateFmt, 
        onShowPicker: (context, initialDate) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: initialDate ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
      ),
    );
  }
}