Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B71C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA33261045;
	Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA33261045
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=Vyp62Aw6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOX2D0Upopht; Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EB30261006;
	Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB30261006
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C898DC0032;
	Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68B2BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3089561016
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3089561016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fg8x4v1ueH08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E4D61006
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7E4D61006
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659619868; cv=none; d=zohomail.in; s=zohoarc; 
 b=SZw+8XMbXUhCC9M5zws+UTT4BnqMIiledxtl9zcqM91/pPLeB1UzprgJoS+bXuMSxmjVR/0lTawbBopGawupmsXMbgrse4H0Ty0a3g4ql76W/5ykBkw0P9S3/1JT1JeTdQIAhjdGlVJtfqmpb5cLpJ+dRkHWytGyyqAGbxpMNPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659619868;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=Mkouf4SEWTVHaF7w1SKVoF67Ydf5Jf61GjhuLviyvJI=; 
 b=f1CWY6eayz5V5C9qgyTnEBauougLevVyN+HAyBc1ycM5g3+oddudC54vSThdy/VAxGansevU66EONexIyeD9/t04T8ANaNiteOEoedk0HnYKuhnhMWvSAx9MXQDsqwPIZdOjcaqEfAWxMU3lp7JyrgMJgtoS24QYE3Sf/jE7xcw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659619868; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Mkouf4SEWTVHaF7w1SKVoF67Ydf5Jf61GjhuLviyvJI=;
 b=Vyp62Aw68XEUvrRYpXNy938pR6kpxx37ANsObBuIItdFBuDtb+PFlHVe44b8dllE
 ESyFabbj6UnW/wnj6WsSrH5dZUZmtSfQVVttL2R135evsr901ge8kBxEsSPUzHiK+XO
 XkvyHCxv2TcJrSnCVhsKfgGBq1CuxbHDSZZnAJpQ=
Received: from localhost.localdomain (103.250.137.206 [103.250.137.206]) by
 mx.zoho.in with SMTPS id 1659619866703572.7773396291667;
 Thu, 4 Aug 2022 19:01:06 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <cover.1659618705.git.code@siddh.me>
Subject: [PATCH 0/3] kernel/watch_queue: Clean up some code
Date: Thu,  4 Aug 2022 19:00:21 +0530
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
Thus, NULL that pointer while clearing. This can be thought of as a v4 of
the patches I had sent earlier.

This change renders wqueue->defunct superfluous, as the latter is only used
to check if watch_queue is cleared. With this change, the pipe is NULL'd
while clearing, so we can just check if the pipe is NULL.

Extending comment for watch_queue->pipe in the definition of watch_queue
made the comment conventionally too long (it was already past 80 chars),
so I have changed the struct annotations to be doxygen-styled, so that
I can extend the comment mentioning that the pipe is NULL when watch_queue
is cleared.

Siddh Raman Pant (3):
  kernel/watch_queue: Remove dangling pipe reference while clearing
    watch_queue
  kernel/watch_queue: Improve struct annotation formatting
  kernel/watch_queue: Remove wqueue->defunct and use pipe for clear
    check

 include/linux/watch_queue.h | 95 +++++++++++++++++++++++++++----------
 kernel/watch_queue.c        | 11 ++---
 2 files changed, 75 insertions(+), 31 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
