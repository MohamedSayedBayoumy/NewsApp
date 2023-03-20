// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_state.dart';
//
// import '../../../core/services/services_locator.dart';
// import '_authenticator/presentation/auth_controller/auth_bloc.dart';
// import '_authenticator/presentation/auth_controller/auth_event.dart';
// import 'core/widgets/custom_button/custom_button.dart';
// import 'core/widgets/custom_textfiled/text_filed.dart';
//
// class Test3 extends StatefulWidget {
//   const Test3({Key? key}) : super(key: key);
//
//   @override
//   State<Test3> createState() => _Test3State();
// }
//
// class _Test3State extends State<Test3> {
//   dynamic x;
//
//   dynamic y;
//   List<Marker> data = [];
//
//   TextEditingController n1 = TextEditingController();
//
//   bool isEmpty = true;
//
//   //  void lol(){
//   //
//   //      setState(() {
//   //        isEmpty =! isEmpty ;
//   //      });
//   //  }
//   //
//   //  @override
//   //  void initState() {
//   // n1.addListener(() { lol() ; }) ;
//   //    super.initState();
//   //  }
//   //
//
//
//   void change(){
//     if(n1.text.isEmpty){
//       setState(() {
//         isEmpty = false ;
//       });
//     }else{
//       setState(() {
//         isEmpty = true ;
//       });
//     }
//   }
//   @override
//   void initState() {
//  n1.addListener(() { }) ;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("hi 3");
//
//     final media = MediaQuery.of(context).size;
//
//     // IntroBloc bloc = IntroBloc();
//     // final cubit = BlocProvider.of<IntroBloc>(context);
//
//     // final bloc = ;
//     return BlocProvider<AuthBloc>(
//         create: (context) => sl<AuthBloc>(),
//         child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//           final bloc = BlocProvider.of<AuthBloc>(context);
//           return Scaffold(
//             body: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: media.height * .03),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     StreamBuilder(
//                       stream: bloc.state.textStream,
//                       builder: (context, snapshot) {
//                         return CustomTextField(
//                             onChange: (value) =>
//                                 bloc.state.updateText(value.toString()),
//                           // errorText: textStream.hasError ? textStream.error.toString() : null ,
//                             borderColor: Colors.yellowAccent.shade400,
//                             styleBorder: const OutlineInputBorder(),
//                             labelText: "Phone Number",
//                             hinText: "+20", controller: null,
//                             ) ;
//                       },
//                       // child:
//                     ),
//                     SizedBox(
//                       height: media.height * .03,
//                     ),
//                     // BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//                     //   final bloc = BlocProvider.of<AuthBloc>(context);
//                     //   print("object 2");
//                     //   return
//                     CustomButton(
//                       width: media.width,
//                       primary: state.isEmpty
//                           ? Colors.blueAccent
//                           : Colors.yellowAccent,
//                       onPressed: () {
//                         bloc.add(AddPhoneNumberEvent(
//                             context: context,
//                             phoneNumber: bloc.state.phoneController.text));
//                       },
//                       text: "Add",
//                     ),
//                     // }
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }));
//   }
// }
//
// //
// // class _Test3State extends State<Test3> {
// //   final TextEditingController _inputController = TextEditingController();
// //   final TextEditingController _inputController2 = TextEditingController();
// //   bool enable = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _inputController.dispose();
// //     _inputController2.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Center(
// //             child: Column(children: [
// //               TextField(
// //                 controller: _inputController,
// //                 onChanged: (data) {
// //                   if (_inputController.text.isEmpty ||
// //                       _inputController2.text.isEmpty) {
// //                     enable = false;
// //                   } else {
// //                     enable = true;
// //                   }
// //                   setState(() {});
// //                 },
// //               ),
// //               TextField(
// //                 controller: _inputController2,
// //                 onChanged: (data) {
// //                   if (_inputController.text.isEmpty ||
// //                       _inputController2.text.isEmpty) {
// //                     enable = false;
// //                   } else {
// //                     enable = true;
// //                   }
// //                   setState(() {});
// //                 },
// //               ),
// //               ElevatedButton(
// //                 onPressed: enable ? () {} : null,
// //                 child: Text('${enable}'),
// //               )
// //             ])),
// //       ),
// //     );
// //   }
// // }
//
// // class AddPhoneScreen extends StatefulWidget {
// //   const AddPhoneScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<AddPhoneScreen> createState() => _AddPhoneScreenState();
// // }
// //
// // class _AddPhoneScreenState extends State<AddPhoneScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //   }
// // }
