Eden Zik
Elevator Assignment
COSI105A
Apri 26, 2015
---------------

Overview
========

The operations of an elevator are nontrivial, and are often used to simulate buffering algorithms (so called "elevator algorithms") and for other purposes.

However, even in the simplest form, managing the movement of people in a building needs to take many things into account.

I present a simulation that is capable of running and showing the random progression of a random assortment of people located at a variety of floors, and how they come to arrive at their destination by calling elevators which are moving about.

There is some degree of artificial intelligence to this algorithm, and it will be presented below.


Structure
========

This assignment triggers a very clear sense of hierarchy. A building is a structure which contains many elevators, and has many floors. It is also where people generally know that they are, so when they call an elevator they really trigger a control center inside of the building.

Floors are weak entities, in the sense that they are partially aware of what's going on. Floors have people who are waiting for an elevator, but do not really know about their location - something which they have to consult the building for.

A person is really only aware of its own desires. It can go up or down, and it figures out where it wants to go because it knows where it is, and the relative position of that floor compares to itself.

The overall simulation progresses by offering "ticks", successive pushes to all the models to do the next thing on their mind.


Artificial Intelligence
===============
There are many ways to make elevators pick up as many passengers as possible. I thought optimizing the elevator which is picked would be ideal, so I made the building dispatch elevators using a least-frequently-used paging algorithm:

http://en.wikipedia.org/wiki/Least_frequently_used

By doing so, I was able to have the elevator that was dispatched the least recently go directly to the next person who needs it, making it as unlikely as possible that someone might already be on it.

A person decides to go on an elevator that is already present on their floor if that elevator is going the same direction as where their destination is.

Otherwise, the person asks the building to dispatch another elevator.

When a person reaches their desired floor, they exit an elevator. If they are at their desired floor already, they "exit" the simulation - and are no longer waiting for an elevator.

Elevators themselves start at an idle position, and once dispatched go either up or down. When they reach the ceiling or the bottom floor, they change direction. Each of these operations is one tick - which also guides the decision making of the people.

The notation "Jayde at 0 => 3" indicates that Jayde is at floor 0 wanting to go to floor 3.

Usage
========

Use the sim.rb class to run the simulation for the given amount of time:

s = Simulation.new

s.run(20)

Will run the simulation 20 times.


Conclusion
========

By following a strict class hierarchy, good software engineering practices were followed. Although no inheritance was needed, this code is modular and is not too aware of each other - a person cannot manage the attributes of a building, a floor, etc.

