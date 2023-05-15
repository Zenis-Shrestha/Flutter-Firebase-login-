import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/components/mytextfield.dart';
import 'package:loginapp/components/mybutton.dart';
import 'package:loginapp/components/squaretile.dart';




class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing contoller 
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //sign user in method
  void signUserUp() async {
    /// show loading screen
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    /// try creating a new user
    try{
      if(passwordController.text == confirmPasswordController.text){
             await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, 
            password: passwordController.text,
    );

      }else{
        //show error message
        showErrorMessage("Password dont match up");
      }
   
     //pop the loading circle
    Navigator.pop(context);

    }on FirebaseAuthException catch(e){

       //pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }
  //show error message
  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
       return AlertDialog(
         backgroundColor: Colors.blue,
         title:Center(
          child:Text(
            message,
            style: const TextStyle(color:Colors.white),
          ),
           ),
        );
      },
      );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const SizedBox(height: 25),

    
        //logo
        Icon(
          Icons.lock,
          size: 100,

        ),
         SizedBox(height:50),

         Text('Lets create a account for you!',
         style:TextStyle(
         color:Colors.blue[600],
         fontSize: 25,
         ),
         ),

        SizedBox(height:25),
        //email
        MyTextField(
          controller: emailController,
          hintText: 'Email',
          obscureText: false,
        ),
        const SizedBox(height:10),
        //password
        MyTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
        ), 

        const SizedBox(height:10),
        //confirm password
         MyTextField(
          controller: confirmPasswordController,
          hintText: 'Confirm Password',
          obscureText: true,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
          'Forget Password',
          style : TextStyle(color:Colors.grey[600]),
            ),
          ],
        ),
        ),

        const SizedBox(height:10),

        //login Button
        MyButton(
            text: "Sign Up",
          onTap: signUserUp,
          ),

        const SizedBox(height:10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.7,
                  color: Colors.blue[600],
                ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Or Continue With",
                    style:TextStyle(
                      color: Colors.blue[600]
                      ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color:Colors.grey[400],
                    )
                  )

            ],
          ),
          
        ),

        const SizedBox(height:10),

        //google + apple sign in buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //google button 
          SquareTile(imagePath:'lib/images/google.png'),
          const SizedBox(width: 10,),
          //apple button
          SquareTile(imagePath: 'lib/images/apple.png'),
        ],
          ),

          const SizedBox(height:50),

          //not a member yet Sign up here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text('Already a Member '),
            const SizedBox(width:5),
            GestureDetector(
              onTap:widget.onTap,
               child :const Text('Login now',
            style:TextStyle(color: Colors.blue,
            fontWeight: FontWeight.bold,
            
            ),
            ),
            ),
          ],
          )


        
        ],
        )
      ), 
        ),
      ),
      );





  

  }
} 
