Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E3BC6FA81
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 20:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3B760AD1;
	Thu,  1 Sep 2022 20:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C3B760AD1
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=hoDe65Bs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJ3a1wjt5uLk; Thu,  1 Sep 2022 20:07:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 23EFE60A6D;
	Thu,  1 Sep 2022 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23EFE60A6D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0313DC0032;
	Thu,  1 Sep 2022 20:07:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F09B1C007E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C144441750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C144441750
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=hoDe65Bs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPmPnb4Iob77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1077841736
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1077841736
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1662062828; cv=none; d=zohomail.in; s=zohoarc; 
 b=ONerDPfdX90g0etv2BpUZv0RQ/NV4kBTE1n2pd+D7H6cAQiHlSQppu1w0bUfM41ENejrkdk1GX8wLnA3GwervYMppvJqjK5O4/DkHogTivPIW2Oad1oZpwRb7okY/JX1263COhN7Cs7IiSdDsIr4UldaudxZUFhkIpjTlsPkkg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1662062828;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=CciC0JA+1Sl6P741HLOLO7oPE18KzPzTWUnJ9g4NcCY=; 
 b=KLd2FxNzp5QSijabx0YfKiK/nCxzgBBT08bLGJroT7MSBinsrSpD86tZjm+YnyuJ9k5B8uHrC6lg68Hw3V4RqlYBV7CdkaIeU8bYX5i0lbyfgkHo6v7OL2p9Zhueeal8kNzB5iUBOjoBU2OkmoIn3unY4lzl57FaPbFapC9g1DY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662062828; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=CciC0JA+1Sl6P741HLOLO7oPE18KzPzTWUnJ9g4NcCY=;
 b=hoDe65BsScmByWk2StwOsdECPhjE7FCJHqIBQbIlA7jZyet6KkAqAq3g8shZNgJx
 Nqh1hewTv79nBw+yAP43BnBLL71G+YgJeDhW/BupTrfRNKtVBqRLhdNNg7PBQiEv9Zf
 uktufTpEscH3cMdVxWMV8o9nfp6aBDto+97ZZ8KM=
Received: from localhost.localdomain (103.249.233.18 [103.249.233.18]) by
 mx.zoho.in with SMTPS id 1662062827191296.66769203214255;
 Fri, 2 Sep 2022 01:37:07 +0530 (IST)
To: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <ef1791b7f1b5207d9ffae053d8641c9a634a25ea.1659771577.git.code@siddh.me>
Subject: [RESEND PATCH v2 2/2] kernel/watch_queue: NULL the dangling *pipe,
 and use it for clear check
Date: Fri,  2 Sep 2022 01:36:56 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1659771577.git.code@siddh.me>
References: <cover.1659771577.git.code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
Message-ID: <20220901200656.89mWDLT7alrDE4aUUe1yLxnXS8jrXjAad0C8imXwXs0@z>

NULL the dangling pipe reference while clearing watch_queue.

If not done, a reference to a freed pipe remains in the watch_queue,
as this function is called before freeing a pipe in free_pipe_info()
(see line 834 of fs/pipe.c).

The sole use of wqueue->defunct is for checking if the watch queue has
been cleared, but wqueue->pipe is also NULLed while clearing.

Thus, wqueue->defunct is superfluous, as wqueue->pipe can be checked
for NULL. Hence, the former can be removed.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/linux/watch_queue.h |  4 +---
 kernel/watch_queue.c        | 12 ++++++------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index 7f8b1f15634b..d72ad82a4435 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -55,7 +55,7 @@ struct watch_filter {
  *
  * @rcu: RCU head
  * @filter: Filter to use on watches
- * @pipe: The pipe we're using as a buffer
+ * @pipe: The pipe we're using as a buffer, NULL when queue is cleared/closed
  * @watches: Contributory watches
  * @notes: Preallocated notifications
  * @notes_bitmap: Allocation bitmap for notes
@@ -63,7 +63,6 @@ struct watch_filter {
  * @lock: To serialize accesses and removes
  * @nr_notes: Number of notes
  * @nr_pages: Number of pages in notes[]
- * @defunct: True when queues closed
  */
 struct watch_queue {
 	struct rcu_head		rcu;
@@ -76,7 +75,6 @@ struct watch_queue {
 	spinlock_t		lock;
 	unsigned int		nr_notes;
 	unsigned int		nr_pages;
-	bool			defunct;
 };
 
 /**
diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index a6f9bdd956c3..a70ddfd622ee 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -43,7 +43,7 @@ MODULE_LICENSE("GPL");
 static inline bool lock_wqueue(struct watch_queue *wqueue)
 {
 	spin_lock_bh(&wqueue->lock);
-	if (unlikely(wqueue->defunct)) {
+	if (unlikely(!wqueue->pipe)) {
 		spin_unlock_bh(&wqueue->lock);
 		return false;
 	}
@@ -105,9 +105,6 @@ static bool post_one_notification(struct watch_queue *wqueue,
 	unsigned int head, tail, mask, note, offset, len;
 	bool done = false;
 
-	if (!pipe)
-		return false;
-
 	spin_lock_irq(&pipe->rd_wait.lock);
 
 	mask = pipe->ring_size - 1;
@@ -603,8 +600,11 @@ void watch_queue_clear(struct watch_queue *wqueue)
 	rcu_read_lock();
 	spin_lock_bh(&wqueue->lock);
 
-	/* Prevent new notifications from being stored. */
-	wqueue->defunct = true;
+	/*
+	 * This pipe will get freed by the caller free_pipe_info().
+	 * Removing this reference also prevents new notifications.
+	 */
+	wqueue->pipe = NULL;
 
 	while (!hlist_empty(&wqueue->watches)) {
 		watch = hlist_entry(wqueue->watches.first, struct watch, queue_node);
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
