import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'history.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: Stack(
          children: [
// Back Icon
            Positioned(
              top: 50,
              left: 20,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
// Edit Icon
            // Positioned(
            //   top: 50,
            //   right: 20,
            //   child: Icon(
            //     Icons.edit,
            //     color: Colors.black,
            //     size: 30,
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 20, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/profile7.jpg'),
                    ),
                    SizedBox(height: 20),
                    Text('Ehis Pasiqu',
                        style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 25)),
                    SizedBox(height: 5),
                    Text(
                      'Kigali',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'History',
                      icon: Icons.history,
                      arrowShown: true,
                      widget: HistoryPage(),
                    ),
                    SizedBox(height: 20),
                    // ProfileMenuItem(
                    //   text: 'Help & Support',
                    //   icon: Icons.help,
                    //   arrowShown: true,
                    //   widget: HistoryPage(),
                    // ),
                    // SizedBox(height: 20),
                    // ProfileMenuItem(
                    //   text: 'Privacy Policy',
                    //   icon: Icons.book,
                    //   arrowShown: true,
                    //   widget: HistoryPage(),
                    // ),
                    // SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'LogOut',
                      icon: Icons.logout,
                      arrowShown: false,
                      widget: HistoryPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  ProfileMenuItem({this.text, this.icon, this.arrowShown, this.widget});
  final String text;
  final IconData icon;
  final bool arrowShown;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          height: 50,
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      icon,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$text',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              arrowShown
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
            ],
          )),
    );
  }
}
