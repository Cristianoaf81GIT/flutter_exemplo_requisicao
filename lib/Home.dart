import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert"; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();  
}


class _HomeState extends State<Home> {
  
  // comunicação asyncrona no dart/flutter
  // apos o nome do metodo usar a palavra 
  // reservada async
  // se o metodo for retornar o resultado da requisicao
  // use na assinatura do metodo ex:
  // Future<http.Response> _recuperarCep() async {...}
  _recuperarCep() async {
    String cep = "37530000";
    String url = "http://viacep.com.br/ws/${cep}/json/";  
    http.Response response = await http.get(Uri.parse(url));  
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    print("Status da requisição: ${response.statusCode}");
    print("Corpo da resposta: ${response.body}");
    print(logradouro);
    print(bairro);
    print(complemento);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("consumo de serviços"),  
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            // elements
            ElevatedButton(
              child: const Text("Clique aqui"),
              onPressed: _recuperarCep
            ),

          ],  
        ),
      ),
    );
  }
}

