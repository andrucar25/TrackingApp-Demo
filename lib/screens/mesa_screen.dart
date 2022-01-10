import 'package:flutter/material.dart';

import 'package:aeromatersa/constants.dart';

class MesaScreen extends StatefulWidget {
  MesaScreen({Key? key}) : super(key: key);

  @override
  _MesaScreenState createState() => _MesaScreenState();
}
 int _currentStep =0;
  final estiloTitulo = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
  final estiloSubtitluo = TextStyle(fontSize: 16.0, color: kTxtColor, fontWeight: FontWeight.bold);
  final estiloInfo = TextStyle(fontSize: 16.0, color: Colors.black);
  final estiloInfoAzul = TextStyle(fontSize: 16.0, color: kPrimaryColor);
  final estiloAzul = TextStyle(
    color: kPrimaryColor, //Colors.grey[700],
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  final estiloOscuro = TextStyle(
    color: kTxtColor, //Colors.grey[700],
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
class _MesaScreenState extends State<MesaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5.0,
          centerTitle: true,
           title: 

            Text('01010101',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900)),
          
      
          
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                onPressed: () {}
                ),
          ]),
      body: (
        SingleChildScrollView(
          child: Column(
              children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          _especialidad(),
          _crearTitulo(),
          _crearAcciones(),
           SizedBox(
            height: 20.0,
          ),
          Theme(data: ThemeData(
                  accentColor: Colors.purple,
                  primarySwatch: Colors.purple,
                  colorScheme: ColorScheme.light(
                    primary: Colors.purple
                  )
                ), 
                child: Stepper(
                  controlsBuilder: (BuildContext context,
          {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: onStepContinue,
              child: const Text('ACEPTAR'),
            ),
          ],
        );
      },
        steps: [
            Step(
              title: Text('Registrado'),
              content: Text('Su solicitud ha sido registrada con exito '),
            ),
            Step(
              isActive: true,
              title: Text('Derivado'),
              content: Text('Su solicitud ha sido derivada al area correspondiente'),
            ),
            Step(
              title: Text('Aceptado'),
              content: Text('Su solicitud ha sido aceptada, por favor espere la respuesta'),
            ),
          ],
          onStepTapped: (int newIndex){
            setState((){
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: (){
            if(_currentStep != 2){
              setState((){
                _currentStep += 1;
              });
            }
          },
          onStepCancel: (){
            if(_currentStep != 0){
              setState((){
                _currentStep -=1;
              });
            }
          },
        ),)
          
          
        ],
          ),
        )
      ),


       
   );
  }
}


  Widget _especialidad() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Orden de coordinacion', style: estiloAzul),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Solicitud de carga simple', style: estiloTitulo),
                  SizedBox(height: 15.0),
                  Text(
                      'Remitente - Andres De la Barra Vasquez',
                      style: estiloSubtitluo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical:10.0),
            ),
            _info(Icons.remember_me, "DNI: 71199099"),
            _info(Icons.home, "Direccion: Calle Los Rosales 562"),
            _info(Icons.alternate_email, "Email: andrucar25@gmail.com"),
            _info(Icons.person, "Representacion: A nombre propio"),
            _info(Icons.description, "Nro de documento: 01010101"),
            _info(Icons.pending_actions, "Asunto: Solicito el servicio de carga"),
          ],
        )
      ],
    );
  }

  Widget _info(IconData icon, String texto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: kScore, size: 20),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(texto, style: estiloInfo, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ],
    );
  }



