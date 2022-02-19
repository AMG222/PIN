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
)

(:goal (and (served Juan)(served Pedro)))
)