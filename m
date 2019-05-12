From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 23:37:49 -0600
Subject: [Linux-kernel-mentees] [PATCH] tools: gpio: Add
	include/linux/gpio.h to .gitignore
Message-ID: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

File include/linux/gpio.h is generated after building
tools/testing/selftests

Add gpio.h to .gitignore to help clean up working tree status.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 tools/gpio/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index 9e9dd4b681b2..a94c0e83b209 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,4 @@
 gpio-event-mon
 gpio-hammer
 lsgpio
-
+include/linux/gpio.h
--
2.20.1
