import 'package:flutter/material.dart';
import 'Styles.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}


class _MediaPageState extends State<MediaPage> {
  List<double> grades = [];
  double average = 0;
  TextEditingController _controller = TextEditingController();

   void _updateAverage() {
    if (grades.isNotEmpty) {
      setState(() {
        average = grades.reduce((a, b) => a + b) / grades.length;
      });
    } else {
      setState(() {
        average = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Média')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Insira as notas para atualizar a média:',
                textAlign: TextAlign.center, 
                style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                ),
            ),
            SizedBox(height: 70.0), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),    
                                bottomRight: Radius.circular(0), 
                                topRight: Radius.circular(0),    
                                bottomLeft: Radius.circular(20), 
                            ),
                        ),
                        hintText: '10, 9.5, ...',
                    ),      
                    controller: _controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(25.0), 
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),    
                                bottomRight: Radius.circular(20), 
                                topRight: Radius.circular(20),    
                                bottomLeft: Radius.circular(0), 
                            ),
                        ),
                    ),
                    onPressed: () {
                      final newGrade = double.tryParse(_controller.text) ?? 0;
                      setState(() {
                        grades.add(newGrade);
                        _updateAverage();
                        _controller.clear();
                      });
                    },
                    child: Text('Adicionar'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Notas cadastradas:', 
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                ),
            ),
            Column(
              children: List.generate(grades.length, (index) => Text(grades[index].toString(), style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                ),)),
            ),
            SizedBox(height: 20),
            Text('Média das notas:', 
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                ),
            ),
            Text('${average.toStringAsFixed(2)}', 
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
