import 'package:flutter/material.dart';

import 'package:aeromatersa/widgets/auth_background.dart';
import 'package:aeromatersa/widgets/card_container.dart';
import 'package:aeromatersa/ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children:[

              SizedBox(height: 250),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox(height: 10),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                     _LoginForm(),
                    
                  ],
                ),
              ),

              SizedBox(height: 50),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 50),

            ]
          ),
        )
        
      ),
   );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:InputDecorations.authInputDecoration(
                hintText: 'ejemplo@gmail.com',
                labelText: 'Correo electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              validator: (value) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                ? null
                : 'El valor ingresado no es un correo';

              },
            ),
            
            SizedBox(height: 30),
                TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration:InputDecorations.authInputDecoration(
                 hintText: '******',
                labelText: 'Contrasenia',
                prefixIcon: Icons.lock_outline
              ),
              validator: (value) {

               return (value != null && value.length >= 6) 
               ? null
              : 'La contrasenia debe de ser de 6 caracteres';

              },
            ),

            SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation:0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Ingresar',
                  style:TextStyle(color: Colors.white),
                ),
              ),
             
              onPressed: (){
                 Navigator.pushReplacementNamed(context, 'home');
              },
              
              )
          ],
        ),

      ),
    );
  }
}