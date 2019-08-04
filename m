From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Sun, 4 Aug 2019 16:46:35 +0100
Subject: [Linux-kernel-mentees] [PATCH] Documentation: virt: Fix broken
 reference to virt tree's index
Message-ID: <20190804154635.GA18475@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190804154635.NaDdQcbKlKfTyqC4mI4c5OtUk1OklQYPw97cnHBAOFA@z>

Fix broken reference to virt/index.rst.

Sequel to: 2f5947dfcaec ("Documentation: move Documentation/virtual to
Documentation/virt")

Reported-by: Sphinx

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---
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
