(define (problem goal-undoo-torre-triple)
    ; Esto seria una version plus del escenario 5, donde hay una torre de 3 en vez de 2

    (:domain manito)

    (:objects
        greenb blueb redb
        garra
        xygarra xygreen xydisp1 xydisp2
        zgarra zgreen
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (apilado greenb)

        (en blueb xygreen)
        (pisob blueb zgreen)
        (apilado blueb)

        (en redb xygreen)
        (pisob redb zgreen)
        (libre redb)

        (torre greenb blueb)
        (torre blueb redb)

        (pos garra xygarra)
        (pisog garra zgarra)
        (dismover garra)
        (desocupado garra)

        (libre xydisp1)
        (libre xydisp2)

        (camino xygarra xygreen)
        (camino xygreen xygarra)

        (camino xygarra xydisp1)
        (camino xydisp1 xygarra)

        (camino xygarra xydisp2)
        (camino xydisp2 xygarra)

        (camino xygreen xydisp1)
        (camino xydisp1 xygreen)

        (camino xygreen xydisp2)
        (camino xydisp2 xygreen)

        (alt zgarra zgreen)
        (alt zgreen zgarra)
    )

    (:goal
        (and
            (libre greenb)
            (en blueb xydisp1)
            (en redb xydisp2)
        )
    )
)