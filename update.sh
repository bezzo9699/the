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
BZh91AY&SY::v  ���M����ooޮ����    @ΐ�D51)�5L���4�G�����DzODH#F��=)���ښ�4� �4h���M d41 h�h`��	"#Q������&�CSjh�4`�2i�4��)�����㊴ι�z=&��xXk$Mc�,Ԁ�mfv�|�kZi �@Z`PbK�"�ҩ!�o(��&^�lBP�jv��X��Y��U��@�_Kn���q����H�*��k� }����J��Ϟ�9��j'�o=E���٧p/�2E��ʩ$4�#�F�e�.c���co6\�uv��h�U#��@]d[d;/v�/��Ul�,�MI����*іݝ�4}�O'x��ıN�Z-�t܌���G�is�1)�	% JL��a����b�N�Oy�a�7� �u��3@ѣFp�.X"��"'h:;܌�m�YT��s?t�}��m�xeK$3��Y��[���qQ%?l�V�T��"]��2��%�����Z�@�\�L�}���o���`w�ʡK����0�)(,�ϤH`�d�?C3}�I�����V���!��JE� i	EF3���c�Q]I?d��ڮ:؅Q�BQ�'�1�~��8,� �o�mMy'k� �]R��XK���b�#��c�ф�'�,Y�5q��_�zTD����
��ac9�k�a׭��Sg#��A����BQ�gʬ��z�)T���!��-йX�&�p��dj.��5� ��dL@��f&�n��z%I[(Y�pڦ(a)��xY)+���&Z�c��I��\�	+��.�p� 8tt�