import 'package:flutter/material.dart';
import 'package:multi_app/components/custom_card.dart';
import 'package:multi_app/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({super.key});

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget> {
  late DateTime _currentTime;
  late String _greeting;

  @override
  void initState() {
    super.initState();
    _updateTime();
    Future.delayed(const Duration(minutes: 1), () {
      if (mounted) {
        setState(() {
          _updateTime();
        });
      }
    });
  }

  void _updateTime() {
    _currentTime = DateTime.now();
    final hour = _currentTime.hour;
    
    if (hour < 12) {
      _greeting = 'Bom dia';
    } else if (hour < 18) {
      _greeting = 'Boa tarde';
    } else {
      _greeting = 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {

    final loggedUser = context.watch<UserNotifier>().user;

    return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.person,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 24.0,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$_greeting, ${loggedUser?.firstName ?? 'Usuário'}',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          _getFormattedDateTime(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  String _getFormattedDateTime() {
    final now = DateTime.now();
    final weekdays = [
      'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira',
      'Quinta-feira', 'Sexta-feira', 'Sábado'
    ];
    final months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];
    
    final weekday = weekdays[now.weekday];
    final day = now.day;
    final month = months[now.month - 1];
    final year = now.year;
    final time = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    
    return '$weekday, $day de $month de $year • $time';
  }
} 