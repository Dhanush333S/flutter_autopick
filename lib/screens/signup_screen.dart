import 'package:auto_pick/responsive/mobile_layout.dart';
import 'package:auto_pick/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void signUpUser(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const MobileLayout()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
          onPressed: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Row(

          mainAxisAlignment: MainAxisAlignment.end,
          children: [


           Image.asset('assets/paramount.jpg',

             height: 150,
             width: 70,
           ),
        ],
      ),
      ),
      body: Padding(

        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
         child:SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(
               child:Image(
              image: AssetImage('assets/symbol.png'),
              width: MediaQuery.of(context).size.width * 0.4,
            ),
             ),
             SizedBox(height: 10.0),
             Center(
               child: Card(
                 color: Colors.white,
                 shape:RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 margin: EdgeInsets.fromLTRB(16,16,16,0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                        child:Text.rich(
                          TextSpan(
                            text: 'Account ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Signup', style: TextStyle(fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 18.0,)),
                            ],
                          ),
                        ),
                        ),

                        SizedBox(height: 20.0,),

                        Text('Email',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                        ),),
                        SizedBox(height: 5.0,),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'karan.singh@textile.com',
                            border: OutlineInputBorder(


                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          ),


                        ),

                        SizedBox(height: 2.0,),
                        Divider( // Creates the lines between the widgets.
                          thickness: 2.0,
                          height: 20.0,
                          color: Colors.grey[100],
                        ),

                        Text('Phone Number',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins',
                          ),),
                        SizedBox(height: 5.0,),
                        TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,

                              filled: true,
                              hintText: '+91-999028853',
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(6),
                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          ),

                        ),

                        SizedBox(height: 2.0,),
                        Divider( // Creates the lines between the widgets.
                          thickness: 2.0,
                          height: 20.0,
                          color: Colors.grey[100],
                        ),


                        Text('Password',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins',
                          ),),
                        SizedBox(height: 5.0,),
                        TextField(
                         obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'karan@123',
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

                          ),
                        ),

                        SizedBox(height: 2.0,),
                        Divider( // Creates the lines between the widgets.
                          thickness: 2.0,
                          height: 30.0,
                          color: Colors.grey[100],
                        ),
                        Center(

                          child: ElevatedButton(



                            style: ElevatedButton.styleFrom(
                              primary:Colors.blueAccent[700],
                              elevation: 20,
                              minimumSize: Size(30,40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                            ),
                            onPressed: signUpUser,
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),

                            ),


                          ),
                        ),

                        SizedBox(height: 10.0),
                        Center(
                          child: Text('Already have an account?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue.shade800,
                          ),
                          ),
                        ),

                        SizedBox(height: 5.0),

                        Center(
                          child: TextButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                            },
                            child: Text('Login',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                        )



                      ],
                    ),
                  ),
               ),
             )
           ],
         ),
      ),
      ),
    );
  }
}