import 'dart:convert';

import 'package:supabase/supabase.dart';

const APIkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlycmpzZGV0d3R0dGR3YWl6cmJxIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY2NDI5OTAzNywiZXhwIjoxOTc5ODc1MDM3fQ.ivcJOPph5-ZcR36JC7lhQOJcVWFB1i1noUm6IZMfHeI';
const APIanon = 'https://yrrjsdetwtttdwaizrbq.supabase.co';


class Supabase{
  final client = SupabaseClient(APIanon, APIkey);


  getData() async {
    List<dynamic> list = [];
    var response = await client.from('test').select().execute();
    for(var data in response.data){
      print(data);
      list.add(data);
    }
    print(list[0]['ID']);

    return list;


    }

    signUp(email, pass) async {
    await client.auth.signUp(email, pass);

    }
  }
