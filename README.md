# magdsoft

This project is powered by Flutter **>=2.8.0** and Dart **>=2.17.0-0 <3.0.**.


Bloc ([flutter_bloc](https://pub.dev/packages/flutter_bloc)) is used as an approach to state management, more precisely Cubit over Bloc from the same package. Bloc/Cubit handles `Events` and changes `States`. Screens and Widgtes subscribe to Bloc changes and send events (for Cubit, this is a direct method call).

#Screen Record



https://user-images.githubusercontent.com/33372890/197393082-890d14cb-9187-4c38-9826-c2438cd515ed.mp4



#ScreenShot


<img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392200-dba442b3-a601-483d-80f1-fdb516fa3e38.jpg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392203-a54af52b-edf1-4ec3-a17d-a357e1f8b7e4.jpg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392208-4e62f8b3-e400-4f22-b420-79be11512452.jpg"><img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392210-bd3e0755-b692-4c57-9e77-f2337f35524d.jpg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392213-b7f96d80-6f5b-4bcb-ab1b-2fdb64dae735.jpg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392221-5392f65f-270f-46fc-bb12-7bafcb549482.jpg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/197392227-3c158922-2fa2-45f9-bec7-b447bb4662d8.jpg">


The main packages used in the project:
```yaml
  dio: ^4.0.6
  bloc: ^8.0.3
  flutter_bloc: ^8.0.1
  shared_preferences: ^2.0.15
  flutter_localizations:
    sdk: flutter
  flutter_translate: ^4.0.2
  fluttertoast: ^8.0.9
  sizer: ^2.0.15
  flutter_svg_provider: ^1.0.3
```

## Project structure <a name="structure"></a>
|   |   |
|---|---|
|*main.dart*|The entry point to the application. Here is the initialization of DioHelper, CacheHelper and registration of common Blocs and Sizer that are used throughout the application.|
|*business_logic/*|Global Cubit and Bloc Observer.|
|*constants/*|All constants in the application.|
|*data/*|Model classes used in the application and data providers (local and remote) network(requests, responses).|
|*presentation/*|All UI elements used in the application.|
|---|---|
|*presentation/router/*|Registration of all routes in application.|
|*presentation/screens/*|Application screens and Cubit.|
|*presentation/styles/*|Constants for UI such as colors, fonts, styles.|
|*presentation/view/*|Special UI elements of application.|
|*presentation/widgets/*|Common UI elements.|
|---|---|



