import 'package:flutter/material.dart';
import 'profile.dart';

class DonateBooks extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<DonateBooks> {
  String email="";
  String password="";
  String name="",fname="",mname="";
  String number="";
  bool _obscureText = true;
  String gender="";
  String groupValue="male";
  final _formkey=GlobalKey<FormState>();

  valueChanged(e){
    setState(() {
      if(e=="male"){
        groupValue=e;
        gender=e;
      }
      else if(e=="female"){
        groupValue=e;
        gender=e;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Donation Form")),
        body: Stack(
          children:<Widget>[

            Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => name = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Full Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => fname = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Father's Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => mname = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mother's Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),

                  Row(children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Male",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Radio(
                            value: "male",
                            groupValue: groupValue,
                            onChanged: (e) => valueChanged(e)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Female",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Radio(
                            value: "female",
                            groupValue: groupValue,
                            onChanged: (e) => valueChanged(e)),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Email...",
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => number = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mobile number...",
                        icon: Icon(Icons.call),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: "Create Password...",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: "Confirm Password...",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Button(
                    text: 'Donate',
                    //callback: null,
                    key: null,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
class Button extends StatelessWidget {
  //final VoidCallback callback;
  final String text;
  //required this.callback,
  const Button({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blue,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          //onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          onPressed: () {  },
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}