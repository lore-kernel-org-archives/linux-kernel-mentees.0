From: ds@didiksetiawan.com (Didik Setiawan)
Date: Thu, 10 Oct 2019 13:31:58 +0700
Subject: [Linux-kernel-mentees] [PATCH] Documentation: RCU: Convert RCU
	array to reST
Message-ID: <20191010063158.22261-1-ds@didiksetiawan.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191010063158.dZN6NeDU7fCGp23lBNqiwWuJmwHmZ5QEu-GkzdJ9m_Y@z>

RCU array reST markup.

Signed-off-by: Didik Setiawan <ds at didiksetiawan.com>
---
 .../RCU/{arrayRCU.txt => arrayRCU.rst}        | 20 +++++++++++--------
 Documentation/RCU/index.rst                   |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)
 rename Documentation/RCU/{arrayRCU.txt => arrayRCU.rst} (92%)

diff --git a/Documentation/RCU/arrayRCU.txt b/Documentation/RCU/arrayRCU.rst
similarity index 92%
rename from Documentation/RCU/arrayRCU.txt
rename to Documentation/RCU/arrayRCU.rst
index f05a9afb2c39..6e0cb6d5c1f2 100644
--- a/Documentation/RCU/arrayRCU.txt
+++ b/Documentation/RCU/arrayRCU.rst
@@ -1,5 +1,7 @@
-Using RCU to Protect Read-Mostly Arrays
+.. _array_rcu_doc:
 
+Using RCU to Protect Read-Mostly Arrays
+=======================================
 
 Although RCU is more commonly used to protect linked lists, it can
 also be used to protect arrays.  Three situations are as follows:
@@ -24,16 +26,16 @@ to be safely used.
 That aside, each of the three RCU-protected pointer situations are
 described in the following sections.
 
-
 Situation 1: Hash Tables
+------------------------
 
 Hash tables are often implemented as an array, where each array entry
 has a linked-list hash chain.  Each hash chain can be protected by RCU
 as described in the listRCU.txt document.  This approach also applies
 to other array-of-list situations, such as radix trees.
 
-
 Situation 2: Static Arrays
+--------------------------
 
 Static arrays, where the data (rather than a pointer to the data) is
 located in each array element, and where the array is never resized,
@@ -41,11 +43,13 @@ have not been used with RCU.  Rik van Riel recommends using seqlock in
 this situation, which would also have minimal read-side overhead as long
 as updates are rare.
 
-Quick Quiz:  Why is it so important that updates be rare when
-	     using seqlock?
+Quick Quiz:
+        Why is it so important that updates be rare when using seqlock?
 
+:ref:`Answer to Quick Quiz <answer_quick_quiz_array>`
 
 Situation 3: Resizeable Arrays
+------------------------------
 
 Use of RCU for resizeable arrays is demonstrated by the grow_ary()
 function formerly used by the System V IPC code.  The array is used
@@ -60,7 +64,7 @@ the remainder of the new, updates the ids->entries pointer to point to
 the new array, and invokes ipc_rcu_putref() to free up the old array.
 Note that rcu_assign_pointer() is used to update the ids->entries pointer,
 which includes any memory barriers required on whatever architecture
-you are running on.
+you are running on. ::
 
 	static int grow_ary(struct ipc_ids* ids, int newsize)
 	{
@@ -112,7 +116,7 @@ a simple check suffices.  The pointer to the structure corresponding
 to the desired IPC object is placed in "out", with NULL indicating
 a non-existent entry.  After acquiring "out->lock", the "out->deleted"
 flag indicates whether the IPC object is in the process of being
-deleted, and, if not, the pointer is returned.
+deleted, and, if not, the pointer is returned. ::
 
 	struct kern_ipc_perm* ipc_lock(struct ipc_ids* ids, int id)
 	{
@@ -144,9 +148,9 @@ deleted, and, if not, the pointer is returned.
 		return out;
 	}
 
+.. _answer_quick_quiz_array:
 
 Answer to Quick Quiz:
-
 	The reason that it is important that updates be rare when
 	using seqlock is that frequent updates can livelock readers.
 	One way to avoid this problem is to assign a seqlock for
diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 340a9725676c..75443a0599ed 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -9,6 +9,7 @@ RCU concepts
 
    rcu
    listRCU
+   arrayRCU
    UP
 
 .. only:: subproject and html
-- 
2.23.0
