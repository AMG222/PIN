;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Prob Robots (Se ha añadido un comensal(Marta) en la misma habitación que otro.
;;Se ha eliminado el robot 2
;;El robot 1 puede moverse donde sea)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (problem probrobot)
(:domain robots)

(:objects R1 - robot ;;Se elimina el Robot2
          Juan Pedro - person ;;
          room1 room2 room3 room4 hall - location
          TM CS - furniture
          cup tea empty - item
          armR1L armR1R - arm      ;;Se eliminan los brazos del Robot2    
)

(:init 
(atr R1 room1)
;;Se elimina la posición del Robot2

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
(canmove R1 room3)
(canmove R1 room4)
;;Se añaden los can move del Robot 2 al 1

(arm armR1R empty)
(arm armR1L empty)
;;Se eliminan los brazos del Robot2

(robot R1 armR1R)
(robot R1 armR1L)
;;Se eliminan los brazos del Robot2
)

(:goal (and (served Juan)(served Pedro))) ;;se añade Marta
)