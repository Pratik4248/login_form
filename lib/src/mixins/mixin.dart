mixin Validation{
 String? validateemail(String? value) {
   if (value == null || value.isEmpty) {
     return 'Please enter Email';
   }
   if (!value.contains('@gmail.com') && !value.contains('@yahoo.com') && !value.contains('@icloud.com')) {
     return 'Enter a valid email';
   }
    return null;
   }

  String? validatepassword(String? value){
        if (value == null || value.length < 6) {
   return 'Password must be 6 characters or more';
      }
    return null;

  }
}

/* We use String? instead of String because the validator function might 
   receive null and must also return null when the input is valid.

   String means a non-nullable string — it can never be null.

   String? means a nullable string — it can be null.

 */
