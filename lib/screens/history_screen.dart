import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    final history = provider.attedanceHistory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
        backgroundColor: Colors.blueAccent, // Menambahkan warna latar AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: history.isEmpty
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Belum ada riwayat kehadiran.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
            : ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            final record = history[index];
            final formattedDate =
            DateFormat('dd MMM yyyy').format(record.date);

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hadir: ${record.presentCount}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Tidak Hadir: ${record.absentCount}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

