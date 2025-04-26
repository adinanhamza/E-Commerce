import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'All',
        'image': 'https://www.macworld.com/wp-content/uploads/2021/03/apple-products-2018-100782368-orig-1.jpg?resize=2048,1366&quality=50&strip=all',
      },
      {
        'name': 'Fashion',
        'image': 'https://img.freepik.com/free-photo/smiling-attractive-woman-stylish-colorful-outfit-jumping-with-shopping-bags-pink-yellow-background-polo-neck-striped-mini-skirt-shopaholic-sale-fashion-summer-trend_285396-2421.jpg',
      },
      {
        'name': 'Phones',
        'image': 'https://i.cdn.newsbytesapp.com/images/l55920230926191935.png',
      },
      {
        'name': 'Laptops',
        'image': 'https://th.bing.com/th/id/R.3d06291b74f917da6cca8676b94c2f67?rik=dr%2fxyTPkQl%2bShw&riu=http%3a%2f%2fcdn.mos.cms.futurecdn.net%2fXRA9zN22EKkhUYrqtwXkBZ.jpg&ehk=HS%2bifYXUxcbXYlTLdegecjAK%2bWD1WGnij1LFjEbaoLM%3d&risl=&pid=ImgRaw&r=0',
      },
      {
        'name': 'Electronics',
        'image': 'https://media.istockphoto.com/id/1174598609/photo/set-of-contemporary-house-appliances-isolated-on-white.jpg?b=1&s=170667a&w=0&k=20&c=7DjQBuaZPG22Gv2Ej3A7RpBTJOq_E8vkslptetZHB-w=',
      },
      {
        'name': 'Beauty',
        'image': 'https://cdn2.stylecraze.com/wp-content/uploads/2017/08/Oriflame-Beauty-And-Skin-Care-Products-Top-15.jpg',
      },
      {
        'name': 'Home',
        'image': 'https://img.freepik.com/premium-photo/household-kitchen-appliances-table-kitchen_392895-507433.jpg',
      },
      {
        'name': 'Sports',
        'image': 'https://as1.ftcdn.net/v2/jpg/02/57/49/32/1000_F_257493248_exlhRge9HrHPAUu2d8vRGEWAaqXmTotx.jpg',
      },
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    categories[index]['image'] as String,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['name'] as String,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: isSelected ? Colors.black : Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}