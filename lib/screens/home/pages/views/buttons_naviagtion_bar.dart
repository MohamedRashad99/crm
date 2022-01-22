import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsBar{
  List<BottomNavigationBarItem> itemsBar =const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications_none_outlined),
        label: 'اشعارات'),
    BottomNavigationBarItem(
        icon: Icon(Icons.flag_outlined), label: 'المهام'),
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today_outlined), label: 'التقويم'),
    BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined), label: 'بحث'),
  ];
}