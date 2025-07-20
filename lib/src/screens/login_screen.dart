import 'package:flutter/material.dart';
import '../mixins/mixin.dart';

class LoginScreen  extends StatefulWidget {
  @override
  createState(){
    return Loginscreeenstate();
  }
}

class Loginscreeenstate extends State<LoginScreen> with Validation{
  String Email = '';
  String Password ='';
   
  /* Why do we reference GlobalKey<FormState> instead of just Form?
🔑 Because the Form widget itself doesn’t expose methods like validate(), save(), or reset().
These methods are defined in the FormState class, which is the internal state of the Form widget.
 To call those methods, you need access to the Form’s state, not the widget.*/

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(20.0),
    child: Form(
      key: formkey,
      child: Column(
        children: [
        email(),
        Container(margin:EdgeInsets.only(bottom: 25.0)),
        password(),
         Padding(
      padding: EdgeInsets.only(top: 30.0),
         child: submitbutton()
         )
        ]
      ),
    ),
    );
    
  }

  Widget email(){
   return TextFormField(
   validator: validateemail,
   onSaved: (value){
         Email = value!.trim();  //.trim() --> This removes spaces from the input string.
   },
    keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    icon: Icon(Icons.person),
    labelText: 'Email',
    hintText: 'you@example.com',
  ),
   );
  }
  Widget password(){
   return TextFormField(
   validator: validatepassword,
   onSaved: (value){
   Password = value!.trim();  
   },
    decoration: InputDecoration(
   icon: Icon(Icons.vpn_key),
    labelText: 'Password',
    hintText: '*********',
    ),
    obscureText : true,
   );
  }
  Widget submitbutton(){
return ElevatedButton(
  
    onPressed: () {

      //This method goes through every TextFormField and calls its validator

      /*  (.currentState) is a property of GlobalKey.
      It returns the instance of the FormState associated with the form you assigned the key to.

      Using ! asserts to the compiler: “I’m sure this is not null.”
      If it is null and you use !, your app will crash. */ 

     if (formkey.currentState!.validate()) {
      
// If all fields are valid 
//Calls the onSaved() method of each field.
//It helps you store the field values (like email & password) into variables.

      formkey.currentState!.save();
        }
    },
  child: Text("Submit"),
);
  }
}


