import 'dart:developer';

import 'package:framework/core/entities/product.dart';

class ApiHelper {
  ApiHelper._privateConstructor();
  static final ApiHelper instance = ApiHelper._privateConstructor();

  List<Product> storeProducts() {
    List<Product> products = [];

    List<Map<String, dynamic>> responseMap = [
      {
        'id': 1,
        'nome': 'Pêra',
        'imagem': 'assets/img/fruits/pera.jpg',
        'preco': '2,00',
      },
      {
        'id': 2,
        'nome': 'Maça',
        'imagem': 'assets/img/fruits/maca.jpg',
        'preco': '3,00',
      },
      {
        'id': 4,
        'nome': 'Banana',
        'imagem': 'assets/img/fruits/banana.jpeg',
        'preco': '4,00',
      },
      {
        'id': 5,
        'nome': 'Manga',
        'imagem': 'assets/img/fruits/manga.jpg',
        'preco': '2,50',
      },
      {
        'id': 6,
        'nome': 'Abacaxi',
        'imagem': 'assets/img/fruits/abacaxi.jpg',
        'preco': '5,00',
      },
    ];

    if (responseMap.isNotEmpty) {
      try {
        for (Map<String, dynamic> data in responseMap) {
          products.add(
            Product(id: data['id'], image: data['imagem'], name: data['nome'], price: data['preco']),
          );
        }
      } catch (error) {
        log('Erro nos dados da API', name: 'ApiHelper: storeProducts');
        return products;
      }

      return products;
    } else {
      log('Erro ao buscar dados da API', name: 'ApiHelper: storeProducts');
      return products;
    }
  }
}
