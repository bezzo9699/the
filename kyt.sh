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
BZh91AY&SY��i&  ���� }���oޮ����    P�g����ղ�J%<H�i��2h 4�24@�P�i4)�b�� ���  d(@H���i2L�=F�h�@@  �42i��F��FF�@bhɠ��HF���3�L�~��ƣA�m �Ѡ��h�iJ$�z�Yٷ,m~%��$��}�*"Mg�q�@�DG���%ێe��-��DH2�8h�՛�̂�X�B͏�D�T7��V?yL�N+�t/�$�B[Y`)�Gw����k����9��My~u�߲Xɓ>	ŗ��n���᮶B��~�#��{�)=�KFІ��u��E��nytִjN(��C�(�� �;L�x�Fn�d=4�a Sv"�<"�I�aիy��s Ӣ/X��{����a�5#¢��F���I�0QΨf۹�Dŧm!�P�n������o�>>����29:t�(�G\"�4V�Y���]�����J	�ۧ��,q��ӊ]|l�6�VM��2x�8a�^UTQ���KRK�g�_�FƗ[�Tw21
�G�h���@&:����ў>g0��[�9`_�Ӭ�4 L�5�gȣ��P�pW�f�)S�e#ƁMI���Gz����"��^:�.�r�U�Hu��LŌp�g�$ϋx��e�e�T�,ֲȁ2�bV3\��ekaUFr��,+��&
�gݗ�E�v%�KHx�",m�)��a��ΡB�peٲǗR? ��kCE��i�罧ܤ�i���A7\O�2�8�3A<���<���n�c���Ykh�a)�f}n�ñǭǪ���?0슽C��t6�_2*<9̷g05л�n�vp��Vs�������1Q(�R\f^�{�d�-�@A�4)���<��eQEQ�(4�e����n��#�֌C7��78��x�ګ3d�x�	{1U�&�׉�}�ˣ�H�6v��&i��3�&*j0�9�(�nVB(� V���\�,�
��$��I.T������"�(HKm�� 