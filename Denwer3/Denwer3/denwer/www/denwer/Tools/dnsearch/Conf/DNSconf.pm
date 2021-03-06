# +-------------------------------------------------------------------------+
# | Config for DNSearch (Denwer Search)                                     |
# +-------------------------------------------------------------------------+
# | Copyright ? Anton Sushchev aka Ant <http://forum.dklab.ru/users/Ant/>   |
# +-------------------------------------------------------------------------+


package Conf::DNSconf;

# ????, ? ???????? ??????? ?????? (??? Win).
my $drive = chr( ( stat '.' )[ 0 ] + ord( 'A' ) );

################################################################################
#*******************************************************************************
#* ????????? DNSearch
#*

# ????? (????????) ????????? ??????????.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

$TMP_PATH = '/tmp/dnsearch';

# ???? ??? ??????.
# ~~~~~~~~~~~~~~~~

# ???????? ?????????? ??? ??????. ??? ????? ??????. ?????? ?????? ??????? ?? ?????????? ??????:
# ?????? ?????? => [ "???????? ????? ? ?????", "???? ??? ??????", "???? ??? ???????? ? ??????????" ],?
# ?? ?????? ???????????? ???? ???????? ????? ?????. ?????? ?? ????, ??? ?????????? ????? ?????
# ????? ?????-?????? ????????? ?????? (??? ??????? ??????????).
%PATHS = (
	2 => [ "? ?http://localhost/?"     , "/home/localhost/www/"     , "http://localhost"               ],
	3 => [ "? ?$drive:/home/localhost?", "$drive:/home/localhost"   , "file:///$drive:/home/localhost" ],
	4 => [ "? ?/home?"                 , "/home/"                   , "file:///$drive:\\home\\"        ],
	5 => [ "? ?/usr?"                  , "/usr/"                    , "file:///$drive:/usr/"           ],
	6 => [ "? ????? ????? ?$drive?"    , "/"                        , "file:///$drive:/"               ],
);

# ?????????? ??????.
# ~~~~~~~~~~~~~~~~~~

# ????? ????? ???????? ?????????? qr// (qr/^.*?\.shtml$/i).

# ???????? ?????????? ? ??????? ?? ????? ??????.
@NO_SEARCH_DIR = ( 'cgi', 'cgi-bin', 'cgi-glob' );

# ???????? ?????? (??? ??????????) ? ??????? ????? ??????.
@YES_SEARCH_FILE = ( '.htm', '.html', '.shtml', '.xhtml' );

# ???????? ?????? (??? ??????????) ? ??????? ?? ????? ??????.
@NO_SEARCH_FILE = ( );

# ?????? ??????.
# ~~~~~~~~~~~~~~

# ?????????? ????????????? ???????? ?? ????? ???????? ?? ?????????? ????? ???
# ??????????? ? ???????????. ???????? ????????, ?????????? ?????? ???????????
# ? ???? (???? ??? ???????), ?, ?????????????, ??? ??????? ????? ?? ???????,
# ??? ?????? ? ????? ????? ???????? ??? ?? ?????. ?????????? ???? ??????.
$RESULT_BORDER = 200;

# ?????????? ??????????? ?? ???? ????????.
# ?0? ? ??? ????????????? ?????? (???????? ??? ?????).
$RESULTS_PER_PAGE = 10;

# ??????????? ???????????.
# ~~~~~~~~~~~~~~~~~~~~~~~~

# ?0? ? ????????? ??????????? ???????????. ?1? ? ?????????.
# ????? ??? ???????? ?????? ? ??????????, ?????????? ???????? ??? ?????.
$CACHE_YES = 1;

# ???? ? ?????, ??? ????? ?????? ???. ??? ?/? ? ?????!
$CACHE_PATH = $TMP_PATH.'/cache';

# ????? ? ?????, ??????? ??? ????????? ????????.
# ?0? ? ??? ??? ??????????? ?? ??????? (???????????? *??* ?????????????).
$CACHE_MAX_TIME = 10;

# ??????????? ?????? ???? ? ??????????, ?? ?????????? ????????, ?? ????? ??????.
# ?0? - ??? ??? ??????????? ?? ??????? (???????????? *??* ?????????????).
$CACHE_MAX_SIZE = 10;

# ??????????? ?????.
# ~~~~~~~~~~~~~~~~~~

# ?0? ? ????????? ??????????? ?????. ?1? ? ?????????.
$PATHS_CACHE = 1;

# ???? ? ?????, ??? ????? ?????? ???? ? ??????????????? ??????. ??? ?/? ? ?????!
$PATHS_CACHE_PATH = $TMP_PATH;

# ??????????? ?????? ????? ? ??????????????? ??????.
# ?????? ????? ??, ??? ? ? $CACHE_MAX_SIZE.
$PATHS_CACHE_MAX_SIZE = 10;

# ????? ????? $PATHS_CACHE.
# ?????? ????? ??, ??? ? ? $CACHE_MAX_TIME.
$PATHS_CACHE_MAX_TIME = 10;

# ?????? ? ????????.
# ~~~~~~~~~~~~~~~~~~

# ???????? ??????????, ??????? ????????? ??????? ????????.
# ? ????? ?Conf/archive.types? ?????????? ?????????? ?
# ??????????????? ?? ???? ? ??????????? ??? ??????????.
@ARCHIVE_FILE = ( '.chm', '.zip', '.rar' );

# ???????????? ?????? ??????? ??? ??????????. ? ??????????.
# ???? ?????? ?????? ???????? ????????, ?? ????? ??????????
# ?? ????? (??????????????, ?? ????? ???????? ??? ??????).
# ???? ?0?, ?? ??? ???????????.
$ARCHIVE_FILE_MAX_SIZE = 5;

# ???? ? ?????, ??? ????? ?????? ????????????? ?????. ??? ?/? ? ?????!
# ????? ????? ?? ???? ?????? ???? ?????????? ? $VIEW_PATH ? ????? ?viewer.pl?.
$ARCH_PATH = $TMP_PATH.'/arch';

# ??????????? ?????? ????????????? ???????.
# ?????? ????? ??, ??? ? ? $CACHE_MAX_SIZE.
$ARCH_MAX_SIZE = 80;

# ??????????? ?? ?????????? ?????????.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ???????????? ?????????? ?????????, ??????? ????? ???????????? ???????????.
# ?0? ? ??? ???????????.
$MAX_PROCESS_NUMBER = 0;

# ???? ? ?????, ??? ????? ?????? ???? ? ?????????????? ??????????? ?????????.
# ??? ?/? ? ?????!
$MAX_PROCESS_NUMBER_PATH = $TMP_PATH;

# ????? ????? $MAX_PROCESS_NUMBER_PATH.
# ?????? ????? ??, ??? ? ? $CACHE_MAX_TIME.
$MAX_PROCESS_NUMBER_TIME = 1;

#*
#* ????? ???????? DNSearch
#*******************************************************************************
################################################################################

# ???????????? ??? ??????? ? ????????? ?????.
# ?????????? ?????????????.
# ? dk
sub import {
	while( my ( $k, $v ) = each( %{ __PACKAGE__."::" } ) ) {
		next if substr( $k , -1 ) eq ":" || grep { $k eq $_ } qw(BEGIN import);
		*{ caller()."::".$k } = $v;
	}
}

return 1;
