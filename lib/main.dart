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
      // Aquí puedes definir las rutas para las páginas de navegación
      routes: {
        '/nosotros': (context) => const NosotrosPage(),
        '/servicios': (context) => const ServiciosPage(),
        '/productos': (context) => const ProductosPage(),
      },
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
                // Navegación a la página Nosotros
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NosotrosPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.deepPurple),
              title: const Text('Servicios'),
              onTap: () {
                // Navegación a la página Servicios
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServiciosPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.deepPurple),
              title: const Text('Productos'),
              onTap: () {
                // Navegación a la página Productos
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductosPage()),
                );
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    // Para navegar a una ruta definida en MaterialApp.routes
                    // Navigator.pushNamed(context, '/servicios');
                    // O si prefieres instanciar directamente:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ServiciosPage()),
                    );
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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

// =========================================================
// DEFINICIÓN DE LAS PÁGINAS (Widgets) FUERA DE OTROS MÉTODOS
// =========================================================

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre Nosotros"),
        backgroundColor: const Color(0xFF602BC2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Sección "Sobre Nosotros"
            const Text(
              'Sobre Nosotros',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF602BC2),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Somos una empresa apasionada por el bienestar animal, dedicada a brindar servicios de calidad para el cuidado y paseo de mascotas. Nuestro objetivo es garantizar que cada mascota reciba la atención, el ejercicio y el cariño que merece.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Sección "Misión"
            const Text(
              'Nuestra Misión',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF602BC2),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Proveer servicios integrales de paseo y cuidado de mascotas, fomentando la felicidad, salud y seguridad de cada peludo amigo, mientras fortalecemos el vínculo entre las mascotas y sus dueños.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Sección "Visión"
            const Text(
              'Nuestra Visión',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF602BC2),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Convertirnos en la empresa líder en cuidado de mascotas, reconocida por nuestra innovación, compromiso y amor por los animales, promoviendo una cultura de responsabilidad y respeto hacia ellos.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Sección "Eslogan"
            const Text(
              'Eslogan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF602BC2),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '"Transformamos cada paseo en una aventura y cada cuidado en una experiencia de amor"',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold aquí para tener AppBar y estructura de página completa
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        backgroundColor: const Color(0xFF602BC2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Servicios Disponibles',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildServicio(
              titulo: 'Paseo para mascota',
              descripcion:
                  'Ofrecemos paseos para tu mascota, ayudando y facilitando el encuentro de un paseador para brindarle el mejor servicio a tu mascota.',
            ),
            _buildServicio(
              titulo: 'Guardería para Mascotas',
              descripcion:
                  'Un lugar seguro y cómodo donde tu mascota podrá jugar y descansar mientras tú estás fuera.',
            ),
            _buildServicio(
              titulo: 'Entrenamiento Canino',
              descripcion:
                  'Clases de entrenamiento personalizadas para mejorar el comportamiento de tu perro.',
            ),
            const SizedBox(height: 40),
            const Text(
              'Ubicación en el mapa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Aquí irá el mapa (implementación futura)',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Contacto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Para más información, no dudes en ponerte en contacto con nosotros.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const _FormularioContacto(), // Instancia la clase de formulario
          ],
        ),
      ),
    );
  }

  Widget _buildServicio({required String titulo, required String descripcion}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            descripcion,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _FormularioContacto extends StatefulWidget {
  const _FormularioContacto({super.key});

  @override
  State<_FormularioContacto> createState() => _FormularioContactoState();
}

class _FormularioContactoState extends State<_FormularioContacto> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String email = '';
  String mensaje = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) => value!.isEmpty ? 'Ingrese su nombre' : null,
            onSaved: (value) => nombre = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Correo Electrónico'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? 'Ingrese un correo electrónico válido' : null,
            onSaved: (value) => email = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Mensaje'),
            maxLines: 4,
            validator: (value) =>
                value!.isEmpty ? 'Por favor ingrese su mensaje' : null,
            onSaved: (value) => mensaje = value!,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _enviarFormulario,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF602BC2),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text('Enviar', style: TextStyle(fontSize: 16, color: Colors.white)), // Added color for text
          ),
        ],
      ),
    );
  }

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí podrías agregar lógica para enviar el mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mensaje enviado correctamente')),
      );
    }
  }
}

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: const Color(0xFF602BC2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Ropa para mascota:',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const _CarruselProductos(titulo: 'Carrusel 1'), // Usar const
          const SizedBox(height: 32),
          const _CarruselProductos(titulo: 'Carrusel 2'), // Usar const
          const SizedBox(height: 32),
          const _CarruselProductos(titulo: 'Carrusel 3'), // Usar const
          const SizedBox(height: 32),
          const _CarruselProductos(titulo: 'Carrusel 4 con título',
              incluyeTitulo: true), // Usar const
        ],
      ),
    );
  }
}

class _CarruselProductos extends StatefulWidget {
  final String titulo;
  final bool incluyeTitulo;

  const _CarruselProductos({
    super.key, // Añadir super.key
    required this.titulo,
    this.incluyeTitulo = false,
  });

  @override
  State<_CarruselProductos> createState() => _CarruselProductosState();
}

class _CarruselProductosState extends State<_CarruselProductos> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _paginaActual = 0;

  final List<Map<String, String>> productos = [
    {
      'img': 'assets/img/new-product-1.jpg',
      'titulo': 'Chaleco para perro',
    },
    {'img': 'assets/img/new-product-2.jpg', 'titulo': 'Correa de paseo'}, // Added title for consistency
    {'img': 'assets/img/new-product-3.jpg', 'titulo': 'Cama para gatos'},
    {'img': 'assets/img/new-product-4.jpg', 'titulo': 'Juguete interactivo'},
    {'img': 'assets/img/new-product-5.jpg', 'titulo': 'Comedero automático'},
    {'img': 'assets/img/new-product-6.jpg', 'titulo': 'Champú para mascotas'},
  ];

  @override
  void dispose() {
    _controller.dispose(); // Importante para liberar recursos del controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.incluyeTitulo ? 240 : 200,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _paginaActual = index;
              });
            },
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final producto = productos[index];
              final bool activo = index == _paginaActual;
              return _buildItem(producto, activo);
            },
          ),
        ),
        const SizedBox(height: 8),
        _buildControles(),
      ],
    );
  }

  Widget _buildItem(Map<String, String> producto, bool activo) {
    final double scale = activo ? 1.0 : 0.9;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      transform: Matrix4.identity()..scale(scale),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                producto['img']!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          if (widget.incluyeTitulo && producto.containsKey('titulo'))
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                producto['titulo']!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _paginaActual > 0
              ? () {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF602BC2)), // Added color
          child: const Text('Prev', style: TextStyle(color: Colors.white)), // Added color for text
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: _paginaActual < productos.length - 1
              ? () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF602BC2)), // Added color
          child: const Text('Next', style: TextStyle(color: Colors.white)), // Added color for text
        ),
      ],
    );
  }
}