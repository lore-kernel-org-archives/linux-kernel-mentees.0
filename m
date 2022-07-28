Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46537C04A68
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jul 2022 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF49740B91;
	Thu, 28 Jul 2022 15:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF49740B91
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=N6d4JhE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzD56ya9g9Cw; Thu, 28 Jul 2022 15:51:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C503D40B93;
	Thu, 28 Jul 2022 15:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C503D40B93
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3CAFC0033;
	Thu, 28 Jul 2022 15:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81FF0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 15:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68DE4419F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 15:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68DE4419F1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=N6d4JhE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45cibLwnpxi3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 15:51:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472FE417D2
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 472FE417D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 15:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659023494; cv=none; d=zohomail.in; s=zohoarc; 
 b=Uoivu6Vw8N4PfBieS8/LwV2EQRNlD+AssZI3OJn5KE0QEVhIQfeIIvNXCVf0fWZSxTJGRTqElYNdVo5QCmsl9KKqY5H0BV6IqN3i+SIYyXbvD7fO9cKcizRRYSWAJfh2IczAHtdjCQ8d86DVa1zRPtSAZdCbFAsOubhDbPooMs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659023494;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=eIVJdUXeEoFT0XsTWsjdI7cmvorFUz8L2j4z7229AqY=; 
 b=RVch7ePCikqtfxJqLaM+nv8llTUaXEANzYlKNrGZn09b2WiBWDcFingqQn1ztDMm+Qo/4Ta/LmqduVa1kCugIU+55e8oUlIeOq6W2omdIzZORaB7QLqUwWzXCBTcnWkZo+2KICsCACSJnhXZ1HPxvASKVtUYNNgJAa9F+B5wD+w=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659023494; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=eIVJdUXeEoFT0XsTWsjdI7cmvorFUz8L2j4z7229AqY=;
 b=N6d4JhE7ZNMe/aFMTTJJsjLy6QJLLpWLY/QbLPU1ywmqu6AXmKXNk3+CV0gNPZhg
 owpUBrPVFeu9XqnZZN9JKcEn06olrfFAotIDh7BukRhSC+KlhRwrD2Motes9YjZDKor
 H8bneZk037DCCPqx+T1QJD7cIV0hFpj3cQIQkAGU=
Received: from localhost.localdomain (43.250.165.51 [43.250.165.51]) by
 mx.zoho.in with SMTPS id 1659023493370468.4685004171713;
 Thu, 28 Jul 2022 21:21:33 +0530 (IST)
To: David Howells <dhowells@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <20220728155121.12145-1-code@siddh.me>
Subject: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Date: Thu, 28 Jul 2022 21:21:21 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com
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

This causes a UAF when post_one_notification() tries to access the pipe
on a key update, which is reported by syzbot.

We also need to use READ_ONCE() in post_one_notification() to prevent the
compiler from optimising and loading a non-NULL value from wqueue->pipe.

Bug report: https://syzkaller.appspot.com/bug?id=1870dd7791ba05f2ea7f47f7cbdde701173973fc
Reported-and-tested-by: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes in v3:
- Restore the original unlock order, and clear before unlock.
- Use READ_ONCE() in post path.

This was explained by David Howells <dhowells@redhat.com> in
reply to v1. Not added Suggested-by since he didn't reply yet.

Changes in v2:
- Removed the superfluous ifdef guard.

 kernel/watch_queue.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index bb9962b33f95..617425e34252 100644
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
@@ -637,6 +637,12 @@ void watch_queue_clear(struct watch_queue *wqueue)
 		spin_lock_bh(&wqueue->lock);
 	}
 
+	/* Clearing the watch queue, so we should clean the associated pipe. */
+	if (wqueue->pipe) {
+		wqueue->pipe->watch_queue = NULL;
+		wqueue->pipe = NULL;
+	}
+
 	spin_unlock_bh(&wqueue->lock);
 	rcu_read_unlock();
 }
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
