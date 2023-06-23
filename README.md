# Aplicativo PilatesPro
Este é um aplicativo de pilates na linguagem Dart junto com o framework Flutter, o qual foi desenvolvido para as disciplinas de Programação Orientada a Objetos e Biomecânica.

## Descrição
O aplicativo consiste de uma tela de login com campos para o email e senha do usuário, uma tela principal com opções de exercícios de pilates e uma última tela onde será gerado gráficos em tempo real. Os dados do gráfico estarão disponíveis em um banco de dados Firebase.

## Recursos Utilizados
- Flutter SDK
- Firebase Realtime Database
- Pacotes utilizados: `firebase_core`, `firebase_database`, `fl_chart`, `flutter_svg`, `google_fonts`

## Estrutura do Projeto

- `lib/`
  - `screens/`
    - `chart_screen.dart`: Implementação da tela do gráfico do aplicativo.
    - `home_screen.dart`: Implementação da tela principal do aplicativo.
    - `login_screen.dart`: Implementação da tela de login.
  - `widgets/`
    - `force_chart.dart`: Implementação do gráfico.
    - `info_card.dart`: Implementação dos blocos de exercícios.
    - `line_plot.dart`: Implemntação das linhas dos blocos.
  - `constants.dart`: Definição de constantes utilizadas no aplicativo.
  - `firebase_options.dart`: Configuração das opções de conexão com o Firebase.
  - `main.dart`: Ponto de entrada do aplicativo.

