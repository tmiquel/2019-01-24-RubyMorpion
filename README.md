README
======

TEMPLATE README
THP Marseille - Fichier de rendu pour le 2019/01/17

Comment exécuter le programme
============

1. Télécharge ce dossier
3. Se mettre à la racine du dossier
4. Jouer les tests suivants :

<p> <strong>            ruby app.rb</strong></p>

Classes and Modules
===========

<ul>
  <li class="class">
    <a href="Board.html">Board</a>
    <p> Board est le plateau de jeu, composé de 9 cases (classe Box), elle a une seule instance durant un jeu.</p>
  </li>
  <li class="class">
    <a href="Box.html">Box</a>
    <p> Box est la classe des 9 cases, elle a 9 instances durant un jeu. </p>
  </li>
  <li class="class">
    <a href="Game.html">Game</a>
    <p> Game est le controller dans ce jeu. Il initialise les instances de classes de Model (Board, Player) ainsi que la classe View. La méthode play crée une nouvelle instance GameTurn et en fonction du résultat du tour (Jeu gagné, nul, continue à jouer) appelle les méthodes de View correspondantes. Les retours des joueurs (via les méthodes View) l'amènent à mettre à jour les statuts des cases Box (cochée/non cochées) ou à faire des requêtes pour connaitre leur statut. Sur demande des joueurs (connu via une méthode de View), relance le jeu à l'issue du jeu en invoquant la méthode de classe perform du Routeur</p>
  </li>
  <li class="class">
    <a href="GameTurn.html">GameTurn</a>
        <p> GameTurn est la principale classe de type Model. Elle simule un tour jouée, demande à son attribut @game de faire des requêtes auprès de View pour obtenir les choix des joueurs, et déterminent si le jeu est gagné, nul ou s'il peut continuer à l'issue du tour  </p>
  </li>
  <li class="class">
    <a href="Player.html">Player</a>
    	<p>Deux instances de joueurs, dont on connaît s'il joue en premier ou pas et le nom.</p>
  </li>
  <li class="class">
    <a href="Router.html">Router</a>
    <p>Initialise le jeu. Ses méthodes de classe affichent un écran d'accueuil et initialise l'instance Game en lui indiquant le nom des deux joueurs et lequel joue en premier.</p>
  </li>
  <li class="class">
    <a href="View.html">View</a>
    <p>Une seule instance par jeu. Demande à chaque joueur quel est leur choix de jeu, checke si leur input est valable, affiche sur demande de Game les écrans en cas de jeu gagné et de match nul. Puis demande si les joueurs veulent rejouer. </p>
  </li>
</ul>

<h2 id="methods">Methods</h2>
<ul>

  <li class="method">
    <a href="Router.html#method-c-ask_name">::ask_name</a>
    &mdash;
    <span class="container">Router</span>
    <p> demande le nom d'un joueur</p>

  <li class="method">
    <a href="Router.html#method-c-dice_roll">::dice_roll</a>
    &mdash;
    <span class="container">Router</span>
    <p>Lancer de dé (dans le cadre du choix du premier joueur)</p>

  <li class="method">
    <a href="Router.html#method-c-intro_view">::intro_view</a>
    &mdash;
    <span class="container">Router</span>
    <p>Affiche l'écran d'accueil</p>

  <li class="method">
    <a href="Board.html#method-c-new">::new</a>
    &mdash;
    <span class="container">Board</span>

  <li class="method">
    <a href="Box.html#method-c-new">::new</a>
    &mdash;
    <span class="container">Box</span>

  <li class="method">
    <a href="Game.html#method-c-new">::new</a>
    &mdash;
    <span class="container">Game</span>

  <li class="method">
    <a href="GameTurn.html#method-c-new">::new</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="Player.html#method-c-new">::new</a>
    &mdash;
    <span class="container">Player</span>

  <li class="method">
    <a href="View.html#method-c-new">::new</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="Router.html#method-c-perform">::perform</a>
    &mdash;
    <span class="container">Router</span>
    <p>Methode appelé par app.rb. Appelle les autres méthodes de Router pour collecter les noms, déterminer l'ordre des joueurs et créer une nouvelle instance de Game, et appeler sa méthode play </p>

  <li class="method">
    <a href="Router.html#method-c-select_first_player">::select_first_player</a>
    &mdash;
    <span class="container">Router</span>

  <li class="method">
    <a href="Router.html#method-c-show_first_and_second">::show_first_and_second</a>
    &mdash;
    <span class="container">Router</span>

  <li class="method">
    <a href="View.html#method-i-box_input_in_range-3F">#box_input_in_range?</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="Game.html#method-i-box_ticked-3F">#box_ticked?</a>
    &mdash;
    <span class="container">Game</span>

  <li class="method">
    <a href="View.html#method-i-box_ticked-3F">#box_ticked?</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="GameTurn.html#method-i-diagonal_crossed-3F">#diagonal_crossed?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="View.html#method-i-drawn_view">#drawn_view</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="GameTurn.html#method-i-full_column_crossed-3F">#full_column_crossed?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="GameTurn.html#method-i-full_line_crossed-3F">#full_line_crossed?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="GameTurn.html#method-i-game_is_drawn-3F">#game_is_drawn?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="GameTurn.html#method-i-game_is_won_by-3F">#game_is_won_by?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="Board.html#method-i-get_box_by_position">#get_box_by_position</a>
    &mdash;
    <span class="container">Board</span>

  <li class="method">
    <a href="Game.html#method-i-get_box_status">#get_box_status</a>
    &mdash;
    <span class="container">Game</span>

  <li class="method">
    <a href="View.html#method-i-get_print_string">#get_print_string</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="GameTurn.html#method-i-lines_checked-3F">#lines_checked?</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="Game.html#method-i-pick_a_box">#pick_a_box</a>
    &mdash;
    <span class="container">Game</span>

  <li class="method">
    <a href="View.html#method-i-pick_a_box">#pick_a_box</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="Game.html#method-i-play">#play</a>
    &mdash;
    <span class="container">Game</span>

  <li class="method">
    <a href="GameTurn.html#method-i-play">#play</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="GameTurn.html#method-i-play_per_player">#play_per_player</a>
    &mdash;
    <span class="container">GameTurn</span>

  <li class="method">
    <a href="View.html#method-i-print_board">#print_board</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="View.html#method-i-print_start_again_choice">#print_start_again_choice</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="View.html#method-i-start_again-3F">#start_again?</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="Board.html#method-i-tick_box">#tick_box</a>
    &mdash;
    <span class="container">Board</span>

  <li class="method">
    <a href="View.html#method-i-update_all_print_strings">#update_all_print_strings</a>
    &mdash;
    <span class="container">View</span>

  <li class="method">
    <a href="View.html#method-i-won_view">#won_view</a>
    &mdash;
    <span class="container">View</span>
</ul>
</main>

Participants 
==========

Note : on a travaillé ensemble, mais chacun a customizé son code.
Ce rendu est le rendu de l'un d'entre nous.

"Prénom - Nom - Pseudo Slack - Pseudo Github":
--------------------------------------------

Patrick - Aubert - Patrickl - patrickaub  

Thibaut - Miquel - Thibaut Miquel - tmiquel - 06 99 33 28 11

