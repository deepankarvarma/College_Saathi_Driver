import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

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
                  height: 165.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => _buildDot(index),
                ),
              ),
              SizedBox(height: 16),
              // 1*3 Grid
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(context, 'Important Contacts', lightTheme),
                  _buildGridItem(context, 'College Events', lightTheme),
                  _buildGridItem(context, 'Book Ride', lightTheme),
                  _buildGridItem(context, 'Vendor Details', lightTheme),
                  _buildGridItem(context, 'My Account', lightTheme),
                  _buildGridItem(context, 'Finder', lightTheme),
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

  Widget _buildGridItem(BuildContext context, String title, ThemeData theme) {
    return InkWell(
      onTap: () {
        // Handle grid item press
        // You can navigate to the respective page based on the title
        _navigateToPage(context, title);
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

  void _navigateToPage(BuildContext context, String pageTitle) {
    // Navigate to a new page based on the title
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(title: pageTitle),
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

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details for $title'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
