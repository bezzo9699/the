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
BZh91AY&SYR=�Z  ���� }���oޮ����    P�f�m�֙Q&B	�&�H=FC@ z�2�H�b(�  h��@ET�Q���=!��z�=@z��#M� 4��#CL��##C 14d�L�C42i��F��FF�@bhɠ���)����n3�n|m�����N$Q���%-O1�����6[T����Ȕ�I%&���}��+�Nr
�'����2h27dh��y���I�A7r�qy���e9v�)�k�N��"��p��8m{��[ǎ�׬�tb�ܭY+V]2Æ��N���٫J=f�����vA�M��n2f��ԉ��a��E��v#�`��L�]�����Ȃ �<7�P������'O���P���,��a��fPT]}蹦�i�������te�+�������͖.T�)�>��0]��_��C~y&�j��J!qq������'���G�l�D�s�8��Go��˪	7�`Sq�&�m2�Qf�{\V���h�׷)��_N����� �����Z#'��	���X ��>X�#@�����M%���*=s7X�>��_Dت�#"�<u�Lp�t���{��F.)hAQ�԰}r���w�-(�0��_�)�/�eAU�qwH��8fa�6jܰ� �f~])���}6��.a���~g0���i�&��a>+���x-CEv�A���ߥ
�5Ck �=3=K��y\�)�N�1`�h���JYТ�rQk�fHt��zh��PUPUN���(5(�(��X��E�)Q��ۨ�"��,�z:��q�Z@,���ʹ�*'���;�_9�V5�EQf7�+/N�H�����r�I�s,1l��A��RB�s����3���8�Y�e�}5S��qMV�p�E�>��5j$Td"gFq ��/����1��Q�ikK�rΌ�[�2��$��I/RBKB���"�(H)� 