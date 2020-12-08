import 'package:calpedelapp/pages/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calpedelapp/pages/mainpage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;


class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlue,
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: DecorationImage(image: new AssetImage("images/glass2.jpg"), fit: BoxFit.cover),
              ),
            ),
            new Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
//width: width,
                      height: 355.0,//height*0.45,
                      child: Image.asset('images/play.png',fit: BoxFit.contain,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Login',
                            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.0,),

                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,),

                    SizedBox(height: 30.0,),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),

                    Padding(padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
//Text('Forget password?',style: TextStyle(fontSize: 12.0),),
                          RaisedButton(
                            onPressed: () {
                              context.read<AuthenticationService>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                            child: Text('Login'),
                            textColor: Colors.white,
                            color: Colors.blueAccent,

                          ),
                        ],
                      ),
                    ),


                    SizedBox(height:20.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => mainpage()
                            )
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                            text: 'Guest Login',
                            style: TextStyle(
                                color: Colors.blueAccent
                            ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        )

    );
  }
}
