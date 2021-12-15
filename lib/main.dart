import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save/models/user.dart';
import 'package:save/pages/google_sheets_api.dart';
import 'package:save/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:save/services/auth.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetsApi().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of the application.
          // scaffoldBackgroundColor: kBackgroundColor,`
          // primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
