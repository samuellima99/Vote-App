import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vote',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _facebook = 0;
  int _instagram = 0;
  bool _finishVotig = false;

  void _votingFacebook(int votes) {
    setState(() {
      _facebook += votes;
    });
  }

  void _votingInstagram(int votes) {
    setState(() {
      _instagram += votes;
    });
  }

  void _finishVoting() {
    setState(() {
      _finishVotig = true;
    });
  }

  void _resetVoting() {
    setState(() {
      _facebook = 0;
      _instagram = 0;
      _finishVotig = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "images/bg.png",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/logo.png",
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: (Text(
                    'Escolha seu preferido',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ))),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Material(
                          // needed
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                          color: Color.fromRGBO(0, 0, 0, 0.6),

                          child: InkWell(
                              onTap: () => _finishVotig == true
                                  ? {}
                                  : {_votingFacebook(1)}, // neede
                              child: Container(
                                width: 100.0,
                                child: Image.asset(
                                  "images/facebook.png",
                                  width: 20,
                                ),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Text('$_facebook votos',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Material(
                          // needed

                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                          color: Color.fromRGBO(0, 0, 0, 0.6),

                          child: InkWell(
                              onTap: () => _finishVotig == true
                                  ? {}
                                  : {_votingInstagram(1)}, // neede
                              child: Container(
                                width: 100.0,
                                child: Image.asset(
                                  "images/instagram.png",
                                  width: 20,
                                ),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Text('$_instagram votos',
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                        )
                      ],
                    )
                  ],
                ),
              ),
              _finishVotig == true
                  ? Row(children: [])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(224, 0, 58, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 36, vertical: 16),
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () => {_finishVoting()},
                              child: Text('Finalizar votação')),
                        )
                      ],
                    ),
              _finishVotig == false
                  ? Row(
                      children: [],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30.0),
                              child: Image.asset(
                                "images/saller.png",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Vencedor:',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                            _facebook > _instagram
                                ? Text(' Facebook',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(76, 214, 43, 1)))
                                : Text(' Instagram',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(76, 214, 43, 1))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(76, 214, 43, 1),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 36, vertical: 16),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () => {_resetVoting()},
                                  child: Text('Nova votação')),
                            )
                          ],
                        )
                      ],
                    )
            ],
          ),
        ],
      ),
    );
  }
}
