import 'package:flutter/material.dart';

class LoginScreen  extends StatefulWidget {
  @override
  createState(){
    return Loginscreeenstate();
  }
}

class Loginscreeenstate extends State<LoginScreen> {
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
   validator: (value) {
   if (value == null || value.isEmpty) {
     return 'Please enter Email';
   }
   if (!value.contains('@gmail.com') && !value.contains('@yahoo.com') && !value.contains('@icloud.com')) {
     return 'Enter a valid email';
   }
    return null;
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
   validator: (value) {
   if (value == null || value.length < 6) {
   return 'Password must be 6 characters or more';
      }
    return null;
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
     if (formkey.currentState!.validate()) {
      
// If all fields are valid 
//Calls the onSaved() method of each field.
//It helps you store the field values (like email & password) into variables.
      formkey.currentState!.save();
       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logging in...')),
         );
        }
    },
  child: Text("Submit"),
);
  }
}


