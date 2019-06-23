From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 23 Jun 2019 03:14:11 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 5/7] Documentation: RCU: Convert
	RCU UP systems to ReST
In-Reply-To: <20190622090046.178d9d16@lwn.net>
References: <20190622090046.178d9d16@lwn.net>
Message-ID: <20190623081413.7095-6-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190623081411.xVPydVY-u4am_5u4qYnj8srFBCPsHxLDrp6gME33BzU@z>

ReST markup and TOC tree hook.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/UP.txt    | 27 ++++++++++++++-------------
 Documentation/RCU/index.rst |  1 +
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.txt
index 53bde717017b..10fede2acfc0 100644
--- a/Documentation/RCU/UP.txt
+++ b/Documentation/RCU/UP.txt
@@ -1,17 +1,19 @@
-RCU on Uniprocessor Systems
+.. _up_doc:
 
+RCU on Uniprocessor Systems
+===========================
 
 A common misconception is that, on UP systems, the call_rcu() primitive
 may immediately invoke its function.  The basis of this misconception
 is that since there is only one CPU, it should not be necessary to
 wait for anything else to get done, since there are no other CPUs for
-anything else to be happening on.  Although this approach will -sort- -of-
+anything else to be happening on.  Although this approach will *sort of*
 work a surprising amount of the time, it is a very bad idea in general.
 This document presents three examples that demonstrate exactly how bad
 an idea this is.
 
-
 Example 1: softirq Suicide
+--------------------------
 
 Suppose that an RCU-based algorithm scans a linked list containing
 elements A, B, and C in process context, and can delete elements from
@@ -28,8 +30,8 @@ your kernel.
 This same problem can occur if call_rcu() is invoked from a hardware
 interrupt handler.
 
-
 Example 2: Function-Call Fatality
+---------------------------------
 
 Of course, one could avert the suicide described in the preceding example
 by having call_rcu() directly invoke its arguments only if it was called
@@ -46,11 +48,11 @@ its arguments would cause it to fail to make the fundamental guarantee
 underlying RCU, namely that call_rcu() defers invoking its arguments until
 all RCU read-side critical sections currently executing have completed.
 
-Quick Quiz #1: why is it -not- legal to invoke synchronize_rcu() in
+Quick Quiz #1: why is it *not* legal to invoke synchronize_rcu() in
 	this case?
 
-
 Example 3: Death by Deadlock
+----------------------------
 
 Suppose that call_rcu() is invoked while holding a lock, and that the
 callback function must acquire this same lock.  In this case, if
@@ -78,23 +80,22 @@ or API changes would be required.
 
 Quick Quiz #2: What locking restriction must RCU callbacks respect?
 
-
 Summary
+-------
 
 Permitting call_rcu() to immediately invoke its arguments breaks RCU,
 even on a UP system.  So do not do it!  Even on a UP system, the RCU
-infrastructure -must- respect grace periods, and -must- invoke callbacks
+infrastructure *must* respect grace periods, and *must* invoke callbacks
 from a known environment in which no locks are held.
 
-Note that it -is- safe for synchronize_rcu() to return immediately on
-UP systems, including !PREEMPT SMP builds running on UP systems.
+Note that it *is* safe for synchronize_rcu() to return immediately on
+UP systems, including PREEMPT SMP builds running on UP systems.
 
 Quick Quiz #3: Why can't synchronize_rcu() return immediately on
 	UP systems running preemptable RCU?
 
-
 Answer to Quick Quiz #1:
-	Why is it -not- legal to invoke synchronize_rcu() in this case?
+	Why is it *not* legal to invoke synchronize_rcu() in this case?
 
 	Because the calling function is scanning an RCU-protected linked
 	list, and is therefore within an RCU read-side critical section.
@@ -119,7 +120,7 @@ Answer to Quick Quiz #2:
 
 	This restriction might seem gratuitous, since very few RCU
 	callbacks acquire locks directly.  However, a great many RCU
-	callbacks do acquire locks -indirectly-, for example, via
+	callbacks do acquire locks *indirectly*, for example, via
 	the kfree() primitive.
 
 Answer to Quick Quiz #3:
diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 5a19c3642e88..8349dd598bb8 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -9,6 +9,7 @@ RCU concepts
 
    rcu
    list_rcu
+   up_rcu
 
 .. only:: subproject and html
 
-- 
2.22.0
