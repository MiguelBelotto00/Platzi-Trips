import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
class FirebaseAuthPlatzi{
  //creando una instancia de firabase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Creando una variable para el metodo googlesigin
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //Se utiliza Future porque es algo que nos devolvera mas adelante o cuando sea llamado y es async
  //Se pasa UserCredential porque ese es el tipo que nos devolvera firebase
  Future<UserCredential> signInWithGoogle() async{
    //Puede ser del tipo nulo por eso lleva "?", ademas creamos una instancia del inicio de sesion con google
    //y llamamos al metodo signIn()
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    //Obtenemos la authentication de la cuenta que inicia sesion
    GoogleSignInAuthentication? gSA = await googleSignInAccount?.authentication;
    //Creamos la clase credential donde pasar las credentiales para el usuario.
    final credential = GoogleAuthProvider.credential(
      idToken: gSA?.idToken,
      accessToken: gSA?.accessToken,
    );
    //retornamos las credenciales de autenticacion.
    return await _auth.signInWithCredential(credential);
  }
  Future<void> signOut() async {
    await _auth.signOut();
    _googleSignIn.signOut();
  }
}

