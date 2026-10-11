import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação com Abas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    InicioPage(),
    NoticiasPage(),
    PerfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Aplicativo"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Notícias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: [
          Colors.blue,
          Colors.green,
          Colors.orange,
        ][_selectedIndex],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Tela de início
class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Bem-vindo ao aplicativo!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Image.network(
            'https://picsum.photos/300/200',
            height: 200,
            width: 300,
          ),
          const SizedBox(height: 20),
          const Text(
            "Aqui você encontra notícias e informações.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Tela de notícias
class NoticiasPage extends StatelessWidget {
  const NoticiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade50,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.newspaper, color: Colors.green),
            title: Text("Novidades sobre tecnologia"),
          ),
          ListTile(
            leading: Icon(Icons.school, color: Colors.green),
            title: Text("Estudantes participam de feira científica"),
          ),
          ListTile(
            leading: Icon(Icons.eco, color: Colors.green),
            title: Text("Campanha incentiva a reciclagem"),
          ),
          ListTile(
            leading: Icon(Icons.sports_soccer, color: Colors.green),
            title: Text("Time conquista uma grande vitória"),
          ),
          ListTile(
            leading: Icon(Icons.phone_android, color: Colors.green),
            title: Text("Novos aplicativos são lançados"),
          ),
        ],
      ),
    );
  }
}

// Tela de perfil
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/200',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Gabriella",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 10),
          const Text("Meu perfil"),
        ],
      ),
    );
  }
}
