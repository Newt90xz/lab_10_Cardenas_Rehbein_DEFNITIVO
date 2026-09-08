(define (problem goal-undoo-verde-azul)
    (:domain manito)

    (:objects
        greenb blueb redb whiteb
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

        (libre xydisp1)

        (camino xygarra xygreen)
        (camino xygreen xygarra)
        (camino xygreen xydisp1)
        (camino xydisp1 xygreen)
        (camino xygarra xydisp1)
        (camino xydisp1 xygarra)

        (alt zgarra zgreen)
        (alt zgreen zgarra)
    )

    (:goal
        (and
            (libre greenb)
            (en blueb xydisp1)
        )
    )
)