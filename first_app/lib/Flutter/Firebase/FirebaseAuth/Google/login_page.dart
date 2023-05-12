
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _handleLoginButton() async {
    var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test@gmail.com',
      password: '12341234'
    );
    print(res);
  }

  _handleSignUpButton() {
    print('회원가입 버튼 눌려짐');
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test@gmail.com',
      password: '12341234'
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleLoginButton,
                    child: Text('로그인'),
                  ),
                ),
                TextButton(
                  onPressed: _handleSignUpButton,
                  child: Text('회원가입')
                ),
                TextButton(
                    onPressed: signInWithGoogle,
                    child: Text('구글 로그인')
                ),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text('로그아웃')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

