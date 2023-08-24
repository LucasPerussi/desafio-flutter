import 'package:flutter/material.dart';
import 'IMC.dart';
import 'media.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadoras',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadoras')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
             child: Lottie.network(
                'https://lottie.host/3b8edfc5-c75d-4159-b8f5-55c48de78695/3G8mpHVAj2.json',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
            ),
            ),

            SizedBox(height: 50),

            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child:  Text('Desafio Flutter', 
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 50),


            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IMCPage()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  primary: Colors.green,
                ),
                child: Text('Calculadora de IMC'),
              ),
            ),
            
            SizedBox(height: 10),
            
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MediaPage()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  primary: Colors.green,
                ),
                child: Text('Calculadora de Média'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
