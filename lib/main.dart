import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FurryFriends',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool usuarioLogueado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FURRY FRIENDS",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF602BC2),
        actions: [
          if (!usuarioLogueado) ...[
            TextButton(
              onPressed: () => _mostrarFormularioLogin(context),
              child: const Text("Iniciar Sesión",
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => _mostrarFormularioRegistro(context),
              child: const Text("Registrarse",
                  style: TextStyle(color: Colors.white)),
            ),
          ] else ...[
            PopupMenuButton<String>(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onSelected: (value) {
                if (value == 'perfil') {
                  // Lógica para ir a perfil
                } else if (value == 'ajustes') {
                  // Lógica para ir a ajustes
                }
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(value: 'perfil', child: Text('Perfil')),
                  PopupMenuItem(value: 'ajustes', child: Text('Ajustes')),
                ];
              },
            )
          ]
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF602BC2)),
              child: Text("Menú",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.group, color: Colors.deepPurple),
              title: const Text('Nosotros'),
              onTap: () {
                // Navegar a Nosotros
              },
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.deepPurple),
              title: const Text('Servicios'),
              onTap: () {
                // Navegar a Servicios
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.deepPurple),
              title: const Text('Productos'),
              onTap: () {
                // Navegar a Productos
              },
            ),
          ],
        ),
      ),
      body: const ContenidoPrincipal(),
    );
  }

  void _mostrarFormularioLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Iniciar Sesión",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(labelText: "Correo Electrónico"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Contraseña",
                      suffixIcon: Icon(Icons.visibility)),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Checkbox(value: false, onChanged: null),
                    Text("Recordar mis datos"),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Acción de iniciar sesión
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF602BC2)),
                  child: const Text("Iniciar Sesión"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("¿Olvidaste tu contraseña?"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarFormularioRegistro(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Formulario de Registro",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const Text("Información Personal",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextField(decoration: InputDecoration(labelText: "Nombre(s)")),
                const TextField(decoration: InputDecoration(labelText: "Apellido(s)")),
                const TextField(
                  decoration: InputDecoration(labelText: "Fecha de Nacimiento"),
                  keyboardType: TextInputType.datetime,
                ),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: "CC", child: Text("Cédula de Ciudadanía")),
                    DropdownMenuItem(value: "TI", child: Text("Tarjeta de Identidad")),
                    DropdownMenuItem(value: "CE", child: Text("Cédula de Extranjería")),
                    DropdownMenuItem(value: "PAS", child: Text("Pasaporte")),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(labelText: "Tipo de Documento"),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: "Número de Documento"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                const Text("Información de Contacto",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextField(
                  decoration: InputDecoration(labelText: "Teléfono"),
                  keyboardType: TextInputType.phone,
                ),
                const TextField(
                  decoration: InputDecoration(labelText: "Correo Electrónico"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const TextField(decoration: InputDecoration(labelText: "Dirección")),
                const SizedBox(height: 16),
                const Text("Datos Adicionales",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextField(
                  decoration: InputDecoration(labelText: "Contraseña"),
                  obscureText: true,
                ),
                const TextField(
                  decoration: InputDecoration(labelText: "Confirmar Contraseña"),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: "admin", child: Text("Administrador")),
                    DropdownMenuItem(value: "paseador", child: Text("Paseador")),
                    DropdownMenuItem(value: "propietario", child: Text("Propietario")),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(labelText: "Rol de Usuario"),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Checkbox(value: false, onChanged: null),
                    Expanded(child: Text("Acepto los Términos y condiciones"))
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Acción de registro
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF602BC2)),
                  child: const Text("Registrarse"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContenidoPrincipal extends StatelessWidget {
  const ContenidoPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFECE9F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bienvenido a FurryFriends',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '¡Prepárate para solicitar servicios personalizados para tu mascota!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/servicios');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF602BC2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Solicitar servicios'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          const Text('Servicios',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              servicioItem(
                context,
                'Paseo de Mascotas',
                'assets/PaseoMascotas.jpg',
                'Ofrecemos paseos diarios para que tu mascota se mantenga activa y feliz.',
                'Precio: \$15.000 COP/Paseo',
              ),
              servicioItem(
                context,
                'Guardería para Mascotas',
                'assets/GuarderiaMascota.jpg',
                'Tu mascota estará en buenas manos todo el día.',
                'Precio: \$50.000 COP/Día',
              ),
              servicioItem(
                context,
                'Cuidado y Atención Personalizada',
                'assets/atencionPersonalizadaMascota.png',
                'Cuidado individual, alimentación y atención especial.',
                'Precio: \$40.000 COP/Consulta',
              ),
            ],
          ),
          const SizedBox(height: 40),

          const Text('Catálogo de Productos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              productoItem(
                  context,
                  'Ropa para mascota',
                  'assets/RopaMascota.jpg',
                  'Ropa de alta calidad para tu mascota.'),
              productoItem(
                  context,
                  'Comida para mascota',
                  'assets/ComidaMascota.jpeg',
                  'Comida premium para perros y gatos.'),
              productoItem(
                  context,
                  'Juguetes para mascota',
                  'assets/juguetesMascota.jpg',
                  'Juguetes seguros y divertidos.'),
            ],
          ),

          const SizedBox(height: 40),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  '© 2024 FurryFriends. Todos los derechos reservados.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  '¿Tienes preguntas?',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Contáctanos: hernandezkaleth647@gmail.com o llama al +57 3203700529',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Dirección: Calle 74 A Sur #92-21, Ciudad de Bogotá',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget servicioItem(
    BuildContext context,
    String titulo,
    String rutaImagen,
    String descripcion,
    String precio,
  ) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(rutaImagen,
                  width: 250, height: 150, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(descripcion),
                  const SizedBox(height: 8),
                  Text(precio,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productoItem(
    BuildContext context,
    String titulo,
    String rutaImagen,
    String descripcion,
  ) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(rutaImagen,
                  width: 250, height: 150, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titulo,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(descripcion),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
