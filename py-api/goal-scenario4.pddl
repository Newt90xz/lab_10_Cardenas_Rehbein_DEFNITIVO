(define (problem goal-green-red-blue)
    (:domain manito)

    (:objects
        redb whiteb
        garra
        xygarra xywhite xydisp1
        zgarra zwhite zdisp1
    )

    (:init
        (en whiteb xywhite)
        (pisob whiteb zwhite)
        (apilado whiteb)

        (en redb xywhite)
        (pisob redb zwhite)
        (libre redb)
        (torre whiteb redb)
        
        (pos garra xygarra)
        (pisog garra zgarra)
        (dismover garra)
        (desocupado garra)

        (libre xydisp1)

        (camino xygarra xywhite)
        (camino xywhite xygarra)
        
        (camino xygarra xydisp1)
        (camino xydisp1 xygarra)
        
        (camino xywhite xydisp1)
        (camino xydisp1 xywhite)

        (alt zgarra zwhite)
        (alt zwhite zgarra)

        (alt zgarra zdisp1)
        (alt zdisp1 zgarra)
    )

    (:goal 
        (and 
            (libre whiteb)
            (en redb xydisp1)
        )
    )
)