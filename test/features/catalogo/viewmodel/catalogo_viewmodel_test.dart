import 'package:flutter_test/flutter_test.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/model/item_catalogo.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/repository/catalogo_repository.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/viewmodel/catalogo_viewmodel.dart';

void main () {
  test('Descrição teste: ', (){
  final repository = CatalogoRepository();
  final viewModel = CatalogoViewModel(repository);
  int notificacoes = 0;
  
  viewModel.addListener(() {
    notificacoes++;
  });

  final item = ItemCatalogo(
    nome: "Site institucional", 
    descricao: "Site criado para capicatação do membros e para divulgar informações da marca", 
    categoria: Categoria.software);

  viewModel.adicionar(item);

  expect(viewModel.itens.length, 1);
  expect(notificacoes, 1);
});

test('Teste de remoção no viewmodel', (){

final repository = CatalogoRepository();
  final viewModel = CatalogoViewModel(repository);
  int notificacoes = 0;
  
  viewModel.addListener(() {
    notificacoes++;
  });

  final item = ItemCatalogo(
    nome: "Site institucional", 
    descricao: "Site criado para capicatação do membros e para divulgar informações da marca", 
    categoria: Categoria.software);

  viewModel.adicionar(item);
  viewModel.remover(item);

  expect(viewModel.itens.isEmpty, true);
  expect(notificacoes, 2);
});
}