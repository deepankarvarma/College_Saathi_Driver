import 'package:college_saathi/tapp_bar.dart';
import 'package:college_saathi/utils/constants/colors.dart';
import 'package:college_saathi/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme = ThemeData.light();
    final ThemeData darkTheme = ThemeData.dark();

    return Theme(
      data: lightTheme,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.teal],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                'Hi, User',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              CarouselSlider(
                options: CarouselOptions(
                  height: 165.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    // Handle carousel item change
                  },
                ),
                items: [
                  _buildCarouselItem(
                    'https://example.com/template_image1.jpg',
                    lightTheme,
                  ),
                  // Repeat the above Container for other template images
                  // Template Image 2
                  _buildCarouselItem(
                    'https://example.com/template_image2.jpg',
                    lightTheme,
                  ),
                  // Template Image 3
                  _buildCarouselItem(
                    'https://example.com/template_image3.jpg',
                    lightTheme,
                  ),
                  // Template Image 4
                  _buildCarouselItem(
                    'https://example.com/template_image4.jpg',
                    lightTheme,
                  ),
                  // Template Image 5
                  _buildCarouselItem(
                    'https://example.com/template_image5.jpg',
                    lightTheme,
                  ),
                ],
              ),
              SizedBox(height: 16),
              // 1*3 Grid
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem('Important Contacts', lightTheme),
                  _buildGridItem('College Events', lightTheme),
                  _buildGridItem('Book Ride', lightTheme),
                  _buildGridItem('Vendor Details', lightTheme),
                  _buildGridItem('My Account', lightTheme),
                  _buildGridItem('Finder', lightTheme),
                ],
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.2, // Adjusted aspect ratio for reduced height
              ),
              SizedBox(height: 16),
              // From and To Text Inputs
              Row(
                children: [
                  Expanded(
                    child: _buildInputContainer('From', lightTheme),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildInputContainer('To', lightTheme),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Book Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Book button press
                    },
                    child: Text('Book'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, ThemeData theme) {
    return InkWell(
      onTap: () {
        // Handle grid item press
        // You can navigate to the respective page based on the title
      },
      child: Card(
        color: theme.cardColor,
        elevation: 3,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildInputContainer(String hintText, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color:  Color.fromARGB(255, 61, 60, 60),
          width: 1.0,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
        ),
      ),
    );
  }
}
