FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �
  iTerm Here - Michael "Doc" Norton

  Version 0.1.1

  A Button for opening the iTerm.app and CD-ing to the location of the selected files or folder.
  Inspired by the workflow from Jeroen Leenars, but using iTerm instead of Terminal.
  Additional contributions to concept (and code) from:

    Felipe Meneguzzi
      See http://fmeneguzzi.blogspot.com/2009/09/open-iterm-here.html for more information.

    Marc Liyanage
      See http://putnamhill.net/applescript/open-iterm-here for more information.
     � 	 	� 
     i T e r m   H e r e   -   M i c h a e l   " D o c "   N o r t o n 
 
     V e r s i o n   0 . 1 . 1 
 
     A   B u t t o n   f o r   o p e n i n g   t h e   i T e r m . a p p   a n d   C D - i n g   t o   t h e   l o c a t i o n   o f   t h e   s e l e c t e d   f i l e s   o r   f o l d e r . 
     I n s p i r e d   b y   t h e   w o r k f l o w   f r o m   J e r o e n   L e e n a r s ,   b u t   u s i n g   i T e r m   i n s t e a d   o f   T e r m i n a l . 
     A d d i t i o n a l   c o n t r i b u t i o n s   t o   c o n c e p t   ( a n d   c o d e )   f r o m : 
 
         F e l i p e   M e n e g u z z i 
             S e e   h t t p : / / f m e n e g u z z i . b l o g s p o t . c o m / 2 0 0 9 / 0 9 / o p e n - i t e r m - h e r e . h t m l   f o r   m o r e   i n f o r m a t i o n . 
 
         M a r c   L i y a n a g e 
             S e e   h t t p : / / p u t n a m h i l l . n e t / a p p l e s c r i p t / o p e n - i t e r m - h e r e   f o r   m o r e   i n f o r m a t i o n . 
   
  
 l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    O     &    k    %       Q         r        c        l    ����  l    ����  n        1    ��
�� 
fvtg  l     ����   4   �� !
�� 
cwin ! m   	 
���� ��  ��  ��  ��  ��  ��    m    ��
�� 
alis  o      ���� 0 this_folder    R      ������
�� .ascrerr ****      � ****��  ��    r     " # " 1    ��
�� 
sdsk # o      ���� 0 this_folder     $�� $ n   % % & % I     %�� '���� 0 	open_item   '  (�� ( o     !���� 0 this_folder  ��  ��   &  f     ��    m      ) )�                                                                                  MACS  alis    t  Macintosh HD               �%�?H+   m�
Finder.app                                                      ��̝�d        ����  	                CoreServices    �%�      ̞�     m� � �   6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     * + * l     ��������  ��  ��   +  , - , i     . / . I     �� 0��
�� .aevtodocnull  �    alis 0 o      ���� 0 these_items  ��   / Y       1�� 2 3�� 1 k     4 4  5 6 5 r     7 8 7 n     9 : 9 4    �� ;
�� 
cobj ; o    ���� 0 i   : o    ���� 0 these_items   8 o      ���� 0 	this_item   6  <�� < n    = > = I    �� ?���� 0 	open_item   ?  @�� @ o    ���� 0 	this_item  ��  ��   >  f    ��  �� 0 i   2 m    ����  3 l   	 A���� A I   	�� B��
�� .corecnte****       **** B o    ���� 0 these_items  ��  ��  ��  ��   -  C D C l     ��������  ��  ��   D  E F E i     G H G I      �� I���� 0 	open_item   I  J�� J o      ���� 0 	this_path  ��  ��   H k     e K K  L M L r      N O N l     P���� P n      Q R Q 1    ��
�� 
strq R n      S T S 1    ��
�� 
psxp T o     ���� 0 	this_path  ��  ��   O o      ���� 0 thepath thePath M  U V U r     W X W I    �� Y���� 0 isapprunning isAppRunning Y  Z�� Z m   	 
 [ [ � \ \ 
 i T e r m��  ��   X o      ���� 0 itermrunning iTermRunning V  ] ^ ] l   ��������  ��  ��   ^  _�� _ O    e ` a ` k    d b b  c d c Z    K e f�� g e o    ���� 0 itermrunning iTermRunning f k    / h h  i j i r    " k l k l     m���� m I    ���� n
�� .corecrel****      � null��   n �� o��
�� 
kocl o m    ��
�� 
Ptrm��  ��  ��   l o      ���� 0 myterm myTerm j  p�� p O  # / q r q I  ' .���� s
�� .ITRMLNCHPssn       obj ��   s �� t��
�� 
Pssn t m   ) * u u � v v  D e f a u l t   S e s s i o n��   r o   # $���� 0 myterm myTerm��  ��   g k   2 K w w  x y x I  2 7������
�� .miscactvnull��� ��� null��  ��   y  z { z r   8 > | } | 4  8 <�� ~
�� 
Ptrm ~ m   : ;����  } o      ���� 0 myterm myTerm {  ��  O  ? K � � � I  C J�� ���
�� .miscactvnull��� ��� null � 1   C F��
�� 
Cssn��   � o   ? @���� 0 myterm myTerm��   d  ��� � O   L d � � � O   P c � � � I  W b���� �
�� .ITRMWrtenull���    obj ��   � �� ���
�� 
iTxt � b   Y ^ � � � b   Y \ � � � m   Y Z � � � � �  c d   � o   Z [���� 0 thepath thePath � m   \ ] � � � � �  ;   c l e a r��   � l  P T ����� � 4  P T�� �
�� 
Pssn � m   R S��������  ��   � o   L M���� 0 myterm myTerm��   a m     � ��                                                                                  ITRM  alis    N  Macintosh HD               �%�?H+     +
iTerm2.app                                                      k���         ����  	                Applications    �%�      ��Z�       +  %Macintosh HD:Applications: iTerm2.app    
 i T e r m 2 . a p p    M a c i n t o s h   H D  Applications/iTerm2.app   / ��  ��   F  � � � l     ��������  ��  ��   �  ��� � i     � � � I      �� ����� 0 isapprunning isAppRunning �  ��� � o      ���� 0 app_name  ��  ��   � k     % � �  � � � O     � � � r     � � � 6    � � � 2    ��
�� 
pcap � =    � � � 1   	 ��
�� 
pnam � o    ���� 0 app_name   � o      ���� 0 app_list   � m      � ��                                                                                  sevs  alis    �  Macintosh HD               �%�?H+   m�System Events.app                                               �)̝�d        ����  	                CoreServices    �%�      ̞�     m� � �   =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  ��� � Z    % � ��� � � ?     � � � l    ����� � l    ���� � I   �~ ��}
�~ .corecnte****       **** � o    �|�| 0 app_list  �}  ��  �  ��  ��   � m    �{�{   � L      � � m    �z
�z boovtrue��   � L   # % � � m   # $�y
�y boovfals��  ��       
�x � � � � � ��w�v�u�x   � �t�s�r�q�p�o�n�m
�t .aevtoappnull  �   � ****
�s .aevtodocnull  �    alis�r 0 	open_item  �q 0 isapprunning isAppRunning�p 0 this_folder  �o  �n  �m   � �l �k�j � ��i
�l .aevtoappnull  �   � ****�k  �j   �   � 	 )�h�g�f�e�d�c�b�a
�h 
cwin
�g 
fvtg
�f 
alis�e 0 this_folder  �d  �c  
�b 
sdsk�a 0 	open_item  �i '� # *�k/�,�&E�W X  *�,E�O)�k+ U � �` /�_�^ � ��]
�` .aevtodocnull  �    alis�_ 0 these_items  �^   � �\�[�Z�\ 0 these_items  �[ 0 i  �Z 0 	this_item   � �Y�X�W
�Y .corecnte****       ****
�X 
cobj�W 0 	open_item  �] ! k�j  kh ��/E�O)�k+ [OY�� � �V H�U�T � ��S�V 0 	open_item  �U �R ��R  �  �Q�Q 0 	this_path  �T   � �P�O�N�M�P 0 	this_path  �O 0 thepath thePath�N 0 itermrunning iTermRunning�M 0 myterm myTerm � �L�K [�J ��I�H�G�F u�E�D�C�B � ��A
�L 
psxp
�K 
strq�J 0 isapprunning isAppRunning
�I 
kocl
�H 
Ptrm
�G .corecrel****      � null
�F 
Pssn
�E .ITRMLNCHPssn       obj 
�D .miscactvnull��� ��� null
�C 
Cssn
�B 
iTxt
�A .ITRMWrtenull���    obj �S f��,�,E�O*�k+ E�O� Q� *��l E�O� 	*��l 
UY *j O*�k/E�O� 	*�,j UO� *�i/ *��%�%l UUU � �@ ��?�> � ��=�@ 0 isapprunning isAppRunning�? �< ��<  �  �;�; 0 app_name  �>   � �:�9�: 0 app_name  �9 0 app_list   �  ��8 ��7�6
�8 
pcap �  
�7 
pnam
�6 .corecnte****       ****�= &� *�-�[�,\Z�81E�UO�j j eY f �  � �  )�5
�5 
sdsk�w  �v  �u   ascr  ��ޭ