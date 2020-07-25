Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1CBC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 18:25:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5592070B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 18:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2n1xKBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5592070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8D0588254;
	Sat, 25 Jul 2020 18:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8pMJZX509Un; Sat, 25 Jul 2020 18:25:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 636AB880A0;
	Sat, 25 Jul 2020 18:25:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A1C4C004D;
	Sat, 25 Jul 2020 18:25:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 605B8C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 592BA88254
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZ9R5p-alrwa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 18:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DFA6B880A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 18:25:10 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88CC5206D7;
 Sat, 25 Jul 2020 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595701510;
 bh=Dq8mUWOBlA+CBHS/3t+mQ9cNSU1dWsOLOi1XG49t8hM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G2n1xKBvRbijSrFphE2XU2ZGjv478I3RfCkDSELHUv000Xni/x4J58J1pzLJIRCTL
 D4TmaMr1sn7yH7BH9vsQnUrM3tBlX0Aju3Atdgg+lQ3Ea7qaGDdiIVXG5oSDYHxhZp
 ZW+jINN+N3ZXma0l7P5zkSjoDq6E7034huYJwPsw=
Date: Sat, 25 Jul 2020 20:25:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <20200725202506.1db9dd3b@coco.lan>
In-Reply-To: <1cd01ac5-55f7-68f5-791b-ae4955d916d7@linuxfoundation.org>
References: <20200608191333.1784963-1-dwlsalmeida@gmail.com>
 <1cd01ac5-55f7-68f5-791b-ae4955d916d7@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, allison@lohutok.net,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v7 0/4] media: vidtv: implement a virtual DVB driver
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

Em Fri, 24 Jul 2020 17:43:55 -0600
Shuah Khan <skhan@linuxfoundation.org> escreveu:

> Hi Mauro,
> 
> On 6/8/20 1:13 PM, Daniel W. S. Almeida wrote:
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > This series is work in progress. It represents the current work done on a
> > virtual DVB driver for the Linux media subsystem. I am new to the media
> > subsystem and to kernel development in general.
> > 
> > This driver aims to:
> > 	- Serve as template for new DVB driver writers
> > 	- Help userspace application writers in general
> > 	- Push fake audio/video to userspace for testing
> > 		purposes
> > 	- Push debug information to userspace via debugfs
> > The Virtual Digital TV Driver (vidtv)  
> 
> Any feedback on this patch series for Daniel. He has been waiting for
> reviews and feedback from media developers for a while now.
> 
> Please review the patches and give him feedback and help him with
> next steps.

I'll seek for some time to look and review them next week.

What's the current status of it? Is it probing properly and working
fine, or are there any known bugs at the code?

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
