From: sheriffesseson at gmail.com (Sheriff Esseson)
Date: Fri, 9 Aug 2019 14:23:49 +0100
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: virt: Fix broken
 reference to virt tree's index
Message-ID: <20190809132349.GA15460@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Fix broken reference to virt/index.rst.

Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to
Documentation/virt")

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---

Changes in v2:
	- Fix patch description. 

 Documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 2df5a3da563c..5205430305d5 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -115,7 +115,7 @@ needed).
    target/index
    timers/index
    watchdog/index
-   virtual/index
+   virt/index
    input/index
    hwmon/index
    gpu/index
-- 
2.17.1
