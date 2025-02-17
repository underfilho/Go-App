Vídeo do app em execução pode ser visto [aqui](https://imgur.com/q5cAFTt).

# Go App - Guia de Motéis

Aplicativo Flutter replicando tela de listagem [Guia de Motéis go](https://play.google.com/store/apps/details?id=br.com.guiademoteis.go.android&hl=pt). Projeto construído utilizando conceitos de Clean Architecture, SOLID e Testes unitários.

Para requisições http foi utilizado o package [http](https://pub.dev/packages/http), para gerenciamento de estado o [BLoC/Cubit](https://pub.dev/packages/flutter_bloc) e para injeção de dependência o [get_it](https://pub.dev/packages/get_it), além do [json_serializable](https://pub.dev/packages/json_serializable) para facilitar o processo de conversão json.

No lado dos testes foram utilizados o [Mockito](https://pub.dev/packages/mockito) para mockar classes e dependências e o [bloc_test](https://pub.dev/packages/bloc_test) para testes dos cubit's.

## Build - Run

O projeto foi construído utilizando a versão 3.27.2 do Flutter.

O Mockito e o json_serializable utilizam geração de código, assim o processo para rodar o projeto é

```
flutter pub get
dart run build_runner build
flutter run
```

Para rodar os testes, execute

```
flutter test --coverage
```

## Estrutura das pastas
Dentro da pasta [lib](/lib/) temos a estrutura de pastas abaixo para organização do projeto.

```
app
└───core
│   └───errors // Classes de falha para serem utilizados no app
│   └───network // Serviços de conexão com a internet
│   └───usecases // Casos base de usecase
│   └───utils // Utilitários do app
└───data
│   └───datasources // Contrato e implementação dos datasources
│   └───models // Modelos relacionados às entidades com funcionalidades úteis
│   └───repositories // Implementação dos repositórios definidos na camada de domain
└───domain
│   └───entities // Entidades puras do domínio, objetos centrais da regra de negócio
│   └───repositories // Contratos dos repositórios e funcionalidades necessárias
│   └───usecases // Regras de negócio
└───ui
│   └───routes // Arquivos de rotas do app
│   └───theme //  Arquivos de temas, cores e fontes
│   └───widgets // Widgets globais para todo app
│   └───screens // Telas do app
│       └───example // Exemplo de tela
│           └───cubits // Cubits e states da tela
│           └───widgets // Widgets locais
│           │   example_screen.dart
│   dependencies.dart // Injeção de dependência
main.dart
```

\* Os arquivos gerados pelo build_runner estão ocultos, caso queira visualizar é possível alterar essa configuração em `/.vscode/settings.json`