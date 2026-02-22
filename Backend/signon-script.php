<?php
/**

 */

declare(strict_types=1);

// phpcs:disable Squiz.Functions.GlobalFunction

/**
 * This function returns username and password.
 *
.
 *
 * @param string $user User name
 *
 * @return array
 */
function get_login_credentials($user)
{
    /* Optionally we can use passed username */
    if (! empty($user)) {
        return [
            $user,
            'password',
        ];
    }

 
    return [
        'root',
        '',
    ];
}
