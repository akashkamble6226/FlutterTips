// // normal way to create class then using its values through objects
// class StringUtil{
//   static bool isValidEmail(String str)
//   {
//     final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     return emailRegex.hasMatch(str);
//   }
// }


// extension StringExtension on String{

//    bool get isValidEmail
//   {
//     final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     return emailRegex.hasMatch(this);
//   }

// }


// void main()
// {
//   //normal calling 
//   // ignore: avoid_print
//   print(StringUtil.isValidEmail('something'));

//   // calling inside the extension
//   // ignore: avoid_print
//   dynamic output ='something'.isValidEmail;
//   // ignore: avoid_print
//   print(output);
// }