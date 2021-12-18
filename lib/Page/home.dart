// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_label

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController title = TextEditingController();
  String name = "Decha Laowraddecha";
  int sideBarIconColor = 0xFF7b8795;
  bool showWidget = false;
  bool searchOrNot = false;
  TextEditingController SearchBar = TextEditingController();
  IconData iconSidebar = Icons.menu;
  @override
  void initState() {
    super.initState();
    title.text = "Telegram";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1f3040),
              ),
              accountName: Text(name),
              accountEmail: Text(
                "+666-2211-5011",
                style: TextStyle(color: Color(0xFF69808e)),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              otherAccountsPictures: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ))
              ],
              onDetailsPressed: () {
                setState(() {
                  showWidget = !showWidget;
                });
              },
            ),
            showWidget
                ? Column(children: [
                    SidebarList(Icons.account_circle, name),
                    SidebarList(Icons.add, "Add Account"),
                    Divider()
                  ])
                : Container(),
            SidebarList(Icons.people_outline, "New Group"),
            SidebarList(Icons.person_outline_outlined, "Contacts"),
            SidebarList(Icons.phone_outlined, "Calls"),
            SidebarList(Icons.accessibility_new_sharp, "People Nearby"),
            SidebarList(Icons.bookmark_border, "Saved Messages"),
            SidebarList(Icons.settings_outlined, "Settings"),
            Divider(),
            SidebarList(Icons.person_add_outlined, "Invite Friends"),
            SidebarList(Icons.help_outline, "Telegram Features"),
          ],
        ),
        backgroundColor: Color(0xFF1a2330),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(iconSidebar),
              onPressed: () {
                if (searchOrNot) {
                  setState(() {
                    searchOrNot = !searchOrNot;
                    title.text = "Telegram";
                    iconSidebar = Icons.menu;
                  });
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
            );
          },
        ),
        elevation: 1,
        title: searchOrNot
            ? TextField(
                style: TextStyle(
                    color: Color(0xFF798593),
                    fontSize: 19,
                    fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 19.0, color: Color(0xFF798593)),
                ),
              )
            : Row(
                children: [
                  Text(
                    title.text,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
        actions: [
          searchOrNot
              ? Container()
              : IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      searchOrNot = !searchOrNot;
                      if (searchOrNot) {
                        title.text = "Search";
                        iconSidebar = Icons.arrow_back;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
        ],
        backgroundColor: Color(0xFF1e2e3d),
      ),
      body: ListView(
        children: [
          Chat("Demo 1", "Hello this is demo 1", "2:00 PM"),
          Chat("Demo 2", "Y e a h h h ", "5:00 AM")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF48a3e2),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget SidebarList(IconData icon, String name) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(sideBarIconColor),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {},
    );
  }

  Widget Chat(String name, String content, String time) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width - 200),
                    Text(
                      time,
                      style: TextStyle(
                        color: Color(0xFF798593),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ]),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Row(children: [
                        Text(
                          name + ": ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          content,
                          style: TextStyle(color: Color(0xFF798593)),
                        ),
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
