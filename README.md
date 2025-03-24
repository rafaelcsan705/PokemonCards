# PokémonCards

Aplicação iOS desenvolvida como parte do desafio técnico para a empresa **Arcane Tinmen**. 
O projeto consiste numa pequena app onde é possível pesquisar cartas de Pokémon e consultar os seus detalhes, utilizando a [API TCGDex](https://tcgdex.dev/) apenas com chamadas via cURL (sem uso do SDK oficial).

---

## ✨ Objetivo
Este desafio serviu como oportunidade para demonstrar as minhas capacidades técnicas como iOS Developer, com foco em:
- **SwiftUI** e construção de UI declarativa
- Organização de código e separação de responsabilidades (MVVM)
- Comunicação com APIs REST
- Estruturação profissional de um projeto iOS moderno

---

## ⚙️ Decisões técnicas
- Desenvolvido com **Swift 5.9** e **SwiftUI** (sem UIKit)
- Arquitetura **MVVM**, simples e funcional
- Rede feita com **URLSession** usando `async/await`
- Rejeitei o uso de Combine ou bibliotecas externas para manter o projeto simples, focado e com zero dependências externas (exceto `ViewInspector` para testes de UI, caso fosse necessário)
- Internacionalização com `Localizable.strings` (Português e Inglês)
- Estrutura modularizada em pastas por responsabilidade: Models, Services, ViewModels, Views, Components, etc.
- Adotei gradientes e sombras para uma UI temática, alinhada com o universo Pokémon

---

## 📱 Funcionalidades
- Lista de cartas Pokémon, com imagens e nomes
- Busca dinâmica por nome
- Navegação para uma tela de detalhes
- Visualização completa da carta com ataques, tipo, raridade, fraquezas, set, etc.
- Cores e backgrounds adaptados ao tipo do Pokémon
- Splash screen com carregamento inicial
- Barra de HP visual com base no valor da carta

---

## 🧪 Testes unitários
Implementei testes nos principais pontos de lógica:
- `CardServiceTests`: validação das respostas e tratamento de erros
- `CardListViewModelTests`: filtro de busca e carregamento de cartas
- `CardDetailViewModelTests`: carregamento e validação de detalhes da carta

Utilizei mocks manuais, sem bibliotecas externas, para simular respostas da API.

---

## 🗂️ Estrutura de pastas
```
PokemonCards/
├── Extensions/
│   └── String+ImageURL
├── Helpers/
│   └── UIHelper
├── Models/
│   └── PokemonCardDetail
│   └── PokemonCardListItem
├── Networking/
│   └── APIConstants
│   └── CardService
│   └── NetworkError
│   └── NetworkService
├── Resources/
│   ├── Assets.xcassets
│   └── Localizable.strings (pt-PT, en)
│   └── StringConstants
├── Styles/
│   └── AppColors
│   └── SizeConstants
├── ViewModels/
│   └── CardDetailViewModel
│   └── CardListViewModel
├── Views/
│   └── CardDetails
│   │   └── CardDetailView
│   │   └── CardAttackListView
│   │   └── CardIllustrator
│   │   └── CardMainInfoView
│   │   └── CardSetView
│   │   └── CardVariantsView
│   │   └── CardWeaknessView
│   │   └── TryAgainCardDetail
│   └── CardList
│   │   └── CardGridItemView
│   │   └── CardImageView
│   │   └── CardListView
│   └── Designables
│   │   └── HPBarView
│   └── SplashScreen
├── Tests/
│   └── Mocks
│   │   └── MockCardListItem
│   │   └── CardServiceTests
│   │   └── MockNetworkService
│   └── ViewModelTests
│   │   └── CardDetailViewModelTests
│   │   └── CardListViewModelTests
│   └── PokemonCardsApp


---

## 🤝 Considerações finais
Este projeto foi uma ótima oportunidade para mostrar como organizo e penso numa aplicação iOS de forma modular e escalável. 
Optei por não adicionar complexidade desnecessária e focar no essencial: clareza, performance e usabilidade.

Queria ter adicionado algumas animações e uma melhor apresentação na lista inicial mas preferi focar na performance e na detail view.
Ainda queria ter adicionado mais testes unitários mas assim dá para ter uma noção de alguns testes.

Queria ter adicionado comentários para que seja de facil leitura mas acabei por não conseguir.
Espero que esteja compreensível e do vosso agrado porque quero mesmo ficar com esta vaga e trabalhar neste projecto.

Obrigado por esta oportunidade!

Rafael Santos

