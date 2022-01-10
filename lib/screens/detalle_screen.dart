import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:aeromatersa/constants.dart';

class DetalleScreen extends StatefulWidget {
  DetalleScreen({Key? key}) : super(key: key);

  @override
  _DetalleScreenState createState() => _DetalleScreenState();
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
class _DetalleScreenState extends State<DetalleScreen> {

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            SizedBox(height:20),
            Text('DETALLE',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.purple,
                    letterSpacing: 8.0,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            Text(
              'ENCOMIENDA',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.purple,
                  letterSpacing: 8.0,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          _crearImagen(),
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
              content: Text('Su encomienda ha sido registrada con exito'),
            ),
            Step(
              isActive: true,
              title: Text('En espera'),
              content: Text('Su encomienda se encuentra por ser revisada en Aduana'),
            ),
            Step(
              title: Text('Aprobado'),
              content: Text('Su encomienda tiene autorizacion para ser entregada'),
            ),
            Step(
              title: Text('Entregado'),
              content: Text('Su encomienda fue entregada a su destino'),
            ),
          ],
          onStepTapped: (int newIndex){
            setState((){
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: (){
            if(_currentStep != 3){
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
    ));
  }
}

Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://www.eluniverso.com/resizer/jU_ZfrnNMAOBB9aRqLs7HKW0PRM=/1117x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/WANKWEDZPRHNLHGT3HN7OMVFTE.jpg'),
        fit: BoxFit.cover,
      ),
    );
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
                  Text('Almacenaje', style: estiloAzul),
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
                  Text('Mercaderia de ropa verano', style: estiloTitulo),
                  SizedBox(height: 15.0),
                  Text(
                      '01 cuota de pago - 30 dias de plazo',
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
            _info(Icons.calendar_today, "Fecha de emision: 24/10/2021"),
            _info(Icons.calendar_today, "Fecha de vencimiento:24/11/2021"),
            _info(Icons.price_change, "Moneda: Dolar americano"),
            _info(Icons.paid, "Valor:\$177.88"),
            _info(Icons.paid, "Importe total:\$209.78"),
            _info(Icons.production_quantity_limits, "Cantidad:01"),
            // _infoAzul(Icons.alarm, "Duración: +55 minutos", " (Ver temario)"),
            // _infoAzul(Icons.grade, "Calificación: 4.8", " (Ver opiniones)"),
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
                child: Text(texto, style: estiloInfo),
              ),
            ],
          ),
        ),
      ],
    );
  }




