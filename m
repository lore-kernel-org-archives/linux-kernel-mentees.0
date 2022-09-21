Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE870ECAAD8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Sep 2022 09:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5A981761;
	Wed, 21 Sep 2022 09:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E5A981761
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=lGEFgPrP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhGI9TCB_Zbp; Wed, 21 Sep 2022 09:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 656A08175A;
	Wed, 21 Sep 2022 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656A08175A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FB52C0033;
	Wed, 21 Sep 2022 09:28:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D453C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDB0D4028E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB0D4028E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=lGEFgPrP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vJofocVGVK0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5324640288
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5324640288
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1663752488; cv=none; d=zohomail.in; s=zohoarc; 
 b=DyPkmnbo/DgdALbJ52LApIG2RqgJrBXp54iMKHR2N8joa9qpQH0xRgYMaegejSefqgsnrjqqSx+Ccn1DYBZQIMgs57/eBSvxYvT8bGUksMEXqTTr44+vEoBOw2hBNnFa9ZvmuHeL3UP94yYFRafb5xdMCVyCVdJgSGRiZKT46dc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1663752488;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=1j9B3a9+XvhyGJpimzS54jknD3atX0UsgCNgtn4m3hM=; 
 b=PLirgJsQpDyE0sg0mrXKK4V5ji2GKVzgNcrtjvL9sXiI0AajxbNhzX/j0Nhpl3ytH2euBv81fYNVwOcKWhQ/deUZONY69m/tvV4elGfQKHiq0nKSMNC56ptUsBdmF3wIdh/bTefRgRHvdLDYXJh4OVbSXiEzC75gG9zZmaY8f7w=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663752488; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1j9B3a9+XvhyGJpimzS54jknD3atX0UsgCNgtn4m3hM=;
 b=lGEFgPrPlgUunVg4iRYjjKsEFUFsp368JW4/G7YMvZJPZGPyESa4w1WqZHQb7RsZ
 igUC8LSnIeOaNuYs2p8WtTP2IFjv1nXx6QF1xaS97Imgr/oWsHsf0LzJ//HxjuzukAu
 h8RFhBAxxyKlg4kUwWStl0MZNXHn0QNj4mumG74w=
Received: from localhost.localdomain (103.240.204.191 [103.240.204.191]) by
 mx.zoho.in with SMTPS id 1663752487704363.0191740785489;
 Wed, 21 Sep 2022 14:58:07 +0530 (IST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, David Howells <dhowells@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Biggers <ebiggers@kernel.org>
Message-ID: <cover.1663750794.git.code@siddh.me>
Subject: [RESEND PATCH v2 0/2] watch_queue: Clean up some code
Date: Wed, 21 Sep 2022 14:57:44 +0530
X-Mailer: git-send-email 2.35.1
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
