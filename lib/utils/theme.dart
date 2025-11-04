import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart'; // biar warna & value global nyatu

final ThemeData aleraTheme = ThemeData(
  useMaterial3: true,

  // 🌈 Skema warna utama Alera
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: textColor,
    onBackground: textColor,
    onSurface: textColor,
  ),

  // 🖋️ Font utama: Poppins (modern & clean)
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: textColor,
    displayColor: textColor,
  ),

  // 🧭 AppBar: simpel, elegan
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: textColor),
    titleTextStyle: GoogleFonts.poppins(
      color: textColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
  ),

  // 📦 Card: lembut & bersih
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 3,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
    ),
    shadowColor: Colors.grey.withOpacity(0.1),
  ),

  // 🔘 Elevated Button: modern & rounded
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    ),
  ),

  // 🩶 TextField (Input)
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade50,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
      borderSide: const BorderSide(color: primaryColor, width: 1.5),
    ),
    hintStyle: GoogleFonts.poppins(
      color: Colors.grey.shade400,
      fontSize: 14,
    ),
  ),

  // 🧾 Divider
  dividerTheme: DividerThemeData(
    color: Colors.grey.shade200,
    thickness: 1,
    space: 32,
  ),

  // 🧍 Bottom Navigation Bar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey.shade400,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: false,
  ),

  scaffoldBackgroundColor: Colors.white,
);
