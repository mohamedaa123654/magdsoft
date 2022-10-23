class HelpModel {
  int? status;
  String? message;
  List<Help>? help;

  HelpModel({this.status, this.message, this.help});

  HelpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['help'] != null) {
      help = <Help>[];
      json['help'].forEach((v) {
        help!.add(new Help.fromJson(v));
      });
    }
  }
}

class Help {
  final int id;
  final String question;
  final String answer;

  const Help({required this.id, required this.question, required this.answer});

  factory Help.fromJson(Map<String, dynamic> json) => Help(
        id: json['id'],
        question: json['question'],
        answer: json['answer'],
      );
}
