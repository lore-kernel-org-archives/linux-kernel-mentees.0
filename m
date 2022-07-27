Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC6C04A68
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Jul 2022 14:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DA260D73;
	Wed, 27 Jul 2022 14:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2DA260D73
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=ZQCB67Mu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IGrq3sW0-S9; Wed, 27 Jul 2022 14:23:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E768260B96;
	Wed, 27 Jul 2022 14:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E768260B96
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83E3AC0033;
	Wed, 27 Jul 2022 14:23:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69162C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368D080C58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 368D080C58
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=ZQCB67Mu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mDcp0XTJje2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:23:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F6F980C57
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F6F980C57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658931818; cv=none; d=zohomail.in; s=zohoarc; 
 b=Gn6024WfIqYtxX409/CLXpvCxOVLgbqFJ6qEMea3xTxlY7nwj/9Q9JJrsB0EcxnhgVOQzVC2p8IygGnoZA8HmOcnHuzSa6a9EwwwNIeSSujseaj493ETZ119KI6D0Uk7yMtBbT2gqPq4Lqz6xFC4BCkw8S8gBeapv+Dbhm5+Umk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658931818;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=vJz648pDJtTE6Zea5RSkp7IQnH9AlpVg9o0A4CGYeA0=; 
 b=ciEOj1Fr/2J5wyyAk/UMgLQIynSBGzd3zTddvhElc65sGCBvN4h27IKVqUdaRYy1HNyOImWTt29vbF16MLl8c/D3NLEz135bscA/ilTkCy/rvo0A4Jt/KYx94vz/ZJ6AdE0cGOpp6lgqhSObUR175oHzI2WgUB4AtuK8Gi4Isk0=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658931818; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vJz648pDJtTE6Zea5RSkp7IQnH9AlpVg9o0A4CGYeA0=;
 b=ZQCB67Mu/wHCWnMIR0ae4dmc5rffor0LThYV+OyZtrTDNBN50Kq9kHAK56CX6U68
 cSptNF2hfrpmvhv1IkhduRq6lnqBT5Vz0L825c0y/faH3LGS17I5CE6OYFLfxBCGJ3E
 58kQiv9Bfw9A1RUBTAQAnu+d/6FjeJ/IToUDWh4g=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658931806891187.92810589018586;
 Wed, 27 Jul 2022 19:53:26 +0530 (IST)
Date: Wed, 27 Jul 2022 19:53:26 +0530
To: "David Howells" <dhowells@redhat.com>
Message-ID: <182400a8296.20631a172223.5777840252698367587@siddh.me>
In-Reply-To: <3473429.1658931342@warthog.procyon.org.uk>
References: <20220723135447.199557-1-code@siddh.me>
 <3473429.1658931342@warthog.procyon.org.uk>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

On Wed, 27 Jul 2022 19:45:42 +0530  David Howells <dhowells@redhat.com> wrote:
> Siddh Raman Pant <code@siddh.me> wrote:
> 
> > +++ b/kernel/watch_queue.c
> > ...
> >+#ifdef CONFIG_WATCH_QUEUE
> 
> But it says:
> 
> obj-$(CONFIG_WATCH_QUEUE) += watch_queue.o
> 
> in the Makefile.
> 
> David
> 
> 

Yes, that's what I realised and meant in reply to Khalid.

I had sent a v2, which you can find here:
https://lore.kernel.org/linux-kernel/20220724040240.7842-1-code@siddh.me/

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
