
class govtSchoolsDetailsDataList
{
  String name;

  govtSchoolsDetailsDataList({required this.name});
}

List<govtSchoolsDetailsDataList> govtDetailsList()
{
  // ignore: deprecated_member_use
  List<govtSchoolsDetailsDataList> gwc = <govtSchoolsDetailsDataList>[];

  govtSchoolsDetailsDataList  gw = govtSchoolsDetailsDataList(name: "Govt School 1 - Name");
  gwc.add(gw);

  return gwc;
}