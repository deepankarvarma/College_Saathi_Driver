import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme = ThemeData.light();

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
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    // Handle carousel item change
                  },
                ),
                items: [
                  _buildCarouselItem(
                    'https://www.collegebatch.com/static/clg-gallery/thapar-institute-of-engineering-technology-patiala-214568.jpg',
                    lightTheme,
                  ),
                  _buildCarouselItem(
                    'https://lmtsm.thapar.edu/assets/front/img/glogiftbanner.jpg',
                    lightTheme,
                  ),
                  _buildCarouselItem(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnS-bNnBZKHaHnP8b9n9SFZqURVVWB2fe2KA&usqp=CAU',
                    lightTheme,
                  ),
                  _buildCarouselItem(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTifVGJefJXoUqcR0P4quZ3Zh1uxJQHweauKA&usqp=CAU',
                    lightTheme,
                  ),
                  _buildCarouselItem(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnPM5r9G6EgoTiAItUzU6sJeYlmIjX2XdOGA&usqp=CAU',
                    lightTheme,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(0),
                  _buildDot(1),
                  _buildDot(2),
                  _buildDot(3),
                  _buildDot(4),
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

  Widget _buildDot(int index) {
    // Customize your dot appearance here
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey, // Fixed color for all dots
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
