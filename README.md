# 🌿 RedeVerde - Foto Lugares

`RedeVerde` (anteriormente Foto-Lugares) é um aplicativo de prova de conceito em Flutter focado em cultivo colaborativo. Ele permite que usuários (jardineiros) descubram, salvem e compartilhem seus locais favoritos de jardinagem, hortas comunitárias e achados botânicos.

## 📸 Telas do Aplicativo

| Tela Principal (Lista) | Tela de Formulário |
| :---: | :---: |
|  |  |

## ✨ Funcionalidades Principais

  * **Listar Locais:** Exibe todos os locais salvos em uma lista na tela inicial, com imagem, título, nota, endereço e coordenadas.
  * **Adicionar Novos Locais:** Um formulário completo para registrar novos "achados".
  * **Captura de Mídia:** Permite ao usuário tirar uma foto com a **Câmera** ou escolher uma imagem da **Galeria**.
  * **Geolocalização:** Captura as coordenadas exatas (Latitude e Longitude) do usuário no momento do cadastro usando o GPS do dispositivo.
  * **Endereço Manual:** Campos para inserir Título, Nota, Nome da Rua, Número e CEP.
  * **Compartilhamento Nativo:** Cada item da lista possui um botão para compartilhar os detalhes do local (título, nota, endereço) em outros aplicativos (ex: WhatsApp, redes sociais).

## 🚀 Tecnologias Utilizadas

O projeto foi construído inteiramente em Flutter e utiliza os seguintes pacotes principais:

  * **[Provider](https://pub.dev/packages/provider):** Para gerenciamento de estado.
  * **[image\_picker](https://pub.dev/packages/image_picker):** Para acessar a câmera e a galeria de fotos.
  * **[location](https://pub.dev/packages/location):** Para obter os dados de GPS e localização do dispositivo.
  * **[share\_plus](https://pub.dev/packages/share_plus):** Para implementar a funcionalidade de compartilhamento nativo.

## 🔧 Instalação e Execução

### 1\. Pré-requisitos

  * Você precisa ter o [SDK do Flutter](https://flutter.dev/docs/get-started/install) instalado.
  * Um emulador Android/iOS ou um dispositivo físico.

### 2\. Clonar e Instalar

```bash
# 1. Clone o repositório (ou apenas tenha a pasta do projeto)
# git clone https://github.com/seu-usuario/redeverde.git
# cd redeverde

# 2. Instale todas as dependências do projeto
flutter pub get
```

### 3\. Configuração de Permissões (Obrigatório\!)

Este aplicativo **não funcionará** sem as permissões corretas. Você deve editar os arquivos nativos:

#### Para Android (`android/app/src/main/AndroidManifest.xml`)

Adicione as seguintes linhas dentro da tag `<manifest>`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### Para iOS (`ios/Runner/Info.plist`)

Adicione as seguintes chaves ao dicionário principal:

```xml
<key>NSCameraUsageDescription</key>
<string>Este app precisa de acesso à câmera para tirar fotos dos locais.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Este app precisa de acesso à galeria para selecionar fotos dos locais.</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Este app precisa de acesso à sua localização para salvar o local.</string>
```

### 4\. Executar o Aplicativo

```bash
# Execute o aplicativo
flutter run
```