// String formatPhoneNumber(String phoneNumber) {
//   // Remove non-numeric characters
//   final digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

//   // Check for valid phone number length (should be 9 digits)
//   if (digits.length != 9) {
//     return 'Invalid phone number (must be 9 digits)'; // Informative error message
//   }

//   // Format the phone number (xxx xxx xxx)
//   final formattedNumber =
//       '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
//   return formattedNumber;
// }

//
String formatPhoneNumber(String phoneNumber) {
  phoneNumber =
      phoneNumber.replaceAll(RegExp(r'[^\d]'), ''); // Remove non-digits

  if (phoneNumber.length == 7) {
    return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3)}';
  } else if (phoneNumber.length == 8) {
    return '${phoneNumber.substring(0, 2)} ${phoneNumber.substring(2, 5)} ${phoneNumber.substring(5)}';
  } else if (phoneNumber.length == 9) {
    return '${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
  } else {
    return phoneNumber; // Return unchanged if invalid length
  }
}
