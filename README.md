# Inove Jr. - Portfólio Pocket

Catálogo de Serviços e Portfólio Pocket da empresa júnior **Inove Jr.**, desenvolvido em **Flutter** com foco em organização modular, código limpo e facilidade de manutenção colaborativa.

---

## Tecnologias e Pacotes

- **Flutter & Dart** (Material 3)
- **Gerenciamento de Estado Nativo:** `ChangeNotifier` + `ListenableBuilder`
- **Injeção de Dependências:** [`get_it`](https://pub.dev/packages/get_it)
- **Integração Externa (WhatsApp / Links):** [`url_launcher`](https://pub.dev/packages/url_launcher)

---

## Arquitetura (MVVM + Feature-First)

O projeto segue o padrão **MVVM (Model - View - ViewModel)** organizado por funcionalidades (**Feature-First**). A separação garante que a interface apenas exiba estados e dispare ações, enquanto toda a lógica de apresentação, filtragem e acesso a dados fica isolada e testável.

### Fluxo de Responsabilidades

```text
View (UI) ──[chama ações]──▶ ViewModel (ChangeNotifier) ──▶ Repository (IServicoRepository) ──▶ Model (ServicoModel)
   ▲                                  │
   └────[reage via ListenableBuilder]─┘
                 ▲
        Injeção via GetIt (service_locator.dart)
```

### Estrutura de Pastas

```text
├── lib/
│   ├── main.dart                                       # Inicializa o Service Locator (GetIt) e aplica o AppTheme
│   ├── core/
│   │   ├── di/
│   │   │   └── service_locator.dart                    # Registro de dependências (LazySingleton e Factory)
│   │   └── theme/
│   │       └── app_theme.dart                          # Tema Material 3 e paleta corporativa (#0A1F44 e #00B4D8)
│   └── features/
│       └── catalogo/
│           ├── model/
│           │   └── servico_model.dart                  # Modelo imutável ServicoModel
│           ├── repository/
│           │   └── servico_repository.dart             # Contrato IServicoRepository e ServicoRepositoryMock
│           ├── viewmodel/
│           │   └── catalogo_viewmodel.dart             # Estado da tela, filtros e mensagem de orçamento
│           └── view/
│               ├── catalogo_page.dart                  # Tela principal do catálogo de serviços
│               └── detalhe_servico_page.dart           # Tela de detalhes e solicitação de orçamento
└── test/
    ├── widget_test.dart                                # Testes de smoke da aplicação, tema e GetIt
    └── features/
        └── catalogo/
            └── viewmodel/
                └── catalogo_viewmodel_test.dart        # Testes unitários das regras da CatalogoViewModel
```

### Papel de Cada Camada

| Camada | Localização | Responsabilidade |
| :--- | :--- | :--- |
| **Core** | `lib/core/` | Recursos transversais do app: configuração do container `GetIt` (`service_locator.dart`) e identidade visual Material 3 (`AppTheme`). |
| **Model** | `lib/features/*/model/` | Estruturas de dados imutáveis que representam o domínio (`ServicoModel` com `id`, `titulo`, `categoria`, `prazoMedio`, `entregaveis`, `iconeNome`, etc.). |
| **Repository** | `lib/features/*/repository/` | Contrato abstrato (`IServicoRepository`) e fonte de dados (`ServicoRepositoryMock`), permitindo trocar dados mockados por API/Firebase sem impactar ViewModel ou View. |
| **ViewModel** | `lib/features/*/viewmodel/` | Estende `ChangeNotifier`, mantém os estados (`isLoading`, `servicosFiltrados`, `categoriaSelecionada`, `erroMensagem`) e expõe ações como `carregarServicos()`, `filtrarPorCategoria()` e `gerarMensagemOrcamento()`. |
| **View** | `lib/features/*/view/` | Telas e widgets responsáveis exclusivamente por renderizar a UI com base na ViewModel via `ListenableBuilder`. |

> **Registro no `GetIt`:** `IServicoRepository` é registrado como `LazySingleton` (instância única compartilhada) e `CatalogoViewModel` como `Factory` (nova instância por tela).

---

## Divisão de Papéis

| Integrante | Foco Principal | Responsabilidades no Projeto |
| :--- | :--- | :--- |
| **Vitor Santos** ([@VitorWs](https://github.com/VitorWs)) | **Arquitetura, Core & Regras de Negócio (MVVM / Dados)** | • Setup inicial do projeto Flutter, configuração do Git Flow e estruturação **MVVM + Feature-First**.<br>• Camada `core`: paleta e tema corporativo Material 3 (`AppTheme`) e container de injeção de dependências (`GetIt` em `service_locator.dart`).<br>• Camada de dados e regras de negócio da feature `catalogo`: `ServicoModel`, contrato `IServicoRepository`, `ServicoRepositoryMock` e `CatalogoViewModel` (carregamento assíncrono, filtragem por categoria e formatação da mensagem de orçamento para WhatsApp).<br>• Esqueletos iniciais das Views e suíte de testes unitários/DI. |
| **Tauã** ([@Taua-Oliveira](https://github.com/Taua-Oliveira)) | **Interface de Usuário (UI/UX), Telas & Integração Visual** | • Implementação das telas principais da feature `catalogo`: `CatalogoPage` (listagem de serviços, chips de filtro por categoria e estados de carregamento/erro) e `DetalheServicoPage` (detalhes do serviço, lista de entregáveis, prazo médio e solicitação de orçamento).<br>• Integração reativa das Views com a `CatalogoViewModel` usando `getIt<CatalogoViewModel>()` e `ListenableBuilder`.<br>• Integração do fluxo de envio de orçamento via WhatsApp consumindo `gerarMensagemOrcamento(...)` com o pacote `url_launcher`.<br>• Componentização visual e fidelidade ao `AppTheme` (Material 3). |

---

## Fluxo de Trabalho com Git

- `main`: branch principal estável (produção / entregas consolidadas).
- `develop`: branch de integração das novas funcionalidades da equipe.
- `feature/*`: branches criadas a partir da `develop` para cada tarefa ou tela (ex.: `feature/arquitetura-mvvm`, `feature/telas-principais`).

---

## Como Executar Localmente

```bash
# 1. Instalar as dependências
flutter pub get

# 2. Executar o aplicativo
flutter run

# 3. Rodar análise estática e testes
flutter analyze
flutter test
```
