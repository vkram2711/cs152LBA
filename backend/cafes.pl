% ============================================
% Knowledge base: study-friendly cafes in BA
% ============================================
% name: Manifesto
place(manifesto).
computer_friendly(manifesto, yes).
budget(manifesto, medium).
walk_time(manifesto, short).        % 2 min
open_hours(manifesto, 8.0, 19.5).   % 08:00 - 19:30
serves_meal(manifesto, brunch).
serves_meal(manifesto, lunch).
serves_meal(manifesto, coffee).
noise_level(manifesto, moderate).
outdoor_seating(manifesto, yes).

% name: 90s Coffee Roasters
place(coffee_90s).
computer_friendly(coffee_90s, yes).
budget(coffee_90s, medium).
walk_time(coffee_90s, short).       % 6 min
open_hours(coffee_90s, 8.0, 20.0).  % 08:00 - 20:00
serves_meal(coffee_90s, coffee).
serves_meal(coffee_90s, bakery).
noise_level(coffee_90s, quiet).
outdoor_seating(coffee_90s, no).

% name: Clorindo
place(clorindo).
computer_friendly(clorindo, yes).
budget(clorindo, high).
walk_time(clorindo, medium).        % 16 min
open_hours(clorindo, 9.0, 20.0).    % 09:00 - 20:00
serves_meal(clorindo, breakfast).
serves_meal(clorindo, lunch).
serves_meal(clorindo, coffee).
serves_meal(clorindo, bakery).
noise_level(clorindo, moderate).
outdoor_seating(clorindo, yes).

% name: Kilin
place(kilin).
computer_friendly(kilin, yes).
budget(kilin, medium).
walk_time(kilin, long).             % 21 min
open_hours(kilin, 9.0, 19.0).       % 09:00 - 19:00
serves_meal(kilin, brunch).
serves_meal(kilin, lunch).
serves_meal(kilin, coffee).
serves_meal(kilin, bakery).
noise_level(kilin, quiet).
outdoor_seating(kilin, no).

% name: Moshu Palermo
place(moshu).
computer_friendly(moshu, yes).
budget(moshu, high).
walk_time(moshu, long).     % 60 min
open_hours(moshu, 8.0, 21.0). % 08:00 - 21:00
serves_meal(moshu, brunch).
serves_meal(moshu, lunch).
serves_meal(moshu, coffee).
serves_meal(moshu, bakery).
noise_level(moshu_palermo, moderate).
outdoor_seating(moshu_palermo, yes).

% name: Nano
place(nano).
computer_friendly(nano, yes).
budget(nano, high).
walk_time(nano, long).              % 21 min
open_hours(nano, 8.0, 20.0).        % 08:00 - 20:00
serves_meal(nano, coffee).
serves_meal(nano, bakery).
noise_level(nano, quiet).
outdoor_seating(nano, no).

% name: Aminta
place(aminta).
computer_friendly(aminta, yes).
budget(aminta, medium).
walk_time(aminta, long).            % 32 min
open_hours(aminta, 8.0, 20.5).      % 08:00 - 20:30
serves_meal(aminta, brunch).
serves_meal(aminta, coffee).
serves_meal(aminta, bakery).
noise_level(aminta, moderate).
outdoor_seating(aminta, no).

% name: Divino
place(divino).
computer_friendly(divino, yes).
budget(divino, medium).
walk_time(divino, short).           % 7 min
open_hours(divino, 8.5, 19.5).      % 08:30 - 19:30
serves_meal(divino, brunch).
serves_meal(divino, coffee).
serves_meal(divino, bakery).
noise_level(divino, lively).
outdoor_seating(divino, no).

% name: Dandy
place(dandy).
computer_friendly(dandy, no).
budget(dandy, high).
walk_time(dandy, short).            % 4 min
open_hours(dandy, 8.0, 24.0).       % 08:00 - 00:00
serves_meal(dandy, brunch).
serves_meal(dandy, lunch).
serves_meal(dandy, coffee).
serves_meal(dandy, bakery).
noise_level(dandy, lively).
outdoor_seating(dandy, no).

% name: The Shelter Coffee
place(shelter).
computer_friendly(shelter, yes).
budget(shelter, high).
walk_time(shelter, medium).  % 11 min
open_hours(shelter, 8.0, 20.0). % 08:00 - 20:00
serves_meal(shelter, coffee).
serves_meal(shelter, bakery).
noise_level(shelter, moderate).
outdoor_seating(shelter, no).

% name: Flat&White
place(flat_and_white).
computer_friendly(flat_and_white, yes).
budget(flat_and_white, high).
walk_time(flat_and_white, medium).  % 12 min
open_hours(flat_and_white, 8.0, 20.0). % 08:00 - 20:00
serves_meal(flat_and_white, brunch).
serves_meal(flat_and_white, coffee).
serves_meal(flat_and_white, bakery).
noise_level(flat_and_white, moderate).
outdoor_seating(flat_and_white, yes).

% name: Import Coffee
place(import_coffee).
computer_friendly(import_coffee, yes).
budget(import_coffee, medium).
walk_time(import_coffee, long).     % 21 min
open_hours(import_coffee, 7.5, 19.0). % 07:30 - 19:00
serves_meal(import_coffee, brunch).
serves_meal(import_coffee, lunch).
serves_meal(import_coffee, coffee).
serves_meal(import_coffee, bakery).
noise_level(import_coffee, moderate).
outdoor_seating(import_coffee, yes).

% name: Aries Cafe
place(aries).
computer_friendly(aries, yes).
budget(aries, low).
walk_time(aries, long).        % 31 min
open_hours(aries, 7.5, 19.0).  % 07:30 - 19:00
serves_meal(aries, coffee).
serves_meal(aries, bakery).
noise_level(aries, quiet).
outdoor_seating(aries, no).

% name: Babalu
place(babalu).
computer_friendly(babalu, yes).
budget(babalu, high).
walk_time(babalu, long).            % 31 min
open_hours(babalu, 9.0, 17.0).      % 09:00 - 17:00
serves_meal(babalu, brunch).
serves_meal(babalu, lunch).
serves_meal(babalu, coffee).
serves_meal(babalu, bakery).
noise_level(babalu, quiet).
outdoor_seating(babalu, yes).
% name: Llama
place(llama).
computer_friendly(llama, yes).
budget(llama, high).
walk_time(llama, long).        % 31 min
open_hours(llama, 7.5, 20.5).  % 07:30 - 20:30
serves_meal(llama, brunch).
serves_meal(llama, coffee).
serves_meal(llama, bakery).
noise_level(llama, quiet).
outdoor_seating(llama, yes).


% ============================
% USER PREFERENCES
% ============================

:- dynamic user_pref/2.

% ============================
% COMPATIBILITY RULES
% ============================

budget_compatible(User, Cafe) :-
    (User = high);
    (User = medium, Cafe \= high);
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

:- dynamic pref/2.

clear_prefs :-
    retractall(pref(_, _)).