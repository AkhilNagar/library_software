import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget{
  static const url = 'https://projects_inc.github.io/';
  static const email = 'abc@somaiya.edu';
  static const phone = '+91 9820648981';
  static const location = 'Mumbai, India';
  void _showDialog(BuildContext context, {required String title, required String msg}) {
    final Dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        ElevatedButton(
          //color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },

          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (x) =>  Dialog);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), elevation:0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/user.jpg"),
            ),
            Text(
              'Akhil Nagar & Hetvi Gudka',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Tech Enthusiasts',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blueGrey[200],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro'),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () async {
                // String removeSpaceFromPhoneNumber =
                // phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                // final phoneCall = 'tel:$removeSpaceFromPhoneNumber';
                //
                // if (await launcher.canLaunch(phoneCall)) {
                //   await launcher.launch(phoneCall);
                // } else {
                //   _showDialog(
                //     context,
                //     title: 'Sorry',
                //     msg: 'please try again ',
                //   );
                // }
              },
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () async {
                // final emailAddress = 'mailto:$email';
                // if (await launcher.canLaunch(emailAddress)) {
                //   await launcher.launch(emailAddress);
                // } else {
                //   _showDialog(
                //     context,
                //     title: 'Sorry',
                //     msg: 'please try again ',
                //   );
                // }
              },
            ),
            InfoCard(
              text: url,
              icon: Icons.web,
              onPressed: () async {
                // if (await launcher.canLaunch(url)) {
                //   await launcher.launch(url);
                // } else {
                //   _showDialog(
                //     context,
                //     title: 'Sorry',
                //     msg: 'please try again ',
                //   );
                // }
              },
            ),
            InfoCard(
              text: location,
              icon: Icons.location_city,
              onPressed: () {
                print('location');
              },
            ),
          ],
        ),
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20.0,
              fontFamily: 'Source Sans Pro',
            ),
          ),
        ),
      ),
    );
  }
}
// Container(
// width: double.infinity,
// height: double.infinity,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage("images/background.jpg"),
// fit: BoxFit.cover
// ),
// ),
// child: Text('Third page'),
//
// ),
