import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFieldDemo(),
          RegisterFrom(),
        ],
      ),
        )
      );
  }
}

class RegisterFrom extends StatefulWidget {
  @override
  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {

  final registerFormKey = GlobalKey<FormState>();
  String userName,passWord;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onSaved: (value){
              userName = value;
            },
            obscureText: false,
            autovalidate: true,
            validator: (String value){
              if(value.isEmpty){
                return 'Username is required';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'UserName',
            ),
          ),
          TextFormField(
            onSaved: (value){
              passWord = value;
            },
            validator: _validator,
            autocorrect: true,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
            width: double.infinity,
            child:  RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: _submitRegister,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white,fontSize: 15.0),
              ),
              elevation: 0.0,
            ),
          )
        ],
      ),
    );
  }

 String _validator(String value){
   if(value.isEmpty){
     return 'Passedword is required';
   }
   return null;
 }
  void _submitRegister(){
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    debugPrint('username:$userName');
    debugPrint('passWord:$passWord');
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // _textEditingController.text = 'Hello';
    _textEditingController.addListener((){
      debugPrint('textChnage:${_textEditingController.text}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          // padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            controller: _textEditingController,
            // onChanged: (value ){
            //   print("onChanged:$value");
            // },
            onSubmitted: (value) {
              print("onSubmitted:$value");
            },
            decoration: InputDecoration(
              icon: Icon(Icons.subject),
              labelText: 'Telphone',
              hintText: 'Please input telphone',
              hintStyle: TextStyle(color: Colors.green, fontSize: 13.0),
              border: InputBorder.none,
            ),
          ),
        ),
      );
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}