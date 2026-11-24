enum Categoria{
  software,
  marketing,
  producaoDeConteudo,
}

class ItemCatalogo {
  final String nome, descricao;
  final Categoria categoria;

  ItemCatalogo({required this.nome, required this.descricao, required this.categoria});
}