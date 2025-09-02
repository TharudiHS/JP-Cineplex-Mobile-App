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
                  mainAxisExtent: 290,
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
                    isFavorite: index % 2 == 0,
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
  Widget _foodCard(
    String image,
    String title,
    String price, {
    bool isFavorite = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/showtime-box-bg.png"),
          fit: BoxFit.cover,
        ),

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
          // Food Image with Badge
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
              style: TextStyles.size12Promptwhite,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(price, style: TextStyles.size14PromptLightgold),
          ),

          const Spacer(),

          // Order Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColours.grey5E, width: 1.8),
              ),
              child: Text(
                "ORDER NOW",
                style: TextStyles.size12WeightBoldConthraxSemiBoldgold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// food list
final List<Map<String, String>> foodItems = [
  {
    "image": "assets/images/food1.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food2.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food3.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food4.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food5.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
  {
    "image": "assets/images/food6.png",
    "title": "Chocolate Caramel \nPopcorn Delight",
    "price": "LKR 1,200.00",
  },
];
