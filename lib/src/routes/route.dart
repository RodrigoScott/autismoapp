import 'package:flutter/material.dart';
import 'package:autismoapp/src/pages/home_page.dart';
import 'package:autismoapp/src/pages/sound_page.dart';
import 'package:autismoapp/src/pages/imitate_page.dart';
import 'package:autismoapp/src/pages/discrimination_page.dart';
import 'package:autismoapp/src/pages/discrimination_images_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
  '/'                     : (BuildContext context )=>HomePage(),
  'sound'                 : (BuildContext context )=>SoundPage(),
  'imitate'               : (BuildContext context )=>ImitatePage(),
  'discrimination'        : (BuildContext context )=>DiscriminationPage(),
  'discriminationImages'  : (BuildContext context )=>DiscriminationImagesPage(),
  };
}