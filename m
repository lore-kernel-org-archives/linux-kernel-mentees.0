Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C932FC19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E46E829B6;
	Thu,  4 Aug 2022 13:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E46E829B6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=BmE3ziSS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gv29CT52KtjD; Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 60421829EE;
	Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60421829EE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB703C007E;
	Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1342EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B4C61016
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B4C61016
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=BmE3ziSS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tCR2aUS4YdXC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E0860FC0
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5E0860FC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659619869; cv=none; d=zohomail.in; s=zohoarc; 
 b=BuDznUG+XJjgZb6WOz1pkcQ7d1CiQCJ/Rl0Fxs92y5cQAUjXUHkSsOgA4qUBlagjlEwSaJgvM1XrfFP0/bPx+4gZLW7LH3k04lf2UsJ5ehlksME/y+esyGGVnvzL96eCjCZIhERXY6wx/zceqHkH5jmdgtMxCMpPjozI2BcVuDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659619869;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=y1Ovbial2FYc1BrqdnC91HLquYb0VtXHNQSWJNxyGjk=; 
 b=Vt65eUbIR6LC/lPVxeJx2K/5XfUprgeWduCXOQzfPRMSLHVOwoXQqGtThc/ZBwZkUIao4x/pMRrWYV0fueCEmTt9pkxcDfhneYni5CPYO846NCXyGOGyv2jyGBOrEpN+cSkwSXGRVPBYy5QppY/QJy8ozquJzJyWj/orNv4eiqw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659619869; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=y1Ovbial2FYc1BrqdnC91HLquYb0VtXHNQSWJNxyGjk=;
 b=BmE3ziSSl6JohUDLEyLx9hkQtNrVtt4pVMlwGVL5T7lxvJM9+qulfAiFSYYw0yzI
 3fwxlkcUnIXTr/0ZKSxEOH6JZi3QBqN3ksPmBM9Liq7TadXR7ZpSQ7C+gLKYvTj5k/O
 QCewWX5y3RaccVFA598ES41lNj82qLKWXAv528ZQ=
Received: from localhost.localdomain (103.250.137.206 [103.250.137.206]) by
 mx.zoho.in with SMTPS id 1659619867360682.4482276982302;
 Thu, 4 Aug 2022 19:01:07 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <cf470fb02971377e32564224f17897c55a374857.1659618705.git.code@siddh.me>
Subject: [PATCH 1/3 v4] kernel/watch_queue: Remove dangling pipe reference
 while clearing watch_queue
Date: Thu,  4 Aug 2022 19:00:22 +0530
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

If not done, a reference to a freed pipe remains in the watch_queue,
as this function is called before freeing a pipe in free_pipe_info()
(see line 834 of fs/pipe.c).

We also need to use READ_ONCE() in post_one_notification() to prevent the
compiler from optimising and loading a non-NULL value from wqueue->pipe.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes in v4:
- Brought the lines towards the start rather than the end.
- Removed incorrect NULLing of wqueue->pipe->watch_queue.
The latter was pointed out by Eric Biggers <ebiggers@kernel.org>
in reply to v3.

Changes in v3:
- Restored the original unlock order, and clear before unlock.
- Used READ_ONCE() in post path.
This was explained by David Howells <dhowells@redhat.com> in
reply to v1.

Changes in v2:
- Removed the superfluous ifdef guard.

 kernel/watch_queue.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index a6f9bdd956c3..8999c4e3076d 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -99,7 +99,7 @@ static bool post_one_notification(struct watch_queue *wqueue,
 				  struct watch_notification *n)
 {
 	void *p;
-	struct pipe_inode_info *pipe = wqueue->pipe;
+	struct pipe_inode_info *pipe = READ_ONCE(wqueue->pipe);
 	struct pipe_buffer *buf;
 	struct page *page;
 	unsigned int head, tail, mask, note, offset, len;
@@ -606,6 +606,9 @@ void watch_queue_clear(struct watch_queue *wqueue)
 	/* Prevent new notifications from being stored. */
 	wqueue->defunct = true;
 
+	/* This pipe will get freed by caller, and we are anyways clearing. */
+	wqueue->pipe = NULL;
+
 	while (!hlist_empty(&wqueue->watches)) {
 		watch = hlist_entry(wqueue->watches.first, struct watch, queue_node);
 		hlist_del_init_rcu(&watch->queue_node);
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
