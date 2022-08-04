Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C88DC25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 13:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0927F417E0;
	Thu,  4 Aug 2022 13:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0927F417E0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=TerWYYE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfOQb_SXzS0Q; Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B28F6417E5;
	Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28F6417E5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19E0BC0084;
	Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C195C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7D841821
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7D841821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWO3vlCClpaP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA94417E5
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEA94417E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659619870; cv=none; d=zohomail.in; s=zohoarc; 
 b=TArb8JuB1u/dt9SGveolRdb/0G0ugu3aYa+l3KDB45spz+YjqqkVpocnYSOYpQ/2FtLJYxOr/fJskGu4g6puJVbRd3y7vCxPoNi+MTX/H4rRrGDD0VY0S3yE68zhxfbf4hJXZquHpNI2GNDXaMegU05QmRBRPD5JSYRMZysnRvk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659619870;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=e1Cbq8k6/3YzM7j1aQGJtFkkIjPn4LJXoM3g2nk5cLE=; 
 b=ECmeNiDjUWs71VbAz1usqwe1YmiZFKNj7AEja/3WyYIxyUN3RIy211CcdnAnRmpngfN7EnH8D+lp08NCdZqF6apcOgG9fD/YO0xFRBNEbVRutb1X6yQSDn42jQhMQayqxj4fa1la7zJfcA0d9JIXtMM05XtIxJ6DO4E4ico/2p0=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659619870; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=e1Cbq8k6/3YzM7j1aQGJtFkkIjPn4LJXoM3g2nk5cLE=;
 b=TerWYYE9ujbbNkLX1KP/NPA7FWH0FshItw90zSI9pMbk5uqbiFZ1MM1QQDmrKo4u
 rAMb/XAsXRWa62pQNLAz6zHlUwZR3MbC6jxurTeMX83dXLM9NfSw52G00wcN/CTwbCO
 PMQ2/Jg3nSuX7hYK6hUHIvctRhV44QXAwuqpEUwk=
Received: from localhost.localdomain (103.250.137.206 [103.250.137.206]) by
 mx.zoho.in with SMTPS id 1659619868551234.07828767217745;
 Thu, 4 Aug 2022 19:01:08 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
Subject: [PATCH 3/3] kernel/watch_queue: Remove wqueue->defunct and use pipe
 for clear check
Date: Thu,  4 Aug 2022 19:00:24 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1659618705.git.code@siddh.me>
References: <cover.1659618705.git.code@siddh.me>
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

The sole use of wqueue->defunct is for checking if the watch queue has
been cleared, but wqueue->pipe is also NULL'd while clearing.

Thus, wqueue->defunct is superfluous, as wqueue->pipe can be checked
for NULL.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/linux/watch_queue.h |  3 +--
 kernel/watch_queue.c        | 14 +++++---------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index c99c39ec6548..2a3b318db49d 100644
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
diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 8999c4e3076d..c63b128818f4 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -43,7 +43,7 @@ MODULE_LICENSE("GPL");
 static inline bool lock_wqueue(struct watch_queue *wqueue)
 {
 	spin_lock_bh(&wqueue->lock);
-	if (unlikely(wqueue->defunct)) {
+	if (unlikely(READ_ONCE(wqueue->pipe) == NULL)) {
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
