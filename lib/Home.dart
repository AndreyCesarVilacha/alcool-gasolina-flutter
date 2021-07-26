import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    //Capturando o valor armazenado no _controllerAlcool e convertendo para double
    //Coloque o "?", pois o tryparse tenta converter, mas caso contrario retorna nulo
    //E o operator "?" é chamado null safety,
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando ( . )";
      });
    } else {
      if((precoAlcool/precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else{
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
      _limparCampos();
      
    }
  }

  void _limparCampos(){
      _controllerGasolina.text = "";
      _controllerAlcool.text = "";
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a mehlor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: _calcular,
                  style: ButtonStyle(
                    //Cor do botão
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    //Cor de texto
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
