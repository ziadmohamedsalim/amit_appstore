import 'package:final_project/modules/bottombar/bottom_nav_bar.dart';
import 'package:final_project/modules/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/logoAmit.jpeg"),
                  height: size.height * 0.25,
                  width: size.width * 0.6,
                ),
                SizedBox(
                  height: size.height*0.065,
                ),
                TextFormField(
                  controller: emailControler,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height*0.045,
                ),
                TextFormField(
                  controller: passwordControler,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: isPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                      },

                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height*0.065,
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bottomNav(
                            ),
                          ),
                        );
                      }
                      },
                    child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don\'t have an account ?"),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signUp(
                          ),
                        ),
                      );
                    },
                        child: Text(
                            "Go SignUp",
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
