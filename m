Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B45C4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 09:01:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5497420714
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 09:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRL5L2xp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5497420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 325A0876F6;
	Wed,  6 May 2020 09:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K+ECmOlC-WuA; Wed,  6 May 2020 09:01:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F37986B9E;
	Wed,  6 May 2020 09:01:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89C78C0863;
	Wed,  6 May 2020 09:01:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A010C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 09:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47CCA88651
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 09:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVT8sv+vh4r9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 09:01:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5EA4885C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 09:01:30 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97440206B8;
 Wed,  6 May 2020 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588755690;
 bh=4sIpXubP0+sC8ylxmrF8TVm46EBH4JzVOxBG2NmOZFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lRL5L2xpknMLiaSJ2rXgF9zUKhEQqN9Udn0GejmwRbdhZsqrwey3OQXwZLC33P+KZ
 IEoA5XO+CJ4iKAD8MaWXe5MwAIp/Avpg1KyLxKL27NnCbVyCQBPNTq/5xcYW3+3GKb
 n5sasde/HOjxjaCeTe/rcuYpIMWQt7hgSgigiI9s=
Date: Wed, 6 May 2020 11:01:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200506110125.03f42b03@coco.lan>
In-Reply-To: <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
References: <20200503111338.53db66b8@coco.lan>
 <48DFD57D-AE44-4117-A408-F6D557281FB0@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "sean@mess.org" <sean@mess.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 11/11] media: vidtv: Add a MPEG Transport Stream Multiplexer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Em Wed, 6 May 2020 04:05:25 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro! Thank you for reviewing this!
> 
> 
> >> Add a MPEG Transport Stream multiplexer responsible for polling encoders,
> >> interleaving packets, padding the resulting stream with NULL packets if
> >> necessary and then delivering the resulting TS packets to the bridge
> >> driver so it can feed the demux.
> >> 
> >> This patch includes a "channel" abstraction, which attempts to map a
> >> MPEG service into a struct that vidtv can work with.
> >> 
> >> When vidtv boots, it will create some hardcoded channels:
> >> 
> >> -Their services will be concatenated to populate the SDT.
> >> -Their programs will be concatenated to populate the PAT
> >> -For each program in the PAT, a PMT section will be created
> >> -The PMT section for a channel will be assigned its streams.
> >> -Every stream will have its corresponding encoder polled to produce
> >> TS packets
> >> -These packets may be interleaved by the mux and then delivered to
> >> the bridg
> >> 
> >> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>  
> > 
> > The same notes I made on previous patches apply here.  
> 
> I did not understand this. Do you mean to say that I should remove these
> dashes in the beginning of the lines?

No. I just meant to say that I won't be repeating the comments I made
about WARN_ON, bit order, and other generic comments on other patches 
that will also apply here :-)

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
