import 'package:flutter/material.dart';
import 'package:save/models/goal.dart';
import 'package:provider/provider.dart';
import 'package:save/models/user.dart';
import 'package:save/pages/profilepage.dart';
import 'package:save/screens/goals/add_goal.dart';
import 'package:save/screens/home/components/goals.dart';
import 'package:save/screens/home/profile.dart';
import 'package:save/services/auth.dart';
import 'package:save/services/database.dart';
import 'components/goal_list.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Getting the user Instance
    final user = Provider.of<User>(context);
    print(user.uid);

    // final users = Provider.of<List<UserData>>(context) ?? [];

    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Column(
                children: [
                  Text('BottomSheet'),
                  TextButton.icon(
                      icon: Icon(Icons.person),
                      label: Text("logout"),
                      onPressed: () async {
                        await _auth.signOut();
                      }),
                ],
              ),
            );
          });
    }

    return StreamProvider<List<Goal>>.value(
      value: DatabaseService().goals,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.only(
            left: 0.0,
            top: 35.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              right: 20.0,
              bottom: 0.0,
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Ehis",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                      onPressed: () => _showSettingsPanel(),
                      icon: Icon(Icons.person),
                      label: Text('Account'))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: GoalButton(),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Total Savings',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rwf ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                // child: DecoratedBox(decoration:),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                // Add Padding for row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Goals",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    "All",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 10,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.grey,
              ),
              SizedBox(height: 250, child: GoalList()),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          // TODO: Complete sis
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300].withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 7),
            )
          ]
          // gradient: LinearGradient(colors: [Colors.orange, Colors.amber[600]]),
          ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    });
                  },
                ),
                IconBottomBar(
                  text: "Add",
                  icon: Icons.add,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddGoal()));
                    });
                  },
                ),
                IconBottomBar(
                  text: "History",
                  icon: Icons.history,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                IconBottomBar(
                  text: "Settings",
                  icon: Icons.settings,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  const IconBottomBar({this.text, this.icon, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? Colors.amber[600] : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            height: .1,
            color: selected ? Colors.amber[600] : Colors.grey,
          ),
        )
      ],
    );
  }
}
