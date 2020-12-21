
import 'package:flutter/material.dart';

class CalcolaCostiScreen extends StatefulWidget {

    @override
    _CacolaCostiScreenState createState() => _CacolaCostiScreenState();
}

class _CacolaCostiScreenState extends State<CalcolaCostiScreen> {
    String messaggio;
    TextStyle a = TextStyle(fontSize: 20, color: Colors.grey[800]);
    TextStyle b = TextStyle(fontSize: 20, color: Colors.grey[800]);
    TextStyle c = TextStyle(fontSize: 20, color: Colors.grey[800]);
    final List<String> tipiPercorso = ['Urbano', 'Extra urbano', 'Misto'];
    String tipoPercorso;
    TextEditingController kmController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text('Calcola costo del viaggio')),
            body: Padding(padding: const EdgeInsets.all(20.0), 
                 child: Column(children: [
                TextField(
                    controller: kmController,
                    keyboardType: TextInputType.number,
                    style: b, 
                    decoration: InputDecoration(
                        hintText: 'Inserisci il numero di Km', hintStyle: c),
                ),
                Spacer(),
                DropdownButton<String>(
                    value: tipoPercorso,
                    items: tipiPercorso.map((String v) { 
                        return DropdownMenuItem<String>(value: v, 
                            child: Text(v,
                                style: a));
                    }).toList(),
                    onChanged: (String nuovoValore) { this.setState(() {
                        tipoPercorso = nuovoValore;
                    });},
                ),
                Spacer(flex: 2),
                RaisedButton(
                    onPressed: (){calcolaCosto();}, 
                    child: Text('Calcola costo',
                    style: TextStyle(color: Colors.white, fontSize: 20, )),
                    color: Colors.orange
                ),
                Spacer(flex: 2),
                Text(messaggio, style: a)            
            ]))
        );
    }

    void calcolaCosto() {
        double costoCarburanteLitro = 1.4;
        double nKm = double.tryParse(kmController.text);
        double kmTipoPercorso;
        double costo;

        if (tipoPercorso == tipiPercorso[0]) {
            kmTipoPercorso = 14;
        }else if(tipoPercorso == tipiPercorso[1]){
            kmTipoPercorso = 18;
        }else if(tipoPercorso == tipiPercorso[3]){
            kmTipoPercorso = 16;
        } 

        costo = nKm * costoCarburanteLitro / kmTipoPercorso;

        setState(() {
            messaggio = 'Il costo previsto per il tuo viaggio è di € $costo';
        });
    }
}