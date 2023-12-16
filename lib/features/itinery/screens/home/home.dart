// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentCarouselIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData lightTheme = ThemeData.light();

//     return Theme(
//       data: lightTheme,
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.blue, Colors.teal],
//             ),
//           ),
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 80),
//               Text(
//                 'Hi, User',
//                 style: TextStyle(fontSize: 18),
//               ),
//               SizedBox(height: 16),
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: 200.0,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   aspectRatio: 2.0,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentCarouselIndex = index;
//                     });
//                   },
//                 ),
//                 items: [
//                   _buildCarouselItem(
//                     'https://www.collegebatch.com/static/clg-gallery/thapar-institute-of-engineering-technology-patiala-214568.jpg',
//                     lightTheme,
//                   ),
//                   _buildCarouselItem(
//                     'https://lmtsm.thapar.edu/assets/front/img/glogiftbanner.jpg',
//                     lightTheme,
//                   ),
//                   _buildCarouselItem(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnS-bNnBZKHaHnP8b9n9SFZqURVVWB2fe2KA&usqp=CAU',
//                     lightTheme,
//                   ),
//                   _buildCarouselItem(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTifVGJefJXoUqcR0P4quZ3Zh1uxJQHweauKA&usqp=CAU',
//                     lightTheme,
//                   ),
//                   _buildCarouselItem(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnPM5r9G6EgoTiAItUzU6sJeYlmIjX2XdOGA&usqp=CAU',
//                     lightTheme,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   5,
//                   (index) => _buildDot(index),
//                 ),
//               ),
//               SizedBox(height: 16),
//               // 1*3 Grid
//               GridView.count(
//                 crossAxisCount: 3,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   _buildGridItem('Important Contacts', lightTheme),
//                   _buildGridItem('College Events', lightTheme),
//                   _buildGridItem('Book Ride', lightTheme),
//                   _buildGridItem('Vendor Details', lightTheme),
//                   _buildGridItem('My Account', lightTheme),
//                   _buildGridItem('Finder', lightTheme),
//                 ],
//                 mainAxisSpacing: 16.0,
//                 crossAxisSpacing: 16.0,
//                 childAspectRatio: 1.2, // Adjusted aspect ratio for reduced height
//               ),
//               SizedBox(height: 16),
//               // From and To Text Inputs
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildInputContainer('From', lightTheme),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: _buildInputContainer('To', lightTheme),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Book Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Book button press
//                     },
//                     child: Text('Book'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCarouselItem(String imageUrl, ThemeData theme) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.0),
//         boxShadow: [
//           BoxShadow(
//             color: theme.shadowColor.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Widget _buildGridItem(String title, ThemeData theme) {
//     return InkWell(
//       onTap: () {
//         // Handle grid item press
//         // You can navigate to the respective page based on the title
//       },
//       child: Card(
//         color: theme.cardColor,
//         elevation: 3,
//         child: Center(
//           child: Text(
//             title,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputContainer(String hintText, ThemeData theme) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         boxShadow: [
//           BoxShadow(
//             color: theme.shadowColor.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: Offset(0, 2),
//           ),
//         ],
//         border: Border.all(
//           color:  Color.fromARGB(255, 61, 60, 60),
//           width: 1.0,
//         ),
//       ),
//       child: TextFormField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: hintText,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//           filled: true,
//           fillColor: theme.inputDecorationTheme.fillColor,
//         ),
//       ),
//     );
//   }

//   Widget _buildDot(int index) {
//     // Customize your dot appearance here
//     return Container(
//       width: 8,
//       height: 8,
//       margin: EdgeInsets.symmetric(horizontal: 4),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: index == _currentCarouselIndex ? Colors.white : Colors.grey,
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }
import 'package:college_saathi/features/personalization/controllers/home_controller.dart';
import 'package:college_saathi/tapp_bar.dart';
import 'package:college_saathi/utils/constants/sizes.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:college_saathi/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                key: controller.homeFormKey,
                child: Column(
                  children: [
                    // First and Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.from,
                            validator: (value) => TValidator.validateEmptyText(
                                'Source', value),
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.source,
                              prefixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.to,
                            validator: (value) => TValidator.validateEmptyText(
                                'Destination', value),
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.destination,
                              prefixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.makeRequest(),
                        child: const Text(TTexts.bookinit),
                      ),
                    )
                  ],
                ),
              ),
              
              ],
            ),
        ),
      ),
    );
  }
}