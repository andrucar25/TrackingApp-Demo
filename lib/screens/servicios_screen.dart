import 'package:flutter/material.dart';


class InformacionScreen extends StatefulWidget {
  InformacionScreen({Key? key}) : super(key: key);

  @override
  _InformacionScreenState createState() => _InformacionScreenState();
}

class _InformacionScreenState extends State<InformacionScreen> {
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
      body:
       Container(
        // margin: EdgeInsets.only(top: 50),
        child: Image.asset('assets/images/scrap.jpg'), height: 500, width: 500,),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
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
