import 'package:flutter/material.dart';
import 'Styles.dart';

class IMCPage extends StatefulWidget {
  @override
  _IMCPageState createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  double weight = 0;
  double heightPerson = 0;
  double imc = 0;

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Calculadora de IMC')),
    body: Padding(
      padding: EdgeInsets.all(25.0), 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            description(),
            buildWeightInput(),
            buildHeightInput(),
            buildCalculateButton(),
            buildIMCResult(),
          ],
        ),
      ),
    ),
  );
}

Widget description() {
  return Container(
    color: Colors.transparent,
    alignment: Alignment.topCenter,
    margin: EdgeInsets.all(20.0),
    child: Text(
      'Informe abaixo seu peso e altura em centímetros para calcular seu IMC:',
      textAlign: TextAlign.center, 
      style: TextStyle(
        fontSize: 17.0,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}



 Widget buildWeightInput() {
  return Container(
        color: Colors.transparent,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[
        Text('Informe seu peso (kg):', 
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.blue,
            ),
        ),
        SizedBox(height: 10.0), 
        TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), 
                ),
                hintText: '80.7',
            ),
          onChanged: (value) {
            setState(() {
              weight = double.parse(value);
            });
          },
        ),
      ],
    ),
  );
}

Widget buildHeightInput() {
  return Container(
    color: Colors.transparent,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[
        Text(
          'Informe sua altura (cm):',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 10.0), 
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '187',
          ),
          onChanged: (value) {
            setState(() {
              heightPerson = double.parse(value);
            });
          },
        ),
      ],
    ),
  );
}

Widget buildCalculateButton() {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    color: Colors.transparent,
    alignment: Alignment.topLeft,
    margin: EdgeInsets.all(10.0),
    child: ElevatedButton(
      onPressed: () {
        setState(() {
          imc = weight / ((heightPerson / 100) * (heightPerson / 100));
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Define o raio de borda desejado
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(child: Text('Calcular IMC')),
      ),
    ),
  );
}

Widget buildIMCResult() {
  Color textColor = Colors.red;

    if (imc == 0) {
        textColor = Colors.white;
    } else if ((imc < 18.5) && (imc > 0)) {
        textColor = Colors.red;
    } else if ((imc >= 18.5) && (imc < 24.9)) {
        textColor = Colors.green;
    } else if ((imc >= 24.9) && (imc < 29.9)) {
        textColor = Colors.orange;
    } else {
       textColor = Colors.red;
    }

    String imcCerto = imc.toStringAsFixed(2);

  return Container(
    margin: AppStyles.customPaddingEdgeInsets,
    child: Text(
      'Seu IMC: $imcCerto',
      style: TextStyle(
        fontSize: 30.0,
        color: textColor, // Usa a cor definida acima
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

}
