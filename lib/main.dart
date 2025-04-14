import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      Sizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            title: "Application",
            theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(),
              scaffoldBackgroundColor: Color(0xffFAFAFA),
            ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        },
      ),
    ),
  );
}
