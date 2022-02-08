// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class ChecklistItemWidget extends StatefulWidget {
  const ChecklistItemWidget({Key? key}) : super(key: key);


  @override
  _ChecklistItemWidgetState createState() => _ChecklistItemWidgetState();
}

class _ChecklistItemWidgetState extends State<ChecklistItemWidget> {
  
  bool okay = false;
  bool issue = false;

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                          child: const Text(
                            'This is a Checklist Question',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        if(this.issue)
                          Container(
                            padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 20),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              initialValue: '', 
                              onChanged: (val) {

                              }, 
                              validator: (val) {}, 
                              obscureText: false, 
                              textCapitalization: TextCapitalization.words,
                              decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'A Question',
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                              //errorStyle: TextStyle(color: Colors.red, fontSize: 18),
                              labelStyle: TextStyle(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlue,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              isDense: true
                              //errorStyle: TextStyle(color: Colors.red)
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),

          Positioned.fill(
            child: Container(
              transform: Matrix4.translationValues(-20, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  this.okay == false ?
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      width: !this.issue ? 50 : 0,
                      height: !this.issue ? 50 : 0,
                      child: Center(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          splashRadius: 1,
                          onPressed: () {
                            setState(() => this.issue = true);
                            setState(() => this.okay = false);
                          },
                          icon: Image.asset('images/xmark-gray.png')
                        )
                      )
                    ) : const SizedBox(
                      width: 50,
                      height: 50,
                    ),

                  AnimatedContainer(
                      transform: this.issue ? Matrix4.translationValues(10, 10, 0) : Matrix4.translationValues(0, 0, 0),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      width: this.issue ? 60 : 0,
                      height: this.issue ? 60 : 0,
                      child: Center(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          splashRadius: 1,
                          onPressed: () {
                            setState(() => this.issue = false);
                            setState(() => this.okay = false);
                          },
                          icon: Image.asset('images/xmark.png'),
                          iconSize: 60,
                        )
                      )
                    ),

                    this.issue == false 
                    ? AnimatedContainer(
                        transform: !this.okay ? Matrix4.translationValues(-10, 0, 0) : Matrix4.translationValues(0, 0, 0),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.bounceOut,
                        width: !this.okay ? 50 : 0,
                        height: !this.okay ? 50 : 0,
                        child: Center(
                          child: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            onPressed: () {
                              setState(() => this.okay = true);
                              setState(() => this.issue = false);
                            },
                            icon: Image.asset('images/checkmark-gray.png')
                          )
                        )
                      ) 
                    : const SizedBox.shrink(),

                    this.issue == true 
                    ? Container(
                        transform: Matrix4.translationValues(0, 10, 0),
                        width: 60,
                        height: 60,
                        child: Center(
                          child: IconButton(
                            splashColor: Colors.transparent,
                            splashRadius: 1,
                            onPressed: () {
                              
                            },
                            icon: Image.asset('images/camera.png'),
                            iconSize: 60 
                          )
                        )
                      ) 
                    : const SizedBox.shrink(),

                    AnimatedContainer(
                      transform: this.okay ? Matrix4.translationValues(-10, 10, 0) : Matrix4.translationValues(0, 0, 0),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      width: this.okay ? 60 : 0,
                      height: this.okay ? 60 : 0,
                      child: Center(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          splashRadius: 1,
                          onPressed: () {
                            setState(() => this.okay = false);
                            setState(() => this.issue = false);
                          },
                          icon: Image.asset('images/checkmark.png'),
                          iconSize: 60,
                        )
                      )
                    ),
                  
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
