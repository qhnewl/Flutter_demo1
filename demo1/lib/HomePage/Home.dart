import 'package:flutter/material.dart';
import 'package:demo1/HomePage/ProductDetailPage.dart';


void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Tab1Page(),
    Tab2Page(),
    Tab3Page(),
  ];

  final List<IconData> _selectedTabIcons = [
    Icons.home,
    Icons.favorite,
    Icons.person,
  ];

  final List<IconData> _unselectedTabIcons = [
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: _tabs[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0
                ? _selectedTabIcons[0]
                : _unselectedTabIcons[0]),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 1
                ? _selectedTabIcons[1]
                : _unselectedTabIcons[1]),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 2
                ? _selectedTabIcons[2]
                : _unselectedTabIcons[2]),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        _buildHeader(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Cây trồng',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF000000),
            ),
          ),
        ),
        _buildProductColumns(context),
        SizedBox(height: 16),
        _buildSeeMoreButton('Xem thêm Cây trồng'),
        // -------------------------------------------------------------------------------
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Chậu cây trồng',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF000000),
            ),
          ),
        ),
        _buildProductColumns2(context),
        SizedBox(height: 16),
        _buildSeeMoreButton('Xem thêm  phụ kiện'),

        // -------------------------------------------------------------------------------
        Padding(
            padding: const EdgeInsets.all(16.0),
        child: Text(
            'Combo chăm sóc (mới)',
            style: TextStyle(
            fontSize: 22,
            color: Color(0xFF000000),
        ),
        ),
        ),
        _buildRoundedCard('Lemon Balm Grow Kit'),
      ],

    );


  }

  Widget _buildHeader() {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 223,
                  height: 77,
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Planta - toả sáng không gian nhà bạn",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(33, 30, 30, 1),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                    onPressed: () {
                      // Handle cart icon click
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            top: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Xem hàng mới về  ✈︎',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00753A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductColumns(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Spider Plant', 'Ưa bóng', '250.000đ'),
            ),
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Song of India', 'Ưa sáng', '250.000đ'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Product 1', 'Ưa bóng', '150.000đ'),
            ),
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Product 2', 'Ưa sáng', '200.000đ'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Product 3', 'Ưa sáng', '200.000đ'),
            ),
            Expanded(
              child: _buildProductItem(context, 'assets/images/3.png',
                  'Product 4', 'Ưa sáng', '200.000đ'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, String imageAsset, String name,
      String light, String price) {
    return GestureDetector(
        onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(productName: name),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageAsset,
              width: MediaQuery.of(context).size.width * 0.35),
          SizedBox(height: 12),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(light),
          SizedBox(height: 8),
          Text(price,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    ),
    );
  }

  Widget _buildProductItem2(BuildContext context, String imageAsset, String name,
      String price) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(productName: name),
            ),
          );
        },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageAsset,
              width: MediaQuery.of(context).size.width * 0.35),
          SizedBox(height: 12),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          SizedBox(height: 8),
          Text(price,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    ),
    );
  }

  Widget _buildProductColumns2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
            Expanded(
              child: _buildProductItem2(context, 'assets/images/5.png',
                  'Planta Trắng', '250.000đ'),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }


  }

  Widget _buildSeeMoreButton(String title) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle button click
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF00753A),
          padding: EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

Widget _buildRoundedCard(String title) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 8),
                Text('Gồm: hạt giống Lemon Balm, gói đất hữu cơ, chậu Planta, marker đánh dấu...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5A5959),

                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10), // Add space between text and image
        Container(
          width: 108,
          height: 134,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), // Bo tròn góc phải trên
              bottomRight: Radius.circular(16), // Bo tròn góc phải dưới
            ),
          ),
          child: ClipRRect( // Use ClipRRect to clip the image with rounded corners
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), // Bo tròn góc phải trên
              bottomRight: Radius.circular(16), // Bo tròn góc phải dưới
            ),
            child: Image.asset(
              'assets/images/6.png',
              width: 108,
              height: 134,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}







class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 2 Content'),
    );
  }
}

class Tab3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 3 Content'),
    );
  }
}
