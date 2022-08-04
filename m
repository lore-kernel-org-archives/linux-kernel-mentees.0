Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2075CC19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 14:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A87B440BF7;
	Thu,  4 Aug 2022 14:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87B440BF7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=SY9bL7SP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqKZehLObFCd; Thu,  4 Aug 2022 14:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9FDFA4010E;
	Thu,  4 Aug 2022 14:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FDFA4010E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BBE2C0033;
	Thu,  4 Aug 2022 14:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5400C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 14:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC8341B61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 14:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC8341B61
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=SY9bL7SP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6fEQDMbLTfu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 14:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F954148F
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63F954148F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 14:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659624162; cv=none; d=zohomail.in; s=zohoarc; 
 b=BmOBmTuIAJgk4riYixnbfjX8OT9SurLggW8ikfzidBlvyU/ANWZGEjNfzwE9JiY2UvdJtCP4+c2BX+V0ort9kAv8UrCRuelqqKVtf6SAuBMkbQHlP1Ty5VPL3Xri+oVUinRBFVC9P00HrUnRz7q8zSlm0xsoJ3xo7a7O02JxpYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659624162;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7EA0R5wGmwD/JzNhBZZkjUXDbI+/3vWFGSun7M1ZaaQ=; 
 b=T0pxtWOFtI4gMm1xJCZK1UzrVcXxtU6VqqDXFm0zl+0ChRPmvkuv6/+WbPm/BPG/105O9ljACWv0TaqZb64YZP/F2SjFE8F/9EJ4kVInq3uBDdz+qEuD75dzvvASctxgL4WxjBorEzLHAyfrwpdqTB76/7CNuDFBjAzmIRykmsk=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659624162; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=7EA0R5wGmwD/JzNhBZZkjUXDbI+/3vWFGSun7M1ZaaQ=;
 b=SY9bL7SPGonkZH9NQRkXL+diHhyqttP5YgR74Ln7gQ+hgkbICvBhIw5cjNBFkXUf
 FepInqobG6cG6ZudcybDY2oXfNkAmhEvLI8E3C9tthfI7BhmDfaK++mWbaI0meSRAOE
 qnGDbc6hEMYO2aKCIRoU83JKscx2smHrQXS+U2HI=
Received: from localhost.localdomain (103.250.137.206 [103.250.137.206]) by
 mx.zoho.in with SMTPS id 1659624159351729.7543272293905;
 Thu, 4 Aug 2022 20:12:39 +0530 (IST)
To: code@siddh.me
Message-ID: <20220804144152.468916-1-code@siddh.me>
Subject: [PATCH v2 3/3] kernel/watch_queue: Remove wqueue->defunct and use
 pipe for clear check
Date: Thu,  4 Aug 2022 20:11:52 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
References: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: ebiggers@kernel.org, corbet@lwn.net, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, edumazet@google.com,
 christophe.jaillet@wanadoo.fr, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The sole use of wqueue->defunct is for checking if the watch queue has
been cleared, but wqueue->pipe is also NULL'd while clearing.

Thus, wqueue->defunct is superfluous, as wqueue->pipe can be checked
for NULL.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes in v2:
- The sent patch had accidentally missed removing the member
  from struct, fix that.
- Use !READ_ONCE() instead of == NULL, as said by checkpatch.pl.

 include/linux/watch_queue.h |  4 +---
 kernel/watch_queue.c        | 14 +++++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index c99c39ec6548..88360771c097 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -55,7 +55,7 @@ struct watch_filter {
  *
  * @rcu: RCU head
  * @filter: Filter on watch_notification::info
- * @pipe: The pipe we're using as a buffer.
+ * @pipe: The pipe we're using as a buffer, NULL when queue is cleared/closed
  * @watches: Contributory watches
  * @notes: Preallocated notifications
  * @notes_bitmap: Allocation bitmap for notes
@@ -63,7 +63,6 @@ struct watch_filter {
  * @lock: Spinlock
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
index 8999c4e3076d..825943cf74b2 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -43,7 +43,7 @@ MODULE_LICENSE("GPL");
 static inline bool lock_wqueue(struct watch_queue *wqueue)
 {
 	spin_lock_bh(&wqueue->lock);
-	if (unlikely(wqueue->defunct)) {
+	if (unlikely(!READ_ONCE(wqueue->pipe))) {
 		spin_unlock_bh(&wqueue->lock);
 		return false;
 	}
@@ -99,15 +99,12 @@ static bool post_one_notification(struct watch_queue *wqueue,
 				  struct watch_notification *n)
 {
 	void *p;
-	struct pipe_inode_info *pipe = READ_ONCE(wqueue->pipe);
+	struct pipe_inode_info *pipe = wqueue->pipe;
 	struct pipe_buffer *buf;
 	struct page *page;
 	unsigned int head, tail, mask, note, offset, len;
 	bool done = false;
 
-	if (!pipe)
-		return false;
-
 	spin_lock_irq(&pipe->rd_wait.lock);
 
 	mask = pipe->ring_size - 1;
@@ -603,10 +600,9 @@ void watch_queue_clear(struct watch_queue *wqueue)
 	rcu_read_lock();
 	spin_lock_bh(&wqueue->lock);
 
-	/* Prevent new notifications from being stored. */
-	wqueue->defunct = true;
-
-	/* This pipe will get freed by caller, and we are anyways clearing. */
+	/* This pipe will get freed by the caller free_pipe_info().
+	 * Removing this reference also prevents new notifications.
+	 */
 	wqueue->pipe = NULL;
 
 	while (!hlist_empty(&wqueue->watches)) {
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
