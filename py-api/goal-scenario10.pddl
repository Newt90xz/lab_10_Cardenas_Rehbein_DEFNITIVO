(define (problem goal10)
    (:domain manito)

    (:objects
        greenb
        garra
        xygarra xygreen xydisp1
        zgarra zgreen zdisp1
    )

    (:init
        (en greenb xygreen)
        (pisob greenb zgreen)
        (libre greenb)

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

        (alt zgarra zdisp1)
        (alt zdisp1 zgarra)
    )

    (:goal
        (and
            (en greenb xydisp1)
            (pisob greenb zdisp1)
        )
    )
)