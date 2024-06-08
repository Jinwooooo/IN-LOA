// IMPORTS flutter
import 'package:flutter/material.dart';

// IMPORTS self
import 'armory/screens/armory_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INLOA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  void _searchCharacter() {
    if (_controller.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArmoryScreen(characterName: _controller.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('INLOA LOGO', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 60,
              color: Colors.blue,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu', style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              title: const Text('직업각인 악세사리 정보'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('전설각인서 정보'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.grey[300],
                    child: Center(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '로스트아크 닉네임 검색...',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        onSubmitted: (value) => _searchCharacter(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchCharacter,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange[100],
              child: const Center(
                child: Text(
                  '즐겨찾기 캐릭터',
                  style: TextStyle(fontSize: 24, color: Colors.orange),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: const Center(
                child: Text(
                  '로스트아크\n공지사항 및 이벤트 정보',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
