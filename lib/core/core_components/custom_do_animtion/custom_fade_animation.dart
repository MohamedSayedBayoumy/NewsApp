// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget fadeUpToDown({required Widget child })=> FadeInDown(
    duration: const Duration(milliseconds: 1400 ),
    delay: const Duration(milliseconds: 200),
    child: child) ;

Widget fadeDownToUp({required Widget child })=> FadeInUp(
    duration: const Duration(milliseconds: 1400 ),
    delay: const Duration(milliseconds: 200),
    child: child) ;

Widget fadeElasticIn({required Widget child })=> ElasticIn(
    duration: const Duration(milliseconds: 1400 ),
    delay: const Duration(milliseconds: 200),
    child: child) ;

