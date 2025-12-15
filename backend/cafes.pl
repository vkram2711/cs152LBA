:- discontiguous place/1.
:- discontiguous computer_friendly/2.
:- discontiguous budget/2.
:- discontiguous walk_time/2.
:- discontiguous open_hours/3.
:- discontiguous serves_meal/2.
:- discontiguous noise_level/2.
:- discontiguous outdoor_seating/2.

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
noise_level(moshu, moderate).
outdoor_seating(moshu, yes).

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

% ============================================
% USER CONTEXT (DYNAMIC)
% ============================================
:- dynamic user_intent/1.
:- dynamic user_mood/1.
:- dynamic group_size/1.
:- dynamic weather/1.
:- dynamic stay_duration/1.
:- dynamic user_pref/2.

% clear_context: clear all dynamic user context and explicit prefs
clear_context :-
    retractall(user_intent(_)),
    retractall(user_mood(_)),
    retractall(group_size(_)),
    retractall(weather(_)),
    retractall(stay_duration(_)),
    retractall(user_pref(_, _)).

% ============================================
% INTENT, MOOD, CONTEXT IMPLICATIONS
% ============================================

% ---- INTENT ----
implied_pref(work, computer_friendly, yes).
implied_pref(work, noise_level, quiet).

implied_pref(relax, noise_level, moderate).
implied_pref(relax, outdoor_seating, yes).

implied_pref(meet_friends, noise_level, lively).

% ---- MOOD ----
implied_pref(tired, noise_level, quiet).
implied_pref(tired, walk_time, short).

implied_pref(social, noise_level, lively).

% ---- WEATHER ----
implied_pref(rainy, outdoor_seating, no).
implied_pref(sunny, outdoor_seating, yes).

% ---- DURATION ----
implied_pref(short, walk_time, short).
% long tends to favor computer-friendly if intent is work; keep conditional
implied_pref(long, computer_friendly, yes) :- user_intent(work).

% ============================================
% EFFECTIVE PREFERENCE RESOLUTION
% Priority:
% explicit > mood > intent > weather > duration
% ============================================

effective_pref(Key, Value) :-
    user_pref(Key, Value), !.

effective_pref(Key, Value) :-
    user_mood(M),
    implied_pref(M, Key, Value), !.

effective_pref(Key, Value) :-
    user_intent(I),
    implied_pref(I, Key, Value), !.

effective_pref(Key, Value) :-
    weather(W),
    implied_pref(W, Key, Value), !.

effective_pref(Key, Value) :-
    stay_duration(D),
    implied_pref(D, Key, Value).

% ============================================
% COMPATIBILITY RULES
% ============================================

budget_compatible(User, CafeCategory) :-
    (User = high);
    (User = medium, CafeCategory \= high);
    (User = low, CafeCategory = low).

distance_compatible(short, short).
distance_compatible(medium, short).
distance_compatible(medium, medium).
distance_compatible(long, _).

noise_compatible(quiet, quiet).
noise_compatible(moderate, quiet).
noise_compatible(moderate, moderate).
noise_compatible(lively, _).

% ============================================
% NEEDS QUESTION (UI HINTS)
% The UI can ask needs_question(Key) to decide whether to show a field
% ============================================

needs_question(computer_friendly) :-
    user_intent(work);
    stay_duration(long).
needs_question(outdoor_seating) :-
    user_intent(relax);
    weather(sunny).
needs_question(noise_level) :-
    user_intent(work);
    user_intent(meet_friends);
    user_mood(tired);
    user_mood(social).
needs_question(max_walk_time) :-
    user_intent(quick_coffee);
    user_mood(tired).

% ============================================
% HARD FILTERS (REJECTION RULES)
% Use effective_pref where available for consistent behavior
% ============================================

% If user effectively wants quiet places, reject lively ones.
reject(P) :-
    effective_pref(noise_level, quiet),
    noise_level(P, lively).

% If user effectively wants outdoor seating, reject places without it.
reject(P) :-
    effective_pref(outdoor_seating, yes),
    outdoor_seating(P, no).

% If user effectively wants computer friendly, reject non-friendly places.
reject(P) :-
    effective_pref(computer_friendly, yes),
    computer_friendly(P, no).

% Budget compatibility (explicit/effective pref)
reject(P) :-
    effective_pref(budget, U),
    budget(P, C),
    \+ budget_compatible(U, C).

% Hours: if both start and end are effective, require overlap
reject(P) :-
    effective_pref(start_hour, S),
    effective_pref(end_hour, E),
    open_hours(P, O, C),
    (S < O ; E > C).

% ============================================
% SCORING RULES (SOFT PREFERENCES) as score_component/3
% produce (Label, Value) so we can explain results
% ============================================

% score_component(Place, Label, Value).

score_component(P, walk_distance, 1) :-
    effective_pref(walk_time, U),
    walk_time(P, C),
    distance_compatible(U, C).

score_component(P, quiet_for_tired, 2) :-
    user_mood(tired),
    noise_level(P, quiet).

score_component(P, outdoor_relax, 1) :-
    user_intent(relax),
    outdoor_seating(P, yes).

score_component(P, long_stay_friendly, 1) :-
    stay_duration(long),
    computer_friendly(P, yes).

score_component(P, sunny_outdoor, 1) :-
    weather(sunny),
    outdoor_seating(P, yes).

score_component(P, group_ok_moderate, 1) :-
    group_size(N),
    N >= 2,
    noise_level(P, moderate).

score_component(P, group_too_large_penalty, -1) :-
    group_size(N),
    N > 3,
    noise_level(P, quiet).

score_component(P, serves_requested_meal, 1) :-
    effective_pref(meal_type, M),
    serves_meal(P, M).

score_component(P, work_computer_bonus, 2) :-
    user_intent(work),
    computer_friendly(P, yes).

% ============================================
% TOTAL SCORE AGGREGATION (collect components, sum values)
% ============================================

total_score(P, Score) :-
    findall(Value, score_component(P, _, Value), Values),
    sumlist(Values, Score).

% Also allow retrieving component list for explanations
explain(P, Components) :-
    findall(Label-Value, score_component(P, Label, Value), Components).

% ============================================
% FINAL RECOMMENDATION
% ============================================

recommend(P, Score) :-
    place(P),
    \+ reject(P),
    total_score(P, Score).

% ============================================
% SORTED RECOMMENDATIONS (DESCENDING by score)
% Returns list of Place-Score pairs to preserve scores in UI
% ============================================

recommended_sorted_pairs(Pairs) :-
    findall(Score-Place, recommend(Place, Score), Pairs0),
    sort(0, @>=, Pairs0, Pairs).

% Convenience: return only places (legacy)
recommended_sorted(Places) :-
    recommended_sorted_pairs(Pairs),
    pairs_values(Pairs, Places).

% ============================================
% small utilities
% ============================================

clear_prefs :-
    retractall(user_pref(_, _)).

% --- Helper 1: Set a generic preference (Key-Value pair) ---
% Usage: set_pref(wifi, true).
set_pref(Key, Value) :-
    retractall(user_pref(Key, _)),
    assert(user_pref(Key, Value)).


% --- Helper 2: Set a single-value attribute ---
% Usage: set_attribute(user_intent, work).
% This constructs the term dynamically to clear the old one.
set_attribute(PredName, Value) :-
    OldFact =.. [PredName, _],   % Construct term like user_intent(_)
    retractall(OldFact),         % Remove old instance
    NewFact =.. [PredName, Value], % Construct term like user_intent(work)
    assert(NewFact).