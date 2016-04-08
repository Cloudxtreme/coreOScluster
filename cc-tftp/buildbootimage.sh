#!/bin/bash
grub2-mkstandalone			\
	--compress=gz			\
	-d /usr/lib/grub/x86_64-efi/	\
	-O x86_64-efi			\
	--fonts="unicode"		\
	-o grub2.efi			\
	grub2.cfg
