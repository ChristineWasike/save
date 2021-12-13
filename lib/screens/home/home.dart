import 'package:flutter/material.dart';
import 'package:save/models/goal.dart';
import 'package:save/screens/home/goal_list.dart';
import 'package:provider/provider.dart';
import 'package:save/screens/goals/add_goal.dart';
// import 'package:save/screens/home/components/goals.dart';
// import 'package:save/screens/home/home_body.dart';
import 'package:save/services/auth.dart';
import 'package:save/services/database.dart';
import 'components/goal_list.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Create an array that calls the different screens
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('BottomSheet'),
            );
          });
    }

    return StreamProvider<List<Goal>>.value(
      value: DatabaseService().goals,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text('Save'),
          backgroundColor: Colors.amber[500],
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(Icons.person),
                label: Text("logout"),
                onPressed: () async {
                  await _auth.signOut();
                }),
            TextButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('settings'))
          ],
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(25.0),
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
                height: 30,
              ),
              Container(
                child: GoalButton(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Goals",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    "All",
                    style: TextStyle(
                      fontSize: 18,
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
              SizedBox(height: 100, child: GoalList()),
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
      decoration: BoxDecoration(
        color: Colors.yellowAccent[700],
        // gradient: LinearGradient(colors: [Colors.orange, Colors.yellow]),
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
                      Navigator.pop(context,
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
            color: selected ? Colors.white : Colors.grey,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            height: .1,
            color: selected ? Colors.white : Colors.grey,
          ),
        )
      ],
    );
  }
}
