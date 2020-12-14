import 'package:flutter/material.dart'; //material design

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas", //valores opcionais
      home: Home()));  //e chamo home
}
class Home extends StatefulWidget {// stateFul são widgtes que possuem uma função
  @override // rescrever um método
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // a class _homeState chama a superclass Home
  int _people=0;
  String _InfoText="Pode entrar!";
  void _changePeople(int delta){ // os dois botoes fazem a msm coisa, então criei uma funcao
   setState(() {// falo pra build atualizar a tela
     _people+=delta;
     if(_people<0){
       _InfoText="Mundo investido rs";
     }
     else if(_people<=10){
       _InfoText="Pode entrar!";
     }
     else {
       _InfoText="Lotado";
     }
   });

  }
  @override
  Widget build(BuildContext context) {
    return Stack( // serve pra sobrepor widgtes
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover, //coluna por cima da imagem
          height: 1000.0,
        ),
        Column(
          //coluna de widgtes
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ávore de widgets
            // children é o filho da coluna
            Text(
              "Pessoa:$_people", // o texto em si e dps  o estilo
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0),// cria um espaço em branco ao redor da child
                    child:  FlatButton( //  flatbutton botão sem fundo
                      // child permite só um filho, só 1 widgte
                      child: Text("+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),),
                      onPressed: () {

                       _changePeople(1);
                      },
                    )),

                Padding(padding: EdgeInsets.all(10.0),
                    child:FlatButton(
                      child: Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),),
                      onPressed: () {
                        debugPrint("-1");// é igual um "Serial print"
                     _changePeople(-1);
                      },
                    )),
              ],
            ),
            Text(
              _InfoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
