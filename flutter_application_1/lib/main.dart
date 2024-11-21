import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Widget> carouselItems = [
    // Primeiro item do carrossel
    Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Sombreamento abaixo
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item 1', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    ),
    // Adicione mais itens ao carrossel aqui
    Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: Text('Item 2', style: TextStyle(color: Colors.white)),
      ),
    ),
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoadorPage(carouselItems: carouselItems),
    );
  }
}

class DoadorPage extends StatelessWidget {
  final List<Widget> carouselItems;

  const DoadorPage({super.key, required this.carouselItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            './logo.png',
                            width: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0, right: 30.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30.0, top: 50.0),
                          child: Text(
                            'Olá, doador',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF06C657),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('./doador.jpeg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Carrossel de imagens
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 50.0),
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 80,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('./doador.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Carrossel com os widgets criados
              Container(
                padding: const EdgeInsets.only(top: 25.0),
                child: CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                  ),
                ),
              ),

              // Seção "Conheça mais"
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Conheça mais',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        _buildOptionCard('Psicologia', Icons.psychology),
                        _buildOptionCard('Psicopedagogia', Icons.school),
                        _buildOptionCard('Nutricionista', Icons.restaurant),
                        _buildOptionCard('Doação geral', Icons.monetization_on),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Doações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.green),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
