
import 'package:cubic_prueba/data/models/poke_result_model.dart';
import 'package:cubic_prueba/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeApi {


  final Dio dio = Dio();
  final String api ="https://pokeapi.co/api/v2/";
  final String ditoEnpoint ="pokemon/ditto";
  Future<Pokemon> getPokemon() async {
    try {
      final response = await dio.get('$api$ditoEnpoint');
       return Pokemon.fromJson(response.data);

    } catch (e){
      throw Exception('Get Pokemon Error');
    }


  }


  Future<PokeResult> getPokemonList({ required int offset}) async{

    try{
      final response = await dio.get("${api}pokemon?limit=20&offset=$offset");
      return PokeResult.fromJson(response.data);

    }catch (e){
      throw Exception('Get Pokemon List Error');
    }


  }



}