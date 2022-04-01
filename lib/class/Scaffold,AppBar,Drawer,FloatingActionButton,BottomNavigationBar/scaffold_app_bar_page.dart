import 'package:flutter/material.dart';

class ScaffoldAppBarPage extends StatefulWidget {
  const ScaffoldAppBarPage({Key? key}) : super(key: key);

  @override
  _ScaffoldAppBarPageState createState() => _ScaffoldAppBarPageState();
}

class _ScaffoldAppBarPageState extends State<ScaffoldAppBarPage> {
  //MARK:   AppBar
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      title: const Text('Scaffold,AppBar'),
      leadingWidth: 100,
      leading: Builder(builder: (context) {
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          ],
        );
      }),
      elevation: 1,
      backgroundColor: Colors.orangeAccent,
      // toolbarHeight: 100,
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("data"),
            ));
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("data"),
            ));
          },
        ),
      ],
    );
  }

//MARK:   drawer
  Widget drawer(context) {
    return Drawer(
      child: Container(
        color: Colors.greenAccent,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  int _selectedIndex = 0;
  int _selectedIndex2 = 0;
  bool _isFloatBar = false;
  //MARK: 普通样式 bottomNavigationBar
  Widget bottomBar1() => BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'business',
              icon: Icon(Icons.business),
            ),
            BottomNavigationBarItem(
              label: 'school',
              icon: Icon(Icons.school),
            ),
          ]);

//MARK: 底部凹陷 bottomNavigationBar
  Widget bottomBar2() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: _selectedIndex2 == 0 ? Colors.blue : Colors.grey,
            icon: const Icon(
              Icons.gamepad,
            ),
            onPressed: () => setState(() {
              _selectedIndex2 = 0;
            }),
          ),
          IconButton(
            color: _selectedIndex2 == 1 ? Colors.blue : Colors.grey,
            icon: const Icon(Icons.play_circle),
            onPressed: () => setState(() {
              _selectedIndex2 = 1;
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),

      // drawer: Container(width: 200, color: Colors.greenAccent), //自己实现一个也可以
      drawer: drawer(context),
      body: ListView(
        children: [
          Text(
              "当前是 ${_isFloatBar ? "底部突出Bar" : "正常Bar"}  选中的是 ${_isFloatBar ? _selectedIndex2 : _selectedIndex}"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFloatBar = !_isFloatBar;
                });
              },
              child: const Text("切换 BottomNavigationBar 样式")),
        ],
      ),
      floatingActionButtonLocation: _isFloatBar
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: _isFloatBar ? bottomBar2() : bottomBar1(),
    );
  }
}
