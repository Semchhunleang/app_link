import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

onShowCountryCodePicker({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
}) {
  showCountryPicker(
    context: context,

    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
    exclude: <String>['KN', 'MF'],
    favorite: <String>['KH'],
    //Optional. Shows phone code before the country name.
    showPhoneCode: true,
    onSelect: onSelect,
    // Optional. Sets the theme for the country list picker.
    countryListTheme: CountryListThemeData(
      // Optional. Sets the border radius for the bottomsheet.
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      // Optional. Styles the search field.
      inputDecoration: InputDecoration(
        labelText: 'Search',
        hintText: 'Start typing to search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF8C98A8).withOpacity(0.2),
          ),
        ),
      ),
      // Optional. Styles the text in the search field
      searchTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 18,
      ),
    ),
  );
}
