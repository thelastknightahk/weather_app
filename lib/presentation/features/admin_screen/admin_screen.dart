import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealther_app/global/widgets/text_form_field_widget.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Colors.black54)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Admin Panel ',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textFormFieldWidget(context, "Title"),
                  SizedBox(height: 10,),
                  textFormFieldWidget(context, "Description"),
                  SizedBox(height: 50,),
                  TextButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Sent Notification"),
                    ));
                  }, child: Text("SEND", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent)
                  ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
