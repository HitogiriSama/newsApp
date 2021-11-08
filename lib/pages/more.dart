import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('More', style: TextStyle(fontSize: 30, fontFamily: 'Poppins', color: Colors.white),),
        elevation: 0,

      ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            highlightColor: Colors.purple.shade300,
            onTap: () async {
              final weburl = 'https://www.howwebiz.ug';
              if (await canLaunch(weburl)) {
                await launch(weburl,
                  forceSafariVC: false,
                );}},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Icon (Icons.circle),
                Text('WEBSITE',style: TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white,fontWeight: FontWeight.bold)),

              ],),
          ),
          Divider(thickness: 1,color: Colors.white38,height: 20 ),
          InkWell(
            highlightColor: Colors.red,
            onTap: () async {
              final Hoturl = 'https://www.howwebiz.ug/hot100';
              if (await canLaunch(Hoturl)) {
                await launch(Hoturl,
                  forceSafariVC: false,
                );}},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Icon (Icons.circle),
                Text('HOT 100',style: TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white,fontWeight: FontWeight.bold)),
                          ],),
          ),

          Divider(thickness: 1,color: Colors.white38, height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Icon (Icons.circle),
              Text('EMAIL: howwebiz@gmail.com',style: TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white,fontWeight: FontWeight.bold)),
            ],),
          Divider(thickness: 1,color: Colors.white38,height: 20, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Icon (Icons.circle),
              Text('FOLLOW US;',style: TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.bold)),
            ],),
          SizedBox(height: 5,),
          Column(
            children: [
              InkWell(
                splashColor: Colors.red,
                onTap: () async {
                  final fburl = 'https://www.facebook.com/howwe.biz/';
                  if (await canLaunch(fburl)) {
                    await launch(fburl,
                      forceSafariVC: false,
                    );}},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      color: Colors.blue.shade900,
                      icon: FaIcon(FontAwesomeIcons.facebook, size: 35, ),
                      onPressed: (){}
                    ),

                    Text('Facebook',style: TextStyle(fontSize: 18, fontFamily: 'Poppins', color: Colors.white)),
                  ],),
              ),
              SizedBox(height: 5,),
              InkWell(
                splashColor: Colors.red,
                onTap: () async {
                  final twiurl = 'https://twitter.com/HowweEnt';
                  if (await canLaunch(twiurl)) {
                    await launch(twiurl,
                      forceSafariVC: false,
                    );}},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      color: Colors.blue.shade500,
                      icon: FaIcon(FontAwesomeIcons.twitter, size: 35, ),
                      onPressed: (){}
                    ),

                    Text('Twitter',style: TextStyle(fontSize: 18, fontFamily: 'Poppins', color: Colors.white)),
                  ],),
              ),
              SizedBox(height: 5,),
              InkWell(
              splashColor: Colors.red,
              onTap:() async {
                  final instaurl = 'https://www.instagram.com/howwe.biz/';
                  if (await canLaunch(instaurl)) {
                  await launch(instaurl,
                  forceSafariVC: false,
                  );}},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      color: Colors.blue.shade900,
                      icon: FaIcon(FontAwesomeIcons.instagram, size: 35, ),
                      onPressed: (){}
                    ),

                    Text('Instagram',style: TextStyle(fontSize: 18, fontFamily: 'Poppins', color: Colors.white)),
                  ],),
              ),
            ],
          ),

        ],
      ),
    ),
    );
  }
}
