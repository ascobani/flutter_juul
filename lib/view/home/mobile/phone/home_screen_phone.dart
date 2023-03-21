/*

© 2023 

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 18:52
Notes        : 




*/

part of '../../home_screen.dart';

class HomeScreenPhone extends StatefulWidget {
  const HomeScreenPhone({Key? key}) : super(key: key);

  @override
  State<HomeScreenPhone> createState() => _HomeScreenPhoneState();
}

class _HomeScreenPhoneState extends State<HomeScreenPhone> {
  @override
  void initState() {
    super.initState();
    context.read<JuulBleBloc>().add(
          const JuulBleScanEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juul App'),
      ),
      body: BlocBuilder<JuulBleBloc, JuulBleState>(
        builder: (context, state) {
          return _HomeView(
            state: state,
          );
        },
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final JuulBleState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.devices?.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(state.devices?.elementAt(index).device.name ?? ''),
        subtitle: Text(state.devices?.elementAt(index).device.id.id ?? ''),
        onTap: () {
          context.read<JuulBleBloc>().add(
                JuulBleConnectEvent(
                  state.devices!.elementAt(index).device,
                ),
              );
        }
      ),
    );
  }
}
