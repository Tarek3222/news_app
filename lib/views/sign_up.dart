import 'package:flutter/material.dart';
import 'package:news_app/views/log_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  bool secureTextPassword = true;
  bool secureTextConfirmPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  String? coniformPasswordError;  
  String? passwordError;
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
            child: Text('Sign Up',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.orange),),
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
              obscureText: secureTextPassword,
              decoration:  InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      secureTextPassword = !secureTextPassword;
                    });
                  },
                  icon:  Icon(secureTextPassword? Icons.lock: Icons.remove_red_eye),),
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
          // Confirm Password Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.orange,
              obscureText: secureTextConfirmPassword,
              decoration:  InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      secureTextConfirmPassword = !secureTextConfirmPassword;
                    });
                  },
                  icon:  Icon(secureTextConfirmPassword? Icons.lock: Icons.remove_red_eye),),
                suffixIconColor: Colors.orange,
                errorText: coniformPasswordError,
                hintText: 'Confirm Your Password',
                labelText: 'Confirm Password',
                labelStyle: const TextStyle(color: Colors.orange),
                border: InputBorder.none,
                enabledBorder:const UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.orange),
               ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  if(emailController.text.isEmpty){
                    emailError = 'Please Enter Your Email';
                    passwordError=null;
                    coniformPasswordError=null;
                  }else if(!emailController.text.contains('@gmail.com')){
                    emailError = 'Please Enter Valid Email';
                    passwordError=null;
                    coniformPasswordError=null;
                  }
                  else if(passwordController.text.isEmpty){
                    passwordError = 'Please Enter Your Password';
                    emailError=null;
                    coniformPasswordError=null;
                  }
                  else if(confirmPasswordController.text.isEmpty){
                    coniformPasswordError = 'Please Confirm Your Password';
                    passwordError=null;
                    emailError=null;
                  }
                    else if(passwordController.text != confirmPasswordController.text){
                    coniformPasswordError = 'Password Not Match';
                    passwordError=null;
                    emailError=null;
                  }
                  else if(passwordController.text.length < 6){
                    passwordError = 'Password Length at least 6 character';
                    emailError=null;
                    coniformPasswordError=null;
                  }
                  else{
                    emailError = null;
                    passwordError = null;
                    coniformPasswordError = null;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInView()));
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
             child:const Text('Sign Up', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
             ),
          ),
           const SizedBox(
            height: 90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInView()));
                }, child:  Text('I already have an account', style: TextStyle(color: Colors.orange[300]),),),
            ],
          ),
        ],)
      
    );
  }
}