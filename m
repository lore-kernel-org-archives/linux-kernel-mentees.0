From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 01:26:24 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 3/6] Documentation: RCU: Convert
	RCU UP systems to reST
In-Reply-To: <20190623081413.7095-1-c0d1n61at3@gmail.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
Message-ID: <20190625062627.26378-4-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190625062624.aADRb1zr5EYJ-8b0AgWewVCERk_xklA6p6mAqKev9ag@z>

RCU UP systems reST markup.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>
---
 Documentation/RCU/UP.txt | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.txt
index 53bde717017b..67715a47ae89 100644
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
@@ -46,11 +48,13 @@ its arguments would cause it to fail to make the fundamental guarantee
 underlying RCU, namely that call_rcu() defers invoking its arguments until
 all RCU read-side critical sections currently executing have completed.
 
-Quick Quiz #1: why is it -not- legal to invoke synchronize_rcu() in
-	this case?
+Quick Quiz #1:
+	Why is it *not* legal to invoke synchronize_rcu() in this case?
 
+:ref:`Answers to Quick Quiz <answer_quick_quiz_up>`
 
 Example 3: Death by Deadlock
+----------------------------
 
 Suppose that call_rcu() is invoked while holding a lock, and that the
 callback function must acquire this same lock.  In this case, if
@@ -76,25 +80,30 @@ there are cases where this can be quite ugly:
 If call_rcu() directly invokes the callback, painful locking restrictions
 or API changes would be required.
 
-Quick Quiz #2: What locking restriction must RCU callbacks respect?
+Quick Quiz #2:
+	What locking restriction must RCU callbacks respect?
 
+:ref:`Answers to Quick Quiz <answer_quick_quiz_up>`
 
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
 
-Quick Quiz #3: Why can't synchronize_rcu() return immediately on
-	UP systems running preemptable RCU?
+Quick Quiz #3:
+	Why can't synchronize_rcu() return immediately on UP systems running
+	preemptable RCU?
 
+.. _answer_quick_quiz_up:
 
 Answer to Quick Quiz #1:
-	Why is it -not- legal to invoke synchronize_rcu() in this case?
+	Why is it *not* legal to invoke synchronize_rcu() in this case?
 
 	Because the calling function is scanning an RCU-protected linked
 	list, and is therefore within an RCU read-side critical section.
@@ -119,7 +128,7 @@ Answer to Quick Quiz #2:
 
 	This restriction might seem gratuitous, since very few RCU
 	callbacks acquire locks directly.  However, a great many RCU
-	callbacks do acquire locks -indirectly-, for example, via
+	callbacks do acquire locks *indirectly*, for example, via
 	the kfree() primitive.
 
 Answer to Quick Quiz #3:
-- 
2.22.0
