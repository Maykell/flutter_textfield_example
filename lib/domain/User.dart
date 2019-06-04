class User {

  // Variaveis final são tem get (get e set são implicitos)
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);

  // Pode existir construtores nomeados
//  User.verificaPassword(String password){
//    if (this.password == password){
//      //executa algo
//    }
//  }
}