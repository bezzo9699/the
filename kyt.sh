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
BZh91AY&SY���  ��� }���oޮ����    P����;n.��IH�bi4=4���ѐh �i�Ѧ�4�3I�I�2����   4 6� $!�=��I�#F�h�h�@�FF��C��i�@#&@0�`I4�L�=�i�SORi���i�h=L� b�VXv9��d�wӽ�`Ao�L7`s;%0D�2��S�S#�QU}���bS���/w>��B�����X�@�܁~2,]MV�4�5v���$�.B�f�J�Uu�ʣ`1��d�l���+;�9�ݕ�L�U��q��e����%kYl��Xĕ̀j$�m�L�o-RH����h~*��e`��];�r���dP�m3�QiHkaC���>�u�FRr���y��$q~��V���&)��ቊuq���M4�T���+�mܧ��%�gJ �!}��^C ��X���㯘��M��4�i���H��j!�~�hZY��Qq�ݏְ��+:���iy_*�*|����x�m�Qt)�>�%��g0]7`܆��c�o��
�A��
 =i�e�2�I���eObc�����j��2�s���v$��B�8�w��;_tc���E>�ۈ&?���	ȣ�,�
�r��KXբ=a0�.�m����&➵a�V��2�{c��f3f3��6��ޯgl΁enWv+���.���b#�$��3�!�2�ήQYZ��_4�X�6��	:�Z/��Ӧ��������m"p��oQrA~�jEdWBFB���gػ��r�����:E�Y�ߍ�=^=F�mr�~K
6F����1*�4�؍�5a[��v���PH�2W��=�(H�K���	�-����`������p��sl�H�C������àd�a+ m��
�R���b��
:Iڝ�a��3),q���b��Q�2g� '�]���P��ʑ,Q�d�	@�UՐ����Jh��g5�B̿�I/�K�!%Q��"�(HCC��