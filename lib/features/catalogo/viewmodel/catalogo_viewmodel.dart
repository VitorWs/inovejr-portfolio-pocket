import 'package:flutter/foundation.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/repository/catalogo_repository.dart';
import 'package:inovejr_portfolio_pocket/features/catalogo/model/item_catalogo.dart';

class CatalogoViewModel extends ChangeNotifier{

  final CatalogoRepository _repository;

  CatalogoViewModel(this._repository);

  List<ItemCatalogo> get itens => _repository.listar();

  void adicionar(ItemCatalogo item) {
    _repository.adicionar(item);
    notifyListeners();
  }

  void remover(ItemCatalogo item) {
    _repository.remover(item);
    notifyListeners();
  }
}