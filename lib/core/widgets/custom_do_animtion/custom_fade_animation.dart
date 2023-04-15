// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget fadeDownTOUp({required Widget child}) => FadeInDown(
    duration: const Duration(milliseconds: 1400),
    delay: const Duration(milliseconds: 200),
    child: child);

Widget fadeUpToDown({required Widget child}) => FadeInUp(
    duration: const Duration(milliseconds: 1400),
    delay: const Duration(milliseconds: 200),
    child: child);

Widget fadeElasticIn({required Widget child}) => ElasticIn(
    duration: const Duration(milliseconds: 1400),
    delay: const Duration(milliseconds: 200),
    child: child);

Widget fadeOutLeft({required Widget child}) => FadeInLeft(
    duration: const Duration(milliseconds: 1000),
    delay: const Duration(milliseconds: 100),
    child: child);
