(define (problem goal3)
    (:domain manito)

    (:objects
        greenb blueb redb whiteb
        garra
        xygarra xygreen xyblue xyred xywhite
        zgreen zgarra zblue zred zwhite
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (libre greenb)

        (en blueb xyblue)
        (pisob blueb zblue)
        (libre blueb)

        (en redb xyred)
        (pisob redb zred)
        (libre redb)

        (en whiteb xywhite)
        (pisob whiteb zwhite)
        (libre whiteb)

        (pos garra xygarra)
        (pisog garra zgarra)

        (dismover garra)
        (desocupado garra)

        (camino xygreen xygarra)
        (camino xygarra xygreen)
        (camino xygarra xyblue)
        (camino xyblue xygarra)
        (camino xygarra xyred)
        (camino xyred xygarra)
        (camino xygarra xywhite)
        (camino xywhite xygarra)

        (alt zgarra zgreen)
        (alt zgreen zgarra)
        (alt zblue zgarra)
        (alt zgarra zblue)
        (alt zred zgarra)
        (alt zgarra zred)
        (alt zwhite zgarra)
        (alt zgarra zwhite)
    )

    (:goal 
        (and 
            (torre blueb greenb)
            (torre whiteb redb)
        )
    )
)