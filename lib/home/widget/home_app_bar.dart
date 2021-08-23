import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notes/login/models/user_model.dart';

class HomeAppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTap;
  HomeAppBarWidget({
    required this.user,
    required this.onTap,
  }) : super(
          preferredSize: Size.fromHeight(128),
          child: SafeArea(
            child: Container(
              height: 128,
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            user.photoUrl!,
                            width: 48,
                            height: 48,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Olá, ',
                            children: [
                              TextSpan(
                                text: user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Color(0xFFF5F5F5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
}
