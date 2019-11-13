import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  directives: [coreDirectives],
  styleUrls: ['hero_list_component.css'],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  Hero selected;
  List<Hero> heroes;

  HeroListComponent(this._heroService, this._router);

  void onSelect(Hero hero) {
    if (selected == hero) selected = null;
    else selected = hero;
  }

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() {
    print("In hero list component");
    this._getHeroes();
  }

  String _heroUrl(int id) =>
    RoutePaths.hero.toUrl(parameters: {idParam:'$id'});

  Future<NavigationResult> gotoDetail() =>
    _router.navigate(_heroUrl(selected.id));
}
