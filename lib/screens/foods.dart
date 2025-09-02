import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar2.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JPAppBar2(title: "Food & Drink"),
            const SizedBox(height: 30),

            // Category Tabs
            _selectTabs(),
            const SizedBox(height: 12),

            // Food Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260, // control card height
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return _foodCard(
                    item['image']!,
                    item['title']!,
                    item['price']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Tabs
  Widget _selectTabs() {
    return Row(
      children: [
        _arrowButton(Icons.chevron_left),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _selectTab("ALL", true),
                _selectTab("Promotions", false),
                _selectTab("Combos", false),
                _selectTab("Beverages", false),
                _selectTab("Popcorn", false),
                _selectTab("Packaged Drinks", false),
                _selectTab("Confectionery", false),
                _selectTab("Chips", false),
                _selectTab("Ice cream", false),
              ],
            ),
          ),
        ),
        _arrowButton(Icons.chevron_right),
      ],
    );
  }

  Widget _selectTab(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppColours.gold : const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColours.black : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon) {
    return Container(
      color: AppColours.gold,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Icon(icon, color: AppColours.black, size: 22),
    );
  }

  // Food Item Card
  Widget _foodCard(String image, String title, String price) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with "Seasonal Favorite"
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.asset(
                  image,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Seasonal Favorite",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),

          // Order Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColours.gold, width: 1.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "ORDER NOW",
                style: TextStyle(
                  color: AppColours.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Sample food list
final List<Map<String, String>> foodItems = [
  {
    "image": "assets/images/food1.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food2.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food3.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food4.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food5.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food6.png",
    "title": "Chocolate Caramel Popcorn Delight",
    "price": "LKR 1,200.00",
  },
];
