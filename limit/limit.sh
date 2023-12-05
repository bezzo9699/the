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
BZh91AY&SY���5  �߀ ]�3 � >���@�(# � 1�@`��S5 �6�4�Ѧ02���dSTi'���4О2dmM6���{Ԅ�R��}h�"�E����7�$�J�#;&T��;��� �Q5gÆј̱�B�$�ٕ�!"񯏾��Z�vI$�ۼ�c�}\6���}�<Ɓ�G���֎?���Ύ��7�x�?�+�FӶ��<�Zl.0�Z�'��uR�vo�vi�I$�I$�|���>}��4e�~n�+��Ma��F�4`1�L�4`:��t��I�I�RU�L1 Ā���3�D��?
6��w�9(��2���aF�b�>�"D���<J����Q���I':S�K�ņ�xf,T�/�۩]��K]VV��h�����Ln��]up7kQ�`,5Ҝr�=�p��)����