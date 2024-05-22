import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/sign_up.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {

  bool secureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email='tarek404@gmail.com';
  String password='1234tarek';

  String? passwordError; 
  String? emailError; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: RichText(
          text:const TextSpan(
            children: [
              TextSpan(
                text: 'News', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              TextSpan(
                text: 'Cloud', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 24),
              ),
            ]
          ) ,
          ),
      ),
      body:  ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
         const Center(
            child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.orange),),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              cursorColor: Colors.orange,
              decoration:  InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: const Icon(Icons.email),
                suffixIconColor: Colors.orange,
                errorText: emailError,
                hintText: 'Enter Your Mail',
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.orange),
                border: InputBorder.none,
                enabledBorder:const UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.orange),
               ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          // Password Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.orange,
              obscureText: secureText,
              decoration:  InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      secureText = !secureText;
                    });
                  },
                  icon:  Icon(secureText? Icons.lock: Icons.remove_red_eye),),
                suffixIconColor: Colors.orange,
                errorText: passwordError,
                hintText: 'Enter Your Password',
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.orange),
                border: InputBorder.none,
                enabledBorder:const UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.orange),
               ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: (){},
           child: const Text('Forget Password?', style: TextStyle(color: Colors.orange),),
           ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: ElevatedButton(onPressed: (){
              setState(() {

                if(emailController.text.isEmpty ){
                  emailError = 'Please Enter Your Email';
                  passwordError = null;
                }
                else if(!emailController.text.contains('@gmail.com')){
                  emailError = 'Please Enter Valid Email';
                    passwordError=null;
                }
                else if(passwordController.text.isEmpty){
                  passwordError = 'Please Enter Your Password';
                  emailError = null;
                }
                else if(passwordController.text.length < 6){
                  passwordError = 'Please Enter Valid Password';
                  emailError = null;
                }
                else if(emailController.text != email || passwordController.text != password){
                  passwordError = 'Wrong Email or Password';
                  emailError=null;
                }
                else{
                  passwordError = null;
                  emailError = null;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                }
              });
            },
             style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(55, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
             ),
             child:const Text('Login', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
             ),
          ),
          const SizedBox(
            height: 115,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?', style: TextStyle(color: Colors.white),),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                }, child: const Text('Sign Up', style: TextStyle(color: Colors.orange),),)
            ],
          ),
        ],)
      
    );
  }
}