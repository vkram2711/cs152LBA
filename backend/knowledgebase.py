import os

from pyswip import Prolog

prolog_code = """
% ============================
% Knowledge base: cafes in BA
% ============================

place(manifesto).
computer_friendly(manifesto, yes).
budget(manifesto, medium).
walk_time(manifesto, short).
open_hours(manifesto, 8.0, 19.5).
serves_meal(manifesto, brunch).
serves_meal(manifesto, lunch).
serves_meal(manifesto, coffee).
noise_level(manifesto, moderate).
outdoor_seating(manifesto, yes).

place(coffee_90s).
computer_friendly(coffee_90s, yes).
budget(coffee_90s, medium).
walk_time(coffee_90s, short).
open_hours(coffee_90s, 8.0, 20.0).
serves_meal(coffee_90s, coffee).
serves_meal(coffee_90s, bakery).
noise_level(coffee_90s, quiet).
outdoor_seating(coffee_90s, no).

place(clorindo).
computer_friendly(clorindo, yes).
budget(clorindo, high).
walk_time(clorindo, medium).
open_hours(clorindo, 9.0, 20.0).
serves_meal(clorindo, breakfast).
serves_meal(clorindo, lunch).
serves_meal(clorindo, coffee).
serves_meal(clorindo, bakery).
noise_level(clorindo, moderate).
outdoor_seating(clorindo, yes).

% ============================
% USER PREFERENCES
% ============================

:- dynamic user_pref/2.

% ============================
% COMPATIBILITY RULES
% ============================

budget_compatible(User, Cafe) :-
    (User = high);
    (User = medium, Cafe \\= high);
    (User = low, Cafe = low).

distance_compatible(short, short).
distance_compatible(medium, short).
distance_compatible(medium, medium).
distance_compatible(long, _).

noise_compatible(quiet, quiet).
noise_compatible(moderate, quiet).
noise_compatible(moderate, moderate).
noise_compatible(lively, _).

% ============================
% MATCH RULES
% ============================

matches_computer_friendly(P) :-
    user_pref(computer_friendly, yes) ->
        computer_friendly(P, yes)
    ;
        true.

matches_budget(P) :-
    user_pref(budget, U),
    budget(P, C),
    budget_compatible(U, C).

matches_distance(P) :-
    user_pref(max_walk_time, U),
    walk_time(P, C),
    distance_compatible(U, C).

matches_hours(P) :-
    user_pref(start_hour, S),
    user_pref(end_hour, E),
    open_hours(P, O, C),
    S >= O,
    E =< C.

matches_meal(P) :-
    user_pref(meal_type, M),
    serves_meal(P, M).

matches_noise(P) :-
    user_pref(noise_level, U),
    noise_level(P, C),
    noise_compatible(U, C).

matches_outdoor(P) :-
    user_pref(outdoor_seating, dont_care) ->
        true
    ;
        (user_pref(outdoor_seating, V),
         outdoor_seating(P, V)).

% ============================
% FINAL RECOMMENDATION
% ============================

recommend(P) :-
    place(P),
    matches_computer_friendly(P),
    matches_budget(P),
    matches_distance(P),
    matches_hours(P),
    matches_meal(P),
    matches_noise(P),
    matches_outdoor(P).
"""

if __name__ == "__main__":
    with open("../../cafes.pl", "w") as f:
        f.write(prolog_code)

    print("cafes.pl written successfully")


    prolog = Prolog()
    pl_path = os.path.abspath("../cafes.pl")
    prolog.consult(pl_path)
    print("Prolog KB loaded")
