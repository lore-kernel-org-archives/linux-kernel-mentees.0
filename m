From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 23 Jun 2019 03:14:13 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 7/7] Documentation: RCU: Add links
	to rcu.rst
In-Reply-To: <20190622090046.178d9d16@lwn.net>
References: <20190622090046.178d9d16@lwn.net>
Message-ID: <20190623081413.7095-8-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190623081413.mX8_G48gdkjdf1QgUqEINJQsffL7x-FWeMEDe9aQTEg@z>

Add the following links to rcu.rst:
	list_rcu
	up_rcu

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/rcu.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/RCU/rcu.rst b/Documentation/RCU/rcu.rst
index 2b93b128a6fd..3d21ebf66daa 100644
--- a/Documentation/RCU/rcu.rst
+++ b/Documentation/RCU/rcu.rst
@@ -11,8 +11,8 @@ A "grace period" must elapse between the two parts, and this grace period
 must be long enough that any readers accessing the item being deleted have
 since dropped their references.  For example, an RCU-protected deletion
 from a linked list would first remove the item from the list, wait for
-a grace period to elapse, then free the element.  See the listRCU.txt
-file for more information on using RCU with linked lists.
+a grace period to elapse, then free the element.  See :ref:`list_rcu`
+for more information on using RCU with linked lists.
 
 Frequently Asked Questions
 
@@ -49,7 +49,7 @@ Frequently Asked Questions
 - If I am running on a uniprocessor kernel, which can only do one
   thing at a time, why should I wait for a grace period?
 
-  See the UP.txt file in this directory.
+  See :ref:`up_rcu` for more information.
 
 - How can I see where RCU is currently used in the Linux kernel?
 
@@ -67,7 +67,7 @@ Frequently Asked Questions
 
 - Why the name "RCU"?
 
-  "RCU" stands for "read-copy update".  The file listRCU.txt has
+  "RCU" stands for "read-copy update".  :ref:`list_rcu` has
   more information on where this name came from, search for
   "read-copy update" to find it.
 
-- 
2.22.0
