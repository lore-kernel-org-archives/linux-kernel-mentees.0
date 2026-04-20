Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6037883D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Apr 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776703809; cv=none; b=c5m4xfJe2JzivcIQ+YU+8LNGsuhk73sLHUm4yWaJbv6NdyEIB3BKY8teL3YylmlLEy04NgaKJAs+VSMiNR0gWRSIWl+QsufTOyfPnvxpezX9UIhrXNULmYiWFrYHg1KPjVcEIURjBjZKNyZbpzfyuAw9g3dIb+om8sUd919KRw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776703809; c=relaxed/simple;
	bh=yxVHxdSp7Dt5zLz1Ul9AB4dMOW5SkdCzihyUkteyqQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+EbD4I7cQLFain0GdGFULN8QN7El/mSz+pfZEV54/VrdIFgslOmiM8I4dM6McffSalMaZ/JoXdFQhSq2xUK6IFr8vzwZyAc/+edV5Dp0ligatT0c4yDwGfnyLE3AvobD44A/GGMhjiT/WfGdJ+qLzh7oNyEgkwZQY2gHGg5qyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QdVFm3qh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f0VyxRcm; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QdVFm3qh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f0VyxRcm"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fzs0k75Y7z9vLh;
	Mon, 20 Apr 2026 18:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2hgMsvze8nGQImJuCGOID1wYWGUzBxU3qKr2x1+dmI=;
	b=QdVFm3qhDwJrmj/iNMVvk9HwEy8CxjiRPlYg1IYCgkuCyVswtv5/ZqqAVQNKuPg3vlwVQB
	ZA6zh9SMOwwzVFqbGWWXYP3FBvA55lIOVffHFdvO1ZeTiN+cnP7UZVpztPNSWansTE+5ri
	bj0g9egLC0kgqRUUJSt/SCMIbQtGOdRIUdWdLbrg8t2plf2o4rKUinHy7drU+52fH6+LB9
	JuZqWxojnzLrPCKVf0H+JCEp0QY4actzUghzH/5f0HxHFZfPI/3fESJWGsdjDlFOfgQotW
	E+WGG+Rwm/wc5NvMSsoSdDmZRpM+lXSP4xCtGMXlHZfAg/6R7QOgxaaoV3auhA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=f0VyxRcm;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776703797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2hgMsvze8nGQImJuCGOID1wYWGUzBxU3qKr2x1+dmI=;
	b=f0VyxRcmDCC0M1WSus9J0Jnh54HeROMjX03oTwPodnCgXCGuIsGJ8r3j9kZcadJDLJ692a
	EZrrcii0rm8EuijBI2yIKBiCTXx1UeDjtib7KmKQvPdezFWGzrId7tu8gZAYTMR0dSP7PG
	bWpuVcgO0fziJVejUzOk2tS8CbtZC2qgbwOzKlHo+tpy5yu0PS/haB0JKDca77hJbkqbFG
	KHzrc/zKKZq+b0hibzCjYlXfpQzQARcnH+pBZSZ/Dc5lL8jsR7H/gEuqaVNhL273I5iESS
	QzmqW16sRs90qY7iC9cIzJV7hJoGpDJQpdl7w6pzHTJSpzy5kZpbt2ojDS09bA==
To: 
Cc: manuelebner@mailbox.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: [PATCH v2 2/3] Documentation: RCU: adopt new coding style of type-aware kmalloc-family
Date: Mon, 20 Apr 2026 18:48:59 +0200
Message-ID: <20260420164901.217461-2-manuelebner@mailbox.org>
In-Reply-To: <20260420164234.217133-2-manuelebner@mailbox.org>
References: <20260420164234.217133-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gckidrm1tbc41r4ixg744hkjtqt4588t
X-MBO-RS-ID: aaa9524bd0a0a62052b
X-Rspamd-Queue-Id: 4fzs0k75Y7z9vLh

Update Documentation/RCU/* to reflect new type-aware kmalloc-family as
suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")

ptr = kmalloc(sizeof(*ptr), gfp);
 -> ptr = kmalloc_obj(*ptr);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/RCU/Design/Requirements/Requirements.rst | 6 +++---
 Documentation/RCU/listRCU.rst                          | 2 +-
 Documentation/RCU/whatisRCU.rst                        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index b5cdbba3ec2e..faca5a9c8c12 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -206,7 +206,7 @@ non-\ ``NULL``, locklessly accessing the ``->a`` and ``->b`` fields.
 
        1 bool add_gp_buggy(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
@@ -228,7 +228,7 @@ their rights to reorder this code as follows:
 
        1 bool add_gp_buggy_optimized(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
@@ -264,7 +264,7 @@ shows an example of insertion:
 
        1 bool add_gp(int a, int b)
        2 {
-       3   p = kmalloc(sizeof(*p), GFP_KERNEL);
+       3   p = kmalloc_obj(*p);
        4   if (!p)
        5     return -ENOMEM;
        6   spin_lock(&gp_lock);
diff --git a/Documentation/RCU/listRCU.rst b/Documentation/RCU/listRCU.rst
index d8bb98623c12..48c7272a4ccc 100644
--- a/Documentation/RCU/listRCU.rst
+++ b/Documentation/RCU/listRCU.rst
@@ -276,7 +276,7 @@ The RCU version of audit_upd_rule() is as follows::
 
 		list_for_each_entry(e, list, list) {
 			if (!audit_compare_rule(rule, &e->rule)) {
-				ne = kmalloc(sizeof(*entry), GFP_ATOMIC);
+				ne = kmalloc_obj(*entry, GFP_ATOMIC);
 				if (ne == NULL)
 					return -ENOMEM;
 				audit_copy_rule(&ne->rule, &e->rule);
diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index a1582bd653d1..770aab8ea36a 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -468,7 +468,7 @@ uses of RCU may be found in listRCU.rst and NMI-RCU.rst.
 		struct foo *new_fp;
 		struct foo *old_fp;
 
-		new_fp = kmalloc(sizeof(*new_fp), GFP_KERNEL);
+		new_fp = kmalloc_obj(*new_fp);
 		spin_lock(&foo_mutex);
 		old_fp = rcu_dereference_protected(gbl_foo, lockdep_is_held(&foo_mutex));
 		*new_fp = *old_fp;
@@ -570,7 +570,7 @@ The foo_update_a() function might then be written as follows::
 		struct foo *new_fp;
 		struct foo *old_fp;
 
-		new_fp = kmalloc(sizeof(*new_fp), GFP_KERNEL);
+		new_fp = kmalloc_obj(*new_fp);
 		spin_lock(&foo_mutex);
 		old_fp = rcu_dereference_protected(gbl_foo, lockdep_is_held(&foo_mutex));
 		*new_fp = *old_fp;
-- 
2.53.0

