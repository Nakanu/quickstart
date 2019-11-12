import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';

@Component (
  selector: 'my-hero',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'hero_component.html',
)
class HeroComponent {
  @Input()
  Hero hero;
}