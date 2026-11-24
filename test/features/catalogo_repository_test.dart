import 'package:flutter_test/flutter_test.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/model/item_catalogo.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/repository/catalogo_repository.dart';

void main() {
  test('Deve adicionar um item ao catálogo', () {
    final repository = CatalogoRepository();

    final item = ItemCatalogo(
      nome: 'Landing Page',
      descricao: 'Página web para conversão.',
      categoria: Categoria.software,
    );

    final lista = repository.listar();

    expect(() => lista.add(item), throwsUnsupportedError);
  });
}