Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A352C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 04:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 216776109E;
	Sun, 24 Jul 2022 04:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 216776109E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=bxpYFGMy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwRhC2LWJ0Zq; Sun, 24 Jul 2022 04:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2525B61096;
	Sun, 24 Jul 2022 04:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2525B61096
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4CF6C0033;
	Sun, 24 Jul 2022 04:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CBBAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18AED84874
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AED84874
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=bxpYFGMy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlEsoMgFAt3o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D40484873
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D40484873
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 04:03:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658635380; cv=none; d=zohomail.in; s=zohoarc; 
 b=DhRurrNjLT/jQinVOHTAyXsUJ7ZU8B/aR5hHDGwSQxE1atVfIxwiP0i+/z5KJyHzh3qROgquK81vwvs9Af+nbI+va5hmlRfttAwEehgwHS/v31tN8DN44wYKkoJpyx1IiF9AXmGVokPH0lNAe1VfIlFjIXzuz8AJMdP8Ijb642g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658635380;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=TMFu4Xh2KHJwOUP3iMlwZuM/07pSct/fqhxURPId8fc=; 
 b=ONpmwPnUmJOAPFI/U2ChDZS04c452xrBAK4YbW7WCfrO8CttpCa6dDpCaIvRJRCl0Ejvz/7Pjl3srhWrq6K6TZBev1U1PZy/tMeLcOQpqJjO7KzUjhaG14YNDkusYzHIxPNv/IMZlyrl6dP2mRuNN/onTweEX2lqMB1d9GudDE8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658635380; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=TMFu4Xh2KHJwOUP3iMlwZuM/07pSct/fqhxURPId8fc=;
 b=bxpYFGMyphYOJFFsmVcBBjJnT5AjoSTfZgk3A3gRfmBYS9QQffMMYjDP948l+p9x
 AdMD4wJH2VNpH+mT/TafXHNCYOoA/BiOnczy9wphvM+04UBQ9KNQoS61APf4OviMyom
 3Axl6X7OUZXqJYXEvOlsSVYsINg+aSJo1wr+U8wU=
Received: from localhost.localdomain (43.250.158.127 [43.250.158.127]) by
 mx.zoho.in with SMTPS id 1658635379700905.0525639502093;
 Sun, 24 Jul 2022 09:32:59 +0530 (IST)
To: David Howells <dhowells@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Message-ID: <20220724040240.7842-1-code@siddh.me>
Subject: [PATCH v2] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Date: Sun, 24 Jul 2022 09:32:40 +0530
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

This causes a UAF when post_one_notification tries to access the pipe on
a key update, which is reported by syzbot.

Bug report: https://syzkaller.appspot.com/bug?id=1870dd7791ba05f2ea7f47f7cbdde701173973fc
Reported-and-tested-by: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
Changes since v1:
- Removed the superfluous ifdef guard.

 kernel/watch_queue.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index bb9962b33f95..0357e5c6cf18 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -637,8 +637,15 @@ void watch_queue_clear(struct watch_queue *wqueue)
 		spin_lock_bh(&wqueue->lock);
 	}
 
-	spin_unlock_bh(&wqueue->lock);
 	rcu_read_unlock();
+
+	/* Clearing the watch queue, so we should clean the associated pipe. */
+	if (wqueue->pipe) {
+		wqueue->pipe->watch_queue = NULL;
+		wqueue->pipe = NULL;
+	}
+
+	spin_unlock_bh(&wqueue->lock);
 }
 
 /**
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
