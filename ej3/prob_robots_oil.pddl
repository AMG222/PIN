;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Prob Robots
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (problem probrobot)
(:domain robots)

(:objects R1 R2 - robot
          Juan Pedro - person
          room1 room2 room3 room4 hall - location
          TM CS - furniture
          cup tea empty - item
          armR2L armR2R armR1L armR1R - arm          
)

(:init 
(atr R1 room1)
(atr R2 room3)

(at Juan room2)
(at Pedro room3)
(at TM room1)
(at CS room3)

(camino room1 room2)
(camino room1 hall)
(camino room2 room1)
(camino room2 hall)
(camino room3 room4)
(camino room3 hall)
(camino room4 room3)
(camino room4 hall)
(camino hall room1)
(camino hall room2)
(camino hall room3)
(camino hall room4)

(= (capacity R1) 40000)
(= (capacity R2) 50000)
(= (total_energy) 0)

(= (distance room1 room2) 500)
(= (distance room1 hall) 260)

(= (distance room2 room1) 500)
(= (distance room2 hall) 260)

(= (distance room3 room4) 500)
(= (distance room3 hall) 260) 

(= (distance room4 room3) 500)
(= (distance room4 hall) 260)

(= (distance hall room1) 260)
(= (distance hall room2) 260)
(= (distance hall room3) 260)
(= (distance hall room4) 260)

(canmove R1 room1)
(canmove R1 room2)
(canmove R1 hall)
(canmove R2 room3)
(canmove R2 room4)
(canmove R2 hall)

(arm armR1R empty)
(arm armR1L empty)
(arm armR2R empty)
(arm armR2L empty)

(robot R1 armR1R)
(robot R1 armR1L)
(robot R2 armR2R)
(robot R2 armR2L)

(= (speed R1) 10)
(= (speed R2) 20)

(= (peso tea) 5)
(= (peso cup) 2)
(= (peso empty) 0)
)

(:goal (and (served Juan)(served Pedro)))
(:metric minimize (total_energy))
)