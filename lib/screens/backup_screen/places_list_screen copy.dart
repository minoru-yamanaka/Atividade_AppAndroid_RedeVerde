// import 'package:flutter/material.dart';
// import 'package:foto/providers/greate_places.dart';
// import 'package:foto/utils/app_routes.dart';
// import 'package:provider/provider.dart';

// class PlacesListScreen extends StatelessWidget {
//   // --- Cores Personalizadas ---
//   final Color _backgroundColor = const Color(0xFF27C5B2);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _backgroundColor,
//       appBar: AppBar(
//         title: const Text('🌿 RedeVerde - Meus Lugares'),
//         backgroundColor: _backgroundColor,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               Navigator.of(context).pushNamed(AppRoutes.placeForm);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // --- 1. Texto de Apresentação ---
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//             child: Text(
//               'Bem-vindo ao RedeVerde!\n\nDescubra, capture e compartilhe seus lugares favoritos onde a natureza floresce.🌱\nConecte-se com jardineiros da sua comunidade e ajude a espalhar o cultivo colaborativo pelo mundo.',
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           // --- 2. Divisor ---
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32.0),
//             child: Divider(color: Colors.white38),
//           ),

//           // --- 3. Lista de Lugares ---
//           Expanded(
//             child: Consumer<GreatePlaces>(
//               child: const Center(
//                 child: Text(
//                   'Nenhum local cadastrado!',
//                   style: TextStyle(color: Colors.white70, fontSize: 16),
//                 ),
//               ),
//               builder: (context, greatePlaces, ch) =>
//                   greatePlaces.itemsCount == 0
//                   ? ch!
//                   // <-- AQUELE ListTileTheme FOI REMOVIDO DAQUI -->
//                   : ListView.builder(
//                       itemCount: greatePlaces.itemsCount,
//                       itemBuilder: (context, i) {
//                         final place = greatePlaces.itemByIndex(i);

//                         // --- Lógica de Texto ---
//                         final note = place.note ?? 'Sem nota';
//                         final rua =
//                             place.location?.nomeRua ?? 'Rua não informada';
//                         final numero = place.location?.numero ?? 'S/N';
//                         final cep = place.location?.cep ?? '';

//                         String endereco = '$rua, $numero';
//                         if (cep.isNotEmpty) {
//                           endereco += ' - CEP $cep';
//                         }

//                         String coordsText = 'Coordenadas não salvas';
//                         if (place.location != null) {
//                           final lat = place.location!.latitude.toStringAsFixed(
//                             5,
//                           );
//                           final lng = place.location!.longitude.toStringAsFixed(
//                             5,
//                           );
//                           coordsText = 'Lat: $lat, Lng: $lng';
//                         }

//                         final subtitleText = '$note\n$endereco\n$coordsText';
//                         // --- Fim da Lógica de Texto ---

//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: FileImage(place.image),
//                           ),

//                           // --- AJUSTE: Estilo aplicado diretamente ---
//                           title: Text(
//                             place.title,
//                             style: const TextStyle(
//                               color: Colors.white, // Título branco
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           subtitle: Text(
//                             subtitleText,
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(
//                                 0.85,
//                               ), // Subtítulo branco
//                             ),
//                           ),

//                           // --- FIM DO AJUSTE ---
//                           isThreeLine: true,
//                           onTap: () {},
//                         );
//                       },
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
