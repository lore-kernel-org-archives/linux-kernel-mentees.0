Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419ECC25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Aug 2022 07:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2AF541767;
	Sat,  6 Aug 2022 07:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2AF541767
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=mHsfL+o8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xodCzFLwmbjp; Sat,  6 Aug 2022 07:44:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 56F8F41765;
	Sat,  6 Aug 2022 07:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F8F41765
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4C8C0032;
	Sat,  6 Aug 2022 07:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD6A4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C3EA41765
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3EA41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nPp8shWpz4f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D09DB41761
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D09DB41761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659771850; cv=none; d=zohomail.in; s=zohoarc; 
 b=b3K12+SyVErYDwLKEcAAHzlzpWFRanYDGTEPfYDxLCfK93RZLWSUxEUbJHoGiCQ+KIz0F/lFD7ThjB/Dwpx7ZTQGI5l0ImxN9UhMl8NgGL77iElL+TLB75kpTO02raICKgCiLAhg//QjWabE4G0VAzOkRxMw79DmrnnQZ/BoDEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659771850;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=1j9B3a9+XvhyGJpimzS54jknD3atX0UsgCNgtn4m3hM=; 
 b=Bkl7cYgUfX4YpxKlh1KAtZwQPkFBzJXwcghxL5yO+Sp4yJPANM66zKE7lHXwO9QvcRHuGYNbRzkS//DtZtk2o5qSTwbx0GojbB3epfCVyUBuERL0LTrqYDi0FJxXbe2NLGEQg+DmM8BL/j6xL8xE028wJw+OB13vOh5lF5qtQJM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659771850; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1j9B3a9+XvhyGJpimzS54jknD3atX0UsgCNgtn4m3hM=;
 b=mHsfL+o8SGKPIbTca18TuLmfTU56I7rcPPdbriwIMoNtp0iAg+P2DGg0kqcxRxLD
 VzbuE2fxUXC+SxNd+OPHe9cREukH0lQyQ6w7AgSWx3xTkCrMkM/yzZ0gIz75r0lVMtP
 bAmz68oSSokFuv+ZPzHavvwvTEaaBYdxUZlsX/3g=
Received: from localhost.localdomain (43.250.158.93 [43.250.158.93]) by
 mx.zoho.in with SMTPS id 1659771849686186.95964539009788;
 Sat, 6 Aug 2022 13:14:09 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <cover.1659771577.git.code@siddh.me>
Subject: [PATCH v2 0/2] watch_queue: Clean up some code
Date: Sat,  6 Aug 2022 13:13:40 +0530
X-Mailer: git-send-email 2.35.1
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

There is a dangling reference to pipe in a watch_queue after clearing it.
Thus, NULL that pointer while clearing.

This change renders wqueue->defunct superfluous, as the latter is only used
to check if watch_queue is cleared. With this change, the pipe is NULLed
while clearing, so we can just check if the pipe is NULL.

Extending comment for watch_queue->pipe in the definition of watch_queue
made the comment conventionally too long (it was already past 80 chars),
so I have changed the struct annotations to be kerneldoc-styled, so that
I can extend the comment mentioning that the pipe is NULL when watch_queue
is cleared. In the process, I have also hopefully improved documentation
by documenting things which weren't documented before.

Changes in v2:
- Merged the NULLing and removing defunct patches.
- Removed READ_ONCE barrier in lock_wqueue().
- Improved and fixed errors in struct docs.
- Better commit messages.

Siddh Raman Pant (2):
  include/linux/watch_queue: Improve documentation
  kernel/watch_queue: NULL the dangling *pipe, and use it for clear
    check

 include/linux/watch_queue.h | 100 ++++++++++++++++++++++++++----------
 kernel/watch_queue.c        |  12 ++---
 2 files changed, 79 insertions(+), 33 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
