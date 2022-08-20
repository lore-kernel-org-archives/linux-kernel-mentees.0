Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67C8C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Aug 2022 11:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5893360E38;
	Sat, 20 Aug 2022 11:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5893360E38
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=czsdL8kb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6xAphDWz7Mb; Sat, 20 Aug 2022 11:29:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5777160DFE;
	Sat, 20 Aug 2022 11:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5777160DFE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4100FC0032;
	Sat, 20 Aug 2022 11:29:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EB2AC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C9FE60DFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C9FE60DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYsfwwN7sG4S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:29:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63EA660769
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63EA660769
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Aug 2022 11:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660994946; cv=none; d=zohomail.in; s=zohoarc; 
 b=Nqty8JFgrOxBVH4CzVzB+JLvRqKOQ+RaeObPKiZC2L9vPXlSECC8VEXrWnJw1eDvelBhZHz3sOt7EdaITmBT9F/y/hZ3SC3SNxzFENbOuDRRO+2JTZORa3HicaGPBzAZ5iBHq84T39dgAKEFoErCHjzWFyVgVErvbQQBNtVcQDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660994946;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=/i1BQuBFaVZtsaNVV0P5lReOS+nc8mcEOK2Ji36Irn8=; 
 b=X/FuWa0BtbmySalV7QY8s2gAJo7eQWBW6isSBshOwhmYGuNWg5tvCRC+rnyg65AqhDlMd1MI2eGRcKywq14k+vroDXbfImk/kz4oGEs+7Wa3bpZ8T8Yd/pvXjEXj+e7CP3GPLBEETwaowVQKCzfVd1p0rkcgifdq/jpaOOglt74=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660994946; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/i1BQuBFaVZtsaNVV0P5lReOS+nc8mcEOK2Ji36Irn8=;
 b=czsdL8kbKjKitm2RKCXEdbc0de0vVu2hjz+GQYUzDnZF1A+n72JXfkOwOlx+q3v+
 FwaPLRBx4vuNISqNrmXYH3KrMbDd95XqtN0k1zOvkVysxvhvo6iwGVcFnNnkqiw/2aF
 FWqwxc73EubYj0S/Dsexd+/344zE/Z0X6hBJs5rI=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660994935866227.9120167406926;
 Sat, 20 Aug 2022 16:58:55 +0530 (IST)
Date: Sat, 20 Aug 2022 16:58:55 +0530
To: "Eric Biggers" <ebiggers@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, 
 "David Howells" <dhowells@redhat.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
 "Eric Dumazet" <edumazet@google.com>
Message-ID: <182bb035c23.6b1246ee44934.6791244868891887905@siddh.me>
In-Reply-To: <cover.1659771577.git.code@siddh.me>
References: <cover.1659771577.git.code@siddh.me>
Subject: Re: [PATCH v2 0/2] watch_queue: Clean up some code
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

On Sat, 06 Aug 2022 13:13:40 +0530  Siddh Raman Pant  wrote:
> There is a dangling reference to pipe in a watch_queue after clearing it.
> Thus, NULL that pointer while clearing.
> 
> This change renders wqueue->defunct superfluous, as the latter is only used
> to check if watch_queue is cleared. With this change, the pipe is NULLed
> while clearing, so we can just check if the pipe is NULL.
> 
> Extending comment for watch_queue->pipe in the definition of watch_queue
> made the comment conventionally too long (it was already past 80 chars),
> so I have changed the struct annotations to be kerneldoc-styled, so that
> I can extend the comment mentioning that the pipe is NULL when watch_queue
> is cleared. In the process, I have also hopefully improved documentation
> by documenting things which weren't documented before.
> 
> Changes in v2:
> - Merged the NULLing and removing defunct patches.
> - Removed READ_ONCE barrier in lock_wqueue().
> - Improved and fixed errors in struct docs.
> - Better commit messages.
> 
> Siddh Raman Pant (2):
>   include/linux/watch_queue: Improve documentation
>   kernel/watch_queue: NULL the dangling *pipe, and use it for clear
>     check
> 
>  include/linux/watch_queue.h | 100 ++++++++++++++++++++++++++----------
>  kernel/watch_queue.c        |  12 ++---
>  2 files changed, 79 insertions(+), 33 deletions(-)
> 
> -- 
> 2.35.1

Hello,

Maybe the above quoted patch was missed due to the
then-ongoing merge window. This can be found on:
https://lore.kernel.org/lkml/cover.1659771577.git.code@siddh.me/

This patch was posted 2 weeks ago, with changes as requested.

With the merge window closed, may I request for another look at
this patch?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
