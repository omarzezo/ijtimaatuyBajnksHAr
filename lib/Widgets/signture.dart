import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/Widgets/text_for.dart';

class Signature extends StatefulWidget {

  @override
  _SignatureState createState() => _SignatureState();
}

bool selectItems = true;
bool selectItems2 = true;
bool selectItems3 = true;

class _SignatureState extends State<Signature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            GestureDetector(
              onTap: (){
                setState(() {
                  selectItems = ! selectItems;
                });
              },
              child: Container(
                height: 60,
                width: 300,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:(selectItems ==false) ? Colors.yellow: Colors.grey.shade100),
                  color: (selectItems == false ) ? Colors.amber.shade50:Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon:  Icon((selectItems == false) ? Icons.check_box: Icons.check_box_outline_blank),
                      color: (selectItems == false) ? Colors.amber : Colors.grey,
                    ),
                    customText(text: 'Signature'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                setState(() {
                  selectItems3 = ! selectItems3;
                });
              },
              child: Container(
                height: 60,
                width: 300,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:(selectItems3 ==false) ? Colors.yellow: Colors.grey.shade100),
                  color: (selectItems3 == false ) ? Colors.amber.shade50:Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon:  Icon((selectItems3 == false) ? Icons.check_box: Icons.check_box_outline_blank),
                      color: (selectItems3 == false) ? Colors.amber : Colors.grey,
                    ),
                    customText(text: 'Signature'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            
            GestureDetector(
              onTap: (){
                setState(() {
                  selectItems2 = ! selectItems2;
                });
              },
              child: Container(
                height: 60,
                width: 300,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:(selectItems2 ==false) ? Colors.yellow: Colors.grey.shade100),
                  color: (selectItems2 == false ) ? Colors.amber.shade50:Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon:  Icon((selectItems2 == false) ? Icons.check_box: Icons.check_box_outline_blank),
                    color: (selectItems2 == false) ? Colors.amber : Colors.grey,
                    ),
                    customText(text: 'Signature'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
