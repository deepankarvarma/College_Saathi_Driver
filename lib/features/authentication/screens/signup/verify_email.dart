import 'package:college_saathi/features/authentication/screens/login/login.dart';
import 'package:college_saathi/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget{
    const VerifyEmailScreen({super.key});
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                actions: [
                    IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
                ]
            ),
            body: const SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                        children: [
                            Image(image: AssetImage(TImages.acerlogo))
                        ],
                    ),
                ),
            ),
        );
    }
}



