import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:authentication_app/constants/image_strings.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import 'reset_password.dart';
import 'date_ofbirth_pick.dart';
import 'old_password.dart';

enum Gender { Select, Male, Female, Other }
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  String selectedOption = 'Change Password';
  Gender _selectedGender = Gender.Select;
  bool isBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///--------------App Bar--------------
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.inter(
                textStyle:
                    TextStyle(fontSize: 24, fontWeight: FontWeights.Bold)),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (String Value){
                setState(() {
                  selectedOption = Value;
                });
                if (Value == 'Change Password'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OldPasswordScreen()));
                } else if(Value =='LogOut'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: 'Change Password',
                child: Text('Change Password', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeights.Bold),),
              ),
              PopupMenuItem(
                value: 'LogOut',
                child: Text('Log Out', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeights.Bold),),
                )
              
            ],
            icon: Icon(Icons.settings),
            ),
      ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///----------Profile Picture & Edit------------------
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage(appImages.imageProfile),
                        ),

                        ///------------Edit------------------
                        Positioned(
                          top: 15,
                          right: 0,
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ///----------Name-------------
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 8.0),
                  child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Name',
                        style: GoogleFonts.inter(fontSize: 12),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Full Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black87))),
                  ),
                ),
                ///---------Phone--------------
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 8.0),
                  child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Phone',
                        style: GoogleFonts.inter(fontSize: 12),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black87))),
                  ),
                ),
                ///---------Gender--------------
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 8.0),
                  child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Gender',
                        style: GoogleFonts.inter(fontSize: 12),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: SingleChildScrollView (
                    child: DropdownButtonFormField(
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue!;
                          });
                        },
                        items: Gender.values.map((Gender gender) {
                          return DropdownMenuItem<Gender>(
                            value: gender,
                            child: Text(gender.toString().split('.').last),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black87)
                          )
                        ),
                  ),
                ),
                ),
                ///---------Calender--------------
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 8.0),
                  child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Calender',
                        style: GoogleFonts.inter(fontSize: 12),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: DateOfBirth_picker(),
                ),
                ///---------Update Button--------------
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 16),
                  child: GestureDetector(
                    onTap: (){
                      print('Update');
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 50,
                      width: 328,
                      decoration: BoxDecoration(
                        color: AppColors.colorGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text('Update', style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeights.SemiBold, color: AppColors.colorGreyDark),),)
                    ),
                  ),
                ),
                ///---------LogOut--------------
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                  child: GestureDetector(
                    onTap: (){
                      print('Logout');
                    },
                    child: Container(
                        alignment: AlignmentDirectional.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: AppColors.colorGrey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, color: Colors.red,),
                            SizedBox(width: 10,),
                            Text('Logout', style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeights.SemiBold, color: Colors.red),),),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
