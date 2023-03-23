# maps_google

Um projeto que exemplifica o uso do google maps dentro de um aplicativo flutter.

#### Início

Antes de tudo, adicione algumas depedências no seu arquivo `pubspec.yaml`

#### Dependências

- [`geolocator`](https://pub.dev/packages/geolocator)

Recupera as posições geográficas do usuário
- [`get`](https://pub.dev/packages/get)

Pacote de gerência de estado, além das rotas
- [`google_maps_flutter`](https://pub.dev/packages/google_maps_flutter)

Pacote responsável pela integração do google maps no flutter

#### Mudando o sdk mínimo

O pacote `google_maps_flutter` exige que o sdk mínimo seja maior ou igual a 20. Então, entre no seu arquivo `gradle` em nível de app, localizado em `android/app/build.gradle`, procure `defaultConfig` e faça o seguinte:

troque `minSdkVersion flutter.minSdkVersion`
por `minSdkVersion 20`


#### Adicionado permissões de localização e acesso a internet

O pacote `geolocator` precisa de permissões para acessar a localização no dispositivo do usuário. Entre no seu arquivo `AndroidManifest` localizado em `android/app/src/main/AndroidManifest.xml`, e adicione 

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.INTERNET"/>
```

dentro da tag `manifest` antes da tag `application`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.example.maps_google">

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
    <uses-permission android:name="android.permission.INTERNET"/>

    <application>
    ...
    </application>
</manifest>
```

#### Adicionar API KEY do google maps

É necessário que você tenha uma API KEY do google maps. Veja o [tutorial do google](https://developers.google.com/maps/documentation/android-sdk/get-api-key?hl=pt-br#console) sobre a criação dessa chave de acesso

Agora que você possui a chave de acesso para o google maps, abra novamente seu arquivo `AndroidManifest.xml` localizado em `android/app/src/main/AndroidManifest.xml`, e adicione 
```xml
<meta-data android:name="com.google.android.geo.API_KEY" \n android:value="YOUR_API_KEY" />
```
dentro da tag `manifest` e dentro da tag `application`, deixando seu `AndroidManifest.xml` assim:

```xml
<manifest .../>

<uses-permission ... />

    <application ... >
    
        <meta-data android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_API_KEY" />
    
    ... 

    </application>
</manifest>
```

#### Usando widget do GoogleMaps no flutter

Agora, basta você chamar a classe `GoogleMap` e configurar alguns parâmetros:

- mapType

Esse parâmetro define o tipo do seu mapa, podendo ser none, `normal`, `satellite`, terrain ou hybrid. 

- zoomControlsEnabled

Adiciona controles de zoom no mapa

- initialCameraPosition

Recebe um `CameraPosition` no qual você define uma posição inicial que o mapa marcará, além de especificar também o zoom dentro dessa visualização

- onMapCreated

Quando o mapa for criado, será chamada a função que é passada para esse parâmetro

O código invocando esse mapa ficará assim:

```dart
GoogleMap(
    mapType: MapType.normal,
    zoomControlsEnabled: true,
    initialCameraPosition: CameraPosition(
    target: LatLng(0, 0),
    zoom: 20,
    ),
    onMapCreated: null,
    myLocationEnabled: true,
)
```

Veja o código completo deste repositório com um exemplo do consumo desse mapa com um `GetxController` e utilizando o pacote `geolocator` para recuperar as informações de localização do usuário. 

Veja a documentação do flutter e explore essa incrível tecnologia em sua [documentação online](https://docs.flutter.dev/).