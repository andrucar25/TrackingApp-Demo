import 'package:aeromatersa/screens/historial_screen.dart';
import 'package:aeromatersa/screens/mesa_screen.dart';
import 'package:aeromatersa/screens/pendientes_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; 
  List<Widget> _paginas = [
    PendientesScreen(),
    HistorialScreen(),
    MesaScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         
          elevation: 5.0,
          title:  
          Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
            height: 50,
          ),
          centerTitle: true,
          actions: [
            
          ]),
      body: _paginas[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Encomiendas',
            icon:Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Historial',
            icon:Icon(Icons.home)),
           BottomNavigationBarItem(
            label: 'Mesa de partes',
            icon:Icon(Icons.home)),
          
        ],
      ),

       
   );
  }
}
