class Bill {
  final String file;
  final String title;
  final DateTime agendaDate;
  final String status;
  final String committee;
  final String legistarID;

  Bill({this.file, this.title, this.agendaDate, this.status, this.committee, this.legistarID});

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      file: json['File'],
      title: json['Title'],
      agendaDate: json['AgendaDate'],
      status: json['Status'],
      committee: json['Committee'],
      legistarID: json['LegistarID'],
    );
  }


//  "File": "CB 119498",
//  "Title": "AN ORDINANCE relating to the City Light Department; accepting statutory warranty deeds to the Massnick and Levins properties in Pend Oreille County, Washington, both to be managed as Project Habitat Lands as required by the Federal Energy Regulatory Commission (FERC) License Order for the Boundary Hydroelectric Project; and placing said lands under the jurisdiction of the City Light Department.",
//  "AgendaDate": "2019-09-03T00:00:00Z",
//  "Status": "Full Council Agenda Ready",
//  "Committee": "Finance and Neighborhoods Committee",
//  "LegistarID": 8448

}