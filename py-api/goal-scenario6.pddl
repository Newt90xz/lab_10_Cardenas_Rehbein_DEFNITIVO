(define (problem goal6)
    (:domain manito)

    (:objects
        greenb blueb whiteb
        garra
        xygarra xygreen xyred xywhite xydisp1
        zgarra zgreen zred zwhite
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (apilado greenb)

        (en blueb xygreen)
        (pisob blueb zgreen)
        (libre blueb)

        (torre greenb blueb)

        (en whiteb xywhite)
        (pisob whiteb zwhite)
        (libre whiteb)

        (pos garra xygarra)
        (pisog garra zgarra)
        (dismover garra)
        (desocupado garra)

        (libre xydisp1)

        (camino xygarra xygreen)
        (camino xygreen xygarra)

        (camino xygarra xywhite)
        (camino xywhite xygarra)

        (camino xygreen xywhite)
        (camino xywhite xygreen)

        (camino xydisp1 xywhite)
        (camino xywhite xydisp1)

        (camino xygreen xydisp1)
        (camino xydisp1 xygreen)

        (camino xygarra xydisp1)
        (camino xydisp1 xygarra)

        (alt zgarra zgreen)
        (alt zgreen zgarra)

        (alt zgarra zwhite)
        (alt zwhite zgarra)
    )

    (:goal
        (and
            (en blueb xydisp1)
            (torre whiteb greenb)
        )
    )
)