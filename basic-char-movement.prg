)
 � PUT PETSCII TEXT AT SCREEN COORDS O � "��PRESS KEYS: Q,A,O,P" v � INIT VARS + SET INITIAL POSITION �( � COL�20 : � ROW�10 : � A�0 �- �                                                THE SCREEN 'MAP' �2 �"" 	3 �"  ###-##########################" 4	4 �"  #      #                     #" \	5 �"  #      #                     #" �	6 �"  #      ####                  #" �	7 �"  #                            #" �	8 �"  #                            #" �	9 �"  #                      #######" $
: �"  #                            I" L
; �"  #             #              #" t
< �"  #             #              #" �
= �"  I         ########           #" �
> �"  #             #              #" �
? �"  #             #              #" @ �"  #      #                     #" <A �"  #      #                     #" dB �"  #      ###                   #" �C �"  #                  ###########" �D �"  #                  #         #" �E �"  #                            #" F �"  #                  #         #" ,G �"  ########################-#####" I�� 3000 : � START RUNNING O�� c�� START OF LOOP w�OX�COL : OY�ROW ��� 2000 : � GET KEYBOARD INPUT �� ROW��OY � COL��OX � � "� " �� 3000 : � SET THE CHAR POS �� "@"; �$� 2021,131 : � C .� 2022,54  : � 6 $8� 2023,52  : � 4 CB� 1000 : � GO BACK TO LOOP IV� b�� GET KEYBOARD INPUT ��� P$ : � PEEK(197) ALSO WORKS ��� PRINT ASC(P$) TO WORK OUT KEYS ��� P$�"O" � COL�COL�1 : � < ��� P$�"P" � COL�COL�1 : � > � P$�"Q" � ROW�ROW�1 : � ^ %� P$�"A" � ROW�ROW�1 : � V ;� COL � 0 � COL�0 S � COL � 39 � COL�39 i*� ROW � 0 � ROW�0 �4� ROW � 23 � ROW�23 �>� �(1024�(ROW�40)�COL)�32 � � �H� DON'T MOVE IF NOT TO A SPACE �RROW�OY : COL�OX �\� �h� �� SET CURSOR ROW AND COLUMN �X�ROW : Y�COL 7�� 780,A : � SET A REGISTER W�� 781,X : � SET X REG (ROW) w�� 782,Y : � SET Y REG (COL) ��� 783,0 : � SET STATUS REG ��� 65520  : � SET THE CURSOR ���   