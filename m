Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A86C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Sep 2022 09:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969D6813AA;
	Wed, 21 Sep 2022 09:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 969D6813AA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=khov1wpZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1kru4iUJxVD; Wed, 21 Sep 2022 09:28:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 915C381324;
	Wed, 21 Sep 2022 09:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 915C381324
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E0A9C0033;
	Wed, 21 Sep 2022 09:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A66E0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E1384028E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E1384028E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=khov1wpZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPvhE4Lg_MsB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA7040554
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBA7040554
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1663752500; cv=none; d=zohomail.in; s=zohoarc; 
 b=EPpE5etSbCWRHx7VL58v3RguS9JcjYax953uaqhCOGM3TmFqZZNRlbV1KzvMN9eLEHOuzkeEFjNMKEZZoDcIdM1CiNGmyWNv3kXuwJmTZXMDgmM5TeVl9NVSkPGEzQSsVGNUXezte/uJgp/7m6oBjdzgNsGadjCG2AZnWyaxCck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1663752500;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=CciC0JA+1Sl6P741HLOLO7oPE18KzPzTWUnJ9g4NcCY=; 
 b=H7j3yCSbSttrHfHz4KQAH461cXec2S+c/VhWxChElq3GVeuCnE/oORqnGs6neGXS3nTZHVci2shHYNHcdegiuQ1U2VhIGg+wzG4jaTSUy1S+ok4VD+2LDLBakBmfAnl1dugvRa/xckoqnYLihqVFnO73d7kWr0ZHjt1g1WMri3s=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663752500; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=CciC0JA+1Sl6P741HLOLO7oPE18KzPzTWUnJ9g4NcCY=;
 b=khov1wpZorLIEV38rMkMhDZwXiuc1sdZwnAvShUzkRz0gIpQeAU8Y6nqQFkr35In
 Ufz0TfxAPVM+dpRCq+7du2j6jHLrPgyZd805lfSHaORk4mw2inJMfBUrTuex1Aok6Ih
 izU+ZYPCNwRvrp1PjU4WDoU+JlwoTZwspRLJg8u4=
Received: from localhost.localdomain (103.240.204.191 [103.240.204.191]) by
 mx.zoho.in with SMTPS id 1663752499206919.1466534874487;
 Wed, 21 Sep 2022 14:58:19 +0530 (IST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, David Howells <dhowells@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Biggers <ebiggers@kernel.org>
Message-ID: <21ea7a96018db8f140d7c68ca75665064361ad1b.1663750794.git.code@siddh.me>
Subject: [RESEND PATCH v2 2/2] kernel/watch_queue: NULL the dangling *pipe,
 and use it for clear check
Date: Wed, 21 Sep 2022 14:57:46 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1663750794.git.code@siddh.me>
References: <cover.1663750794.git.code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
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
