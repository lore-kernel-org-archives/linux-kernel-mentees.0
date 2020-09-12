Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24585C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:15:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99EA214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7manp2r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99EA214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5397820426;
	Sat, 12 Sep 2020 09:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyHES9TcYWCd; Sat, 12 Sep 2020 09:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8757920349;
	Sat, 12 Sep 2020 09:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79FA0C0052;
	Sat, 12 Sep 2020 09:15:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18209C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 007C087792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5MDg6a5eD-n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:15:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3427E87785
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:15:13 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B643C214F1;
 Sat, 12 Sep 2020 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599902112;
 bh=W0uhZ2saWfmhse+6fr7q6uAeaNZ/gZdpLyIogvyRkKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m7manp2r2H/9Z5BzHr8rDQ6eNzwZPOMp+UJchMIoJR5dI4QO3NnmoLq93Z2OxcjvF
 r81VAgQkLzPoPJv6qObs9COKnfpy5Yzdcdr0812AVkLXsfUuPLjUppec7koVDBCtoe
 Mk8NYXLQ9SuFROW0tWeCfZqYvBBq4kaJTZm7NOIM=
Date: Sat, 12 Sep 2020 11:15:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <20200912111506.2d2bd512@coco.lan>
In-Reply-To: <94faa1f5-22b2-1a01-0812-526e8cf17596@xs4all.nl>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
 <94faa1f5-22b2-1a01-0812-526e8cf17596@xs4all.nl>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: r.verdejo@samsung.com, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
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

Hi Hans/Daniel,

Em Sat, 12 Sep 2020 10:21:59 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> > Building vidtv
> > --------------
> > vidtv is a test driver and thus is **not** enabled by default when
> > compiling the kernel.
> > 
> > In order to enable compilation of vidtv:
> > 
> > - Enable **DVB_TEST_DRIVERS**, then
> > - Enable **DVB_VIDTV**
> > 
> > When compiled as a module, expect the following .ko files:
> > 
> > - dvb_vidtv_tuner.ko
> > 
> > - dvb_vidtv_demod.ko
> > 
> > - dvb_vidtv_bridge.ko  
> 
> Why the dvb_ prefix? All virtual drivers just start with 'vi'.
> 
> And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
> Just like the other virtual media drivers?

It is a sort of standard to use dvb_* for pure digital tv
bridge drivers.

Yet, I agree with you that at least an alias is needed.
earlier today, I wrote a patch with such purpose:

	https://patchwork.linuxtv.org/project/linux-media/patch/fccf254e33bdd169dde6bdd6f941cf773c82a1c0.1599901499.git.mchehab+huawei@kernel.org/

Still, maybe we should move dvb_vidtv_tuner.ko and dvb_vidtv_demod.ko
to dvb-frontends and rename them. Not 100% sure about that, though.

I would also rename vidtv_bridge.c to just vidtv.c.


Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
