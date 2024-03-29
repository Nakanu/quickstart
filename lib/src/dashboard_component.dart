import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';

import 'hero_search_component.dart';


@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives, routerDirectives, HeroSearchComponent],
  styleUrls: ['dashboard_component.css'],
)
class DashboardComponent implements OnInit{
  List<Hero> heroes;
  final HeroService _heroService;
  DashboardComponent(this._heroService);

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    print('In dashboard component');
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }
}