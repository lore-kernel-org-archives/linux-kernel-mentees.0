From: tranmanphong at gmail.com (Phong Tran)
Date: Sat,  6 Jul 2019 01:55:19 +0700
Subject: [Linux-kernel-mentees] [PATCH] Documentation: usb: convert usb-help
	to rst
Message-ID: <20190705185519.31033-1-tranmanphong@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Add new index.rst and change usb-help.txt format
to rst.

Signed-off-by: Phong Tran <tranmanphong at gmail.com>
---
 Documentation/index.rst                          |  1 +
 Documentation/usb/index.rst                      | 22 ++++++++++++++++++++++
 Documentation/usb/{usb-help.txt => usb-help.rst} |  1 -
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/usb/index.rst
 rename Documentation/usb/{usb-help.txt => usb-help.rst} (97%)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index a7566ef62411..4e7498f39063 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -102,6 +102,7 @@ needed).
    vm/index
    bpf/index
    misc-devices/index
+   usb/index
 
 Architecture-specific documentation
 -----------------------------------
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
new file mode 100644
index 000000000000..5688ceaf0826
--- /dev/null
+++ b/Documentation/usb/index.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linux USB Subsystem Documentation
+===================================
+
+.. only:: html
+
+   .. class:: toc-title
+
+        Table of Contents
+
+.. toctree::
+   :maxdepth: 2
+
+   usb-help
+
+.. only:: html and subproject
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/usb/usb-help.txt b/Documentation/usb/usb-help.rst
similarity index 97%
rename from Documentation/usb/usb-help.txt
rename to Documentation/usb/usb-help.rst
index dc23ecd4d802..03abc4e501ae 100644
--- a/Documentation/usb/usb-help.txt
+++ b/Documentation/usb/usb-help.rst
@@ -1,4 +1,3 @@
-==============
 USB references
 ==============
 
-- 
2.11.0
