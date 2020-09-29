Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA7CC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 14:51:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E6220757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 14:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4hRlWNY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46E6220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC90186554;
	Tue, 29 Sep 2020 14:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZ8grxRSQe1N; Tue, 29 Sep 2020 14:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2742A864FB;
	Tue, 29 Sep 2020 14:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A057C016F;
	Tue, 29 Sep 2020 14:51:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8855C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9E18186FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 14:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KopqPisQ44NC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 14:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EE48086FBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 14:51:05 +0000 (UTC)
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de
 [95.90.213.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8986220757;
 Tue, 29 Sep 2020 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601391065;
 bh=awysxynaEavNiWkrMGoJ+3iohFJphxuf/7dxcqFCIyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f4hRlWNYxTccQq+r+tsxPYLadqK1OIVMbsyRxTAK3G0ejuwPPAPb/V7VqZxgvajDj
 9TsgJdxgGMGQrp1Ilx+8MLgnawlEa+I+shZiggODhd4LxWwrc9fj8CKBxbrVDsyxtp
 UFUBuO4paZX+zwwiqf4MVl3xmX6w2zXHM7jk4KTs=
Date: Tue, 29 Sep 2020 16:51:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200929165100.4483625c@coco.lan>
In-Reply-To: <8397580E-7905-4B02-B9F5-C3B09794A742@getmailspring.com>
References: <20200929071918.15c018ac@coco.lan>
 <8397580E-7905-4B02-B9F5-C3B09794A742@getmailspring.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH WIP 1/6] media: vidtv: extract
 the initial CRC value to into a #define
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

Em Tue, 29 Sep 2020 06:30:56 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro!
> 
> > Next time, please add a patch 0, specially when you tag something as
> > WIP, or RFC.  
> 
> Sorry about that :)
> 
> These are almost good but I came across some weird kasan output.
> 
> Can you test this series in a kernel with kasan instrumentation turned on?
> 
> Should apply just fine on top of your latest changes in mchehab-experimental/vidtv

I'm currently focusing preparing some things for the merge window.

I can try to test them after it.

Btw, before testing those patches, you should test with KASAN and
with the memory leak detector if everything is being de-allocated
when the drivers are removed from the memory.

If you find something wrong there, I suggest you to fix the
found issues before applying the new NIT and EDT tables support,
as it may help to check what it could be happening after the
patches.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
