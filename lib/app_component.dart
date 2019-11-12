import 'package:angular/angular.dart';
import 'package:angular_app/src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives, HeroComponent],
  styleUrls: ['app_component.css'],
  providers: [ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';
  Hero selected;
  List<Hero> heroes;
  final HeroService _heroService;

  AppComponent(this._heroService);

  void onSelect(Hero hero) {
    if (selected == hero) selected = null;
    else selected = hero;
  }

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => this._getHeroes();
}
