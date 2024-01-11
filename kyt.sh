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
BZh91AY&SY8�J  ��� }���oޮ����    P���������I�4�4� h  6I�44�4h �)�SA=&P0@� @�� D�#@�'�Q��&L�S@4������&������F�FL�a �$�&#)�i���42h�� � 
EUGPӚ�&Nc����v�Vpy����!�$S)�%>�1;�W�*J�%8^|y�4�!�i
Hy]�H!��@�f1'�'X���ʹj1�Y��v�!K\V���0�iE�ײj�UB�.����Z_��q�b���3�����rW�9��CFȆ���Q&�m�d�qg��E�&'uC�)Vx�`�k5�T��~c��$Z򑌘y��-E�֋c�PlY5װ��+�i'����y�Q��DjZ¢��F�)I,������s�0�sb>h1'����l�u�]A@�qM0pnT�T$��N�y�r��^&�?L'4+���*��A�"��%@��3�(N�M��daS��/�8+m2��Mh�Y-�9C4L݃ru��H^b^�>j��0��gM�5�Z�v�/���ܨ�a0�x���)�:b����:R�ȯ|]Л�W�ʰڙ�E1��}x�QLt@M�ՠ��1�6���b�`���L�.������s�v��US6��b�0u��,�HYe�6��ܯf�lΑcnY�U�up��lX���1����(cx���++[�/k䗳	ܹBN�ֆ���i��G"�����m"p��o�z��G5"�+�#h��e�ͼ��l��ua�"�l�n���W�Q�l^ށݒ�����2D��L����E����"u8��| 0��c��T�į��W �m��>��z��X��x�6�$�$;�/(i�����Ne�ۺ@�%+
\F�]�GI!�X
Z����"��R�5pmAKC����)�D�(��qj�-I2b�pO�g�:��m�F�Dƙd�+�E�$��It�$�/�w$S�	�$�@