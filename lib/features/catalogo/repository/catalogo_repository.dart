import "../model/item_catalogo.dart";

class CatalogoRepository {
  
  List<ItemCatalogo> _lista = [];

  void adicionar(ItemCatalogo item){
    _lista.add(item);
  }

  void remover(ItemCatalogo item){
    _lista.remove(item);
  }

  List<ItemCatalogo> listar (){
    return List.unmodifiable(_lista); //Segurança, impede que outro método modifique a lista
  }

}