import 'package:flutter/material.dart';
import 'package:flutter_textfield_validation/domain/User.dart';
import 'package:meta/meta.dart';

import 'main_screen.dart';

class HomeScreen extends StatelessWidget {

  final String title;
  final _textControllerName = TextEditingController();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  HomeScreen({Key key, @required this.title}) : assert(title != null);

  // Chave única para identificar o form e realizar a validação.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(title),
    );

    final fieldName = TextFormField(
      controller: _textControllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Digite um nome válido.",
      ),
      validator: (value) {
        if (value.trim().length < 3) {
          return "O campo deve conter pelo menos 3 caracteres";
        }
      },
    );

    final fieldEmail = TextFormField(
      controller: _textControllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "digite um email válido.",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "O campo email não pode estar vazio";
        }
      },
    );

    final fieldPassword = TextFormField(
      controller: _textControllerPassword,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Digite um password válido.",
      ),
      validator: (value) {
        if (value.trim().length < 6) {
          return "Sua senha deve conter pelo menos 6 caracteres";
        }
      },
    );

    /// Responsavel por fazer a validação dos textfieldform
    final form = Form(

      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 8.0),
          fieldName,
          SizedBox(height: 8.0),
          fieldEmail,
          SizedBox(height: 8.0),
          fieldPassword,
          SizedBox(height: 8.0),
        ],
      ),
    );

    Widget validateButton(BuildContext context) {
      return RaisedButton(
        child: Text(
          "VALIDATE",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Sucesso"),
                  action: SnackBarAction(
                    label: "OK",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new MainScreen(
                                user: User(
                                    _textControllerName.text,
                                    _textControllerEmail.text,
                                    _textControllerPassword.text))),
                      );
                    },
                  ),
                ));
          }
        },
      );
    }

    final scaffold = Scaffold(
      appBar: appBar,
      // Cria um BuildContext interno para os metodos onPressed
      // que se referem ao Scaffold com Scaffold.of ().
      body: Builder(builder: (BuildContext context) {
        return ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            form,
            validateButton(context),
          ],
        );
      }),
    );

    return scaffold;
  }
}
