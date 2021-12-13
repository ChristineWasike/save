import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save/screens/home/home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffc801),
        appBar: AppBar(
          backgroundColor: Color(0xffffc801),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xffececec),
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 20, top: 10),
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
                        style: GoogleFonts.poppins(
                            color: Color(0xff385a65),
                            fontWeight: FontWeight.w600,
                            fontSize: 25)),
                    SizedBox(height: 5),
                    Text(
                      'Kigali',
                      style: GoogleFonts.poppins(
                        color: Color(0xff385a65),
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.pink,
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(30),
                    //     ),
                    //   ),
                    //   height: 50,
                    //   width: 500,
                    //   child: Center(
                    //     child: Text(
                    //       'Upgarde to Premium',
                    //       style: GoogleFonts.poppins(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'History',
                      icon: Icons.history,
                      arrowShown: true,
                    ),
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'Help & Support',
                      icon: Icons.help,
                      arrowShown: true,
                    ),
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'Privacy Policy',
                      icon: Icons.book,
                      arrowShown: true,
                    ),
                    SizedBox(height: 20),
                    ProfileMenuItem(
                      text: 'LogOut',
                      icon: Icons.logout,
                      arrowShown: true,
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
  ProfileMenuItem({this.text, this.icon, this.arrowShown});
  final String text;
  final IconData icon;
  final bool arrowShown;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xffececec),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        height: 50,
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    icon,
                    size: 20,
                    color: Color(0xff1b2e35),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '$text',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1b2e35),
                  ),
                ),
              ],
            ),
            arrowShown
                ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Color(0xff1b2e35),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
