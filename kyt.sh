#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�2  ���� }���oޮ����    P�ۙհAm`���b���4�h  � ��M ��m#SG��S@d h  2  $)�M)�A=OjOP�2d4��@  2�hi���FA�����2h&F!����6�4�Bi�4ځ����=�F���I aF�1(������j�	;��P�~�kD�	thjH"m������rZĿ���1� P��5�sD��$�	|�Y$��T^��]��DE		G�A�0����K����0Vx�>	d%��B��#v��Ek6�b�3����|*ל�١�H���nQ&�m�kh³ऑm�Gb&��R�� ��12ذ�V��L�������=l-��Y䰊 ��N��l i�X��`�vl�@��T!B��ޱw.\����v�8�CR�~(����^2g�r�z-��s���v��GO9n9��AR�!#�OL	Rh5%�1�ؓ�Ȧ��L��V���~����3�JR�É��E̦�y��K�_�/���n͌��q#������֔D];ř�YHh�_�÷yA�H)K�vC�Z4 L���gʣ�Y���4���y�-�:���Ak��d*$��,%L~):0Y���q]p<�;Nj$b������R��"8�a�R���ʷ�Vw�+�j0���3; m�ׯ�E�9��ܯ������6E��h�h�d��R����sj��q̾!'QcCE�Aֶ���5[MQ��D&�`ݢ��9�U	@/��2�q2�����+�H�~z���w�_�Q�l^�Q�%�F
kD�yNq����m�l�Vԅ0OF��g	���F��(KL��/�`�#P���t�*�ӗ֤�bh!��#�)�B���erEr�-P��ʌy�Nf2��b�e)��)(
�4H�1�Ah1���`s���rQ)ۗpǮdpܙ�Ȱ\��ۢa�7v��G J�Zxg�+��$��	$�		,K�.�p�!V
4d