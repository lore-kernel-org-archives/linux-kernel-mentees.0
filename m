Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B5FC11D3D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 18:07:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1566246A1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 18:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGXEeyU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1566246A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD32181CEB;
	Thu, 27 Feb 2020 18:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVKE2EKlIYx2; Thu, 27 Feb 2020 18:07:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFDBB8533D;
	Thu, 27 Feb 2020 18:07:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5593C1D80;
	Thu, 27 Feb 2020 18:07:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C2E6C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 18:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 458472309D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 18:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oL26hgznMZbi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 18:07:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id DBF3D230A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 18:07:05 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so94810pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 10:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DXpYA4uWFjCld7w/2i2JWerrfYMLcOkZ4f6tlpHJ5Zg=;
 b=EGXEeyU2so7TeL8mrOoWfqXxbEaWvAOrVAKbPgfRMHeVnlVNe4ZCkzT0OkpOO3uJtk
 VaaJOetGJP9NPwO/z475KPLFeZ08j7x7ed5iOP/WKOegVg9uEqGDSHG31Sa1fYFcowfu
 T6HiuXmM4RRWnpKlElNKTxfCyPs1lya5EX4V28vJoAMYQ1PubwjMhkzfpHHGFdrKbryb
 A0aq2yZZYREvLvrRaDSB7SfnknBh0ozwgV91z+UNu9Ni4aSGDy+zxiMukjio0DLsWoUF
 PHmELLp71WCwJw4nKfrpNLPBqlssNccqbu0GGatCQ7ZECGnB2CXffvW0tcToWkJt+qd0
 KaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DXpYA4uWFjCld7w/2i2JWerrfYMLcOkZ4f6tlpHJ5Zg=;
 b=KdsOI8MipunaKpox1ribNe+NSTZimnrwgxFFhei26PHokmzKcROUbl/3OEzQpgPL4q
 d6H4t4uZ1GHCFhmOZF/US7KHMmv7qSyj4SPoE+hkBeg54R+p+DWMtIsZVnjTy8+OtkGJ
 IeoYM7giMne4PNvXo4i1j0TVhSQR5dVlNSeucsM2CjM0956ryAms1jdf0SeGYDFAquVY
 sSBjNuokhSbH01YFLtt6L4PhXcaOmMCr2E+bTuRGIumkEhbiusV2EF1I0lOHVgqwUq2Q
 TVIF+k2RqiXMWSKaC84VXb2VQa0oi0K7H4YiaV2nqB4kq0Z//ndBF8OzEACxO0/x8I42
 RspA==
X-Gm-Message-State: APjAAAUDxwfQCpqHvz8XATp75sKluu3QBxUrUjgksSzjQ1y10b0qMcsn
 vnmhhntE0MJjwRgJULcq6JYDj0G1YLb5tWFw
X-Google-Smtp-Source: APXvYqy1mC1uucBJ03PGY/m8T8w6yBw3AdzpncNLr+l3+yXc+IodzPS8v47/vFJHYfedKRomxUIs8g==
X-Received: by 2002:a17:902:462:: with SMTP id 89mr20554ple.270.1582826824450; 
 Thu, 27 Feb 2020 10:07:04 -0800 (PST)
Received: from localhost.localdomain ([103.46.201.58])
 by smtp.gmail.com with ESMTPSA id d1sm7207096pgj.79.2020.02.27.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:07:03 -0800 (PST)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Date: Thu, 27 Feb 2020 23:36:53 +0530
Message-Id: <20200227180656.15187-1-amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] doc: Convert rculist_nulls.txt to
	rculist_nulls.rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patch converts rculist_nulls from .txt to .rst format, and also adds
it to the index.rst file.

Major changes includes:
1) Addition of section headers and subsection headers.
2) Addition of literal blocks which contains all the codes.
3) Making enumerated list item by changing X) to X. where X is number
   like 1,2,3 etc.

Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
---
 Documentation/RCU/index.rst         |   1 +
 Documentation/RCU/rculist_nulls.rst | 179 ++++++++++++++++++++++++++++
 Documentation/RCU/rculist_nulls.txt | 172 --------------------------
 3 files changed, 180 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/RCU/rculist_nulls.rst
 delete mode 100644 Documentation/RCU/rculist_nulls.txt

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index d60eb4ba2cd0..2cf55bd141b3 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   rculist_nulls
    checklist
    whatisRCU
    rcu
diff --git a/Documentation/RCU/rculist_nulls.rst b/Documentation/RCU/rculist_nulls.rst
new file mode 100644
index 000000000000..8e04de44fe3d
--- /dev/null
+++ b/Documentation/RCU/rculist_nulls.rst
@@ -0,0 +1,179 @@
+.. _rculist_nulls_doc:
+
+Using hlist_nulls to protect read-mostly linked lists and objects using SLAB_TYPESAFE_BY_RCU allocations.
+=========================================================================================================
+
+Please read the basics in Documentation/RCU/listRCU.rst
+
+Using special makers (called 'nulls') is a convenient way
+to solve following problem :
+
+A typical RCU linked list managing objects which are
+allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
+use following algos :
+
+1. Lookup algo
+--------------
+::
+
+   rcu_read_lock()
+   begin:
+   obj = lockless_lookup(key);
+   if (obj) {
+   if (!try_get_ref(obj)) // might fail for free objects
+      goto begin;
+   /*
+      * Because a writer could delete object, and a writer could
+      * reuse these object before the RCU grace period, we
+      * must check key after getting the reference on object
+      */
+   if (obj->key != key) { // not the object we expected
+      put_ref(obj);
+      goto begin;
+      }
+   }
+   rcu_read_unlock();
+
+Beware that lockless_lookup(key) cannot use traditional hlist_for_each_entry_rcu()
+but a version with an additional memory barrier (smp_rmb()) ::
+
+   lockless_lookup(key)
+   {
+      struct hlist_node *node, *next;
+      for (pos = rcu_dereference((head)->first);
+            pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1; }) &&
+            ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
+            pos = rcu_dereference(next))
+         if (obj->key == key)
+            return obj;
+      return NULL;
+
+And note the traditional hlist_for_each_entry_rcu() misses this smp_rmb() ::
+
+   struct hlist_node *node;
+   for (pos = rcu_dereference((head)->first);
+		pos && ({ prefetch(pos->next); 1; }) &&
+		({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
+		pos = rcu_dereference(pos->next))
+      if (obj->key == key)
+         return obj;
+   return NULL;
+}
+
+Quoting Corey Minyard :
+
+"If the object is moved from one list to another list in-between the
+ time the hash is calculated and the next field is accessed, and the
+ object has moved to the end of a new list, the traversal will not
+ complete properly on the list it should have, since the object will
+ be on the end of the new list and there's not a way to tell it's on a
+ new list and restart the list traversal.  I think that this can be
+ solved by pre-fetching the "next" field (with proper barriers) before
+ checking the key."
+
+2. Insert algo
+----------------
+
+We need to make sure a reader cannot read the new 'obj->obj_next' value
+and previous value of 'obj->key'. Or else, an item could be deleted
+from a chain, and inserted into another chain. If new chain was empty
+before the move, 'next' pointer is NULL, and lockless reader can
+not detect it missed following items in original chain ::
+
+   /*
+   * Please note that new inserts are done at the head of list,
+   * not in the middle or end.
+   */
+   obj = kmem_cache_alloc(...);
+   lock_chain(); // typically a spin_lock()
+   obj->key = key;
+   /*
+   * we need to make sure obj->key is updated before obj->next
+   * or obj->refcnt
+   */
+   smp_wmb();
+   atomic_set(&obj->refcnt, 1);
+   hlist_add_head_rcu(&obj->obj_node, list);
+   unlock_chain(); // typically a spin_unlock()
+
+
+3. Remove algo
+--------------
+Nothing special here, we can use a standard RCU hlist deletion.
+But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be reused
+very very fast (before the end of RCU grace period) ::
+
+   if (put_last_reference_on(obj) {
+      lock_chain(); // typically a spin_lock()
+      hlist_del_init_rcu(&obj->obj_node);
+      unlock_chain(); // typically a spin_unlock()
+      kmem_cache_free(cachep, obj);
+   }
+
+
+
+With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
+and extra smp_wmb() in insert function.
+
+For example, if we choose to store the slot number as the 'nulls'
+end-of-list marker for each slot of the hash table, we can detect
+a race (some writer did a delete and/or a move of an object
+to another chain) checking the final 'nulls' value if
+the lookup met the end of chain. If final 'nulls' value
+is not the slot number, then we must restart the lookup at
+the beginning. If the object was moved to the same chain,
+then the reader doesn't care : It might eventually
+scan the list again without harm.
+
+
+1. lookup algo
+--------------
+::
+
+   head = &table[slot];
+   rcu_read_lock();
+   begin:
+   hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
+      if (obj->key == key) {
+         if (!try_get_ref(obj)) // might fail for free objects
+            goto begin;
+         if (obj->key != key) { // not the object we expected
+            put_ref(obj);
+            goto begin;
+         }
+   goto out;
+   }
+   /*
+   * if the nulls value we got at the end of this lookup is
+   * not the expected one, we must restart lookup.
+   * We probably met an item that was moved to another chain.
+   */
+   if (get_nulls_value(node) != slot)
+      goto begin;
+   obj = NULL;
+
+   out:
+   rcu_read_unlock();
+
+2. Insert function
+------------------
+
+::
+
+   /*
+   * Please note that new inserts are done at the head of list,
+   * not in the middle or end.
+   */
+   obj = kmem_cache_alloc(cachep);
+   lock_chain(); // typically a spin_lock()
+   obj->key = key;
+   /*
+   * changes to obj->key must be visible before refcnt one
+   */
+   smp_wmb();
+   atomic_set(&obj->refcnt, 1);
+   /*
+   * insert obj in RCU way (readers might be traversing chain)
+   */
+   hlist_nulls_add_head_rcu(&obj->obj_node, list);
+   unlock_chain(); // typically a spin_unlock()
diff --git a/Documentation/RCU/rculist_nulls.txt b/Documentation/RCU/rculist_nulls.txt
deleted file mode 100644
index 23f115dc87cf..000000000000
--- a/Documentation/RCU/rculist_nulls.txt
+++ /dev/null
@@ -1,172 +0,0 @@
-Using hlist_nulls to protect read-mostly linked lists and
-objects using SLAB_TYPESAFE_BY_RCU allocations.
-
-Please read the basics in Documentation/RCU/listRCU.rst
-
-Using special makers (called 'nulls') is a convenient way
-to solve following problem :
-
-A typical RCU linked list managing objects which are
-allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
-use following algos :
-
-1) Lookup algo
---------------
-rcu_read_lock()
-begin:
-obj = lockless_lookup(key);
-if (obj) {
-  if (!try_get_ref(obj)) // might fail for free objects
-    goto begin;
-  /*
-   * Because a writer could delete object, and a writer could
-   * reuse these object before the RCU grace period, we
-   * must check key after getting the reference on object
-   */
-  if (obj->key != key) { // not the object we expected
-     put_ref(obj);
-     goto begin;
-   }
-}
-rcu_read_unlock();
-
-Beware that lockless_lookup(key) cannot use traditional hlist_for_each_entry_rcu()
-but a version with an additional memory barrier (smp_rmb())
-
-lockless_lookup(key)
-{
-   struct hlist_node *node, *next;
-   for (pos = rcu_dereference((head)->first);
-          pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1; }) &&
-          ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
-          pos = rcu_dereference(next))
-      if (obj->key == key)
-         return obj;
-   return NULL;
-
-And note the traditional hlist_for_each_entry_rcu() misses this smp_rmb() :
-
-   struct hlist_node *node;
-   for (pos = rcu_dereference((head)->first);
-		pos && ({ prefetch(pos->next); 1; }) &&
-		({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
-		pos = rcu_dereference(pos->next))
-      if (obj->key == key)
-         return obj;
-   return NULL;
-}
-
-Quoting Corey Minyard :
-
-"If the object is moved from one list to another list in-between the
- time the hash is calculated and the next field is accessed, and the
- object has moved to the end of a new list, the traversal will not
- complete properly on the list it should have, since the object will
- be on the end of the new list and there's not a way to tell it's on a
- new list and restart the list traversal.  I think that this can be
- solved by pre-fetching the "next" field (with proper barriers) before
- checking the key."
-
-2) Insert algo :
-----------------
-
-We need to make sure a reader cannot read the new 'obj->obj_next' value
-and previous value of 'obj->key'. Or else, an item could be deleted
-from a chain, and inserted into another chain. If new chain was empty
-before the move, 'next' pointer is NULL, and lockless reader can
-not detect it missed following items in original chain.
-
-/*
- * Please note that new inserts are done at the head of list,
- * not in the middle or end.
- */
-obj = kmem_cache_alloc(...);
-lock_chain(); // typically a spin_lock()
-obj->key = key;
-/*
- * we need to make sure obj->key is updated before obj->next
- * or obj->refcnt
- */
-smp_wmb();
-atomic_set(&obj->refcnt, 1);
-hlist_add_head_rcu(&obj->obj_node, list);
-unlock_chain(); // typically a spin_unlock()
-
-
-3) Remove algo
---------------
-Nothing special here, we can use a standard RCU hlist deletion.
-But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be reused
-very very fast (before the end of RCU grace period)
-
-if (put_last_reference_on(obj) {
-   lock_chain(); // typically a spin_lock()
-   hlist_del_init_rcu(&obj->obj_node);
-   unlock_chain(); // typically a spin_unlock()
-   kmem_cache_free(cachep, obj);
-}
-
-
-
---------------------------------------------------------------------------
-With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
-and extra smp_wmb() in insert function.
-
-For example, if we choose to store the slot number as the 'nulls'
-end-of-list marker for each slot of the hash table, we can detect
-a race (some writer did a delete and/or a move of an object
-to another chain) checking the final 'nulls' value if
-the lookup met the end of chain. If final 'nulls' value
-is not the slot number, then we must restart the lookup at
-the beginning. If the object was moved to the same chain,
-then the reader doesn't care : It might eventually
-scan the list again without harm.
-
-
-1) lookup algo
-
- head = &table[slot];
- rcu_read_lock();
-begin:
- hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
-   if (obj->key == key) {
-      if (!try_get_ref(obj)) // might fail for free objects
-         goto begin;
-      if (obj->key != key) { // not the object we expected
-         put_ref(obj);
-         goto begin;
-      }
-  goto out;
- }
-/*
- * if the nulls value we got at the end of this lookup is
- * not the expected one, we must restart lookup.
- * We probably met an item that was moved to another chain.
- */
- if (get_nulls_value(node) != slot)
-   goto begin;
- obj = NULL;
-
-out:
- rcu_read_unlock();
-
-2) Insert function :
---------------------
-
-/*
- * Please note that new inserts are done at the head of list,
- * not in the middle or end.
- */
-obj = kmem_cache_alloc(cachep);
-lock_chain(); // typically a spin_lock()
-obj->key = key;
-/*
- * changes to obj->key must be visible before refcnt one
- */
-smp_wmb();
-atomic_set(&obj->refcnt, 1);
-/*
- * insert obj in RCU way (readers might be traversing chain)
- */
-hlist_nulls_add_head_rcu(&obj->obj_node, list);
-unlock_chain(); // typically a spin_unlock()
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
