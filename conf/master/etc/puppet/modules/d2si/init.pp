class d2si {
    # Include Role classes ($role variable must be set at top scope)
    include "d2si::role::${::role}"
}
