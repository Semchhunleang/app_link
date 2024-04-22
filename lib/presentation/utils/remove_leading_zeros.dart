String removeLeadingZeros(String text) {
  // Regular expression to match leading zeros
  final zeroPattern = RegExp(r'^0+');
  return text.replaceFirst(zeroPattern, ''); // Use replaceFirst instead
}

// String removeZeroPrefix(String phoneNumber) {
//   if (phoneNumber.startsWith("0")) {
//     return phoneNumber.substring(1); // Remove the first character (0)
//   } else {
//     return phoneNumber; // No change if there's no zero prefix
//   }
// }
