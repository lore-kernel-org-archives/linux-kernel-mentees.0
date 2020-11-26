Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB56CC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:11:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D9E206B5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 10:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPAbBncy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D9E206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B453F8758B;
	Thu, 26 Nov 2020 10:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeEXjlhQZ32u; Thu, 26 Nov 2020 10:11:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACD5F8758C;
	Thu, 26 Nov 2020 10:11:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9C8AC163C;
	Thu, 26 Nov 2020 10:11:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97A11C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 817BC203A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQgXevY1CwIB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 9A6D52039A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 10:11:14 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v14so1732385lfo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 02:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40yOa7KuaVMHzH+0bKU2FME6aacsoYeN0iIZwLBi60k=;
 b=KPAbBncyaXXrU1neNcqJmbZwEFNaBNKn7yG6KXmzw1IAETwlfBY564IZM/7zowj0As
 B9s/JMWqHnus1V+ZAR1iXQG2W00/nfvq2jo6buwD1gTk1E+dDF0bCeLCRCyJsAf87Yc1
 olHUviW2FlCIabnCMu45gaSdEyjaBQRs/on8W13mvI8D692hF74TR0NEhfAosOF8kMe9
 +Ocz1gUjGmkfEiNnlvif1kChdEycP9NRtb37xjG0gWvBIZGq/UfZt0pvsufCAGh6rGQJ
 0VJ2r3nviJ7vrENwMjF/N4k/xz5ZDEfAzPYQx1o4GIkkcmyzVFKvIISIdE8Gf3zLh6Rm
 1h8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40yOa7KuaVMHzH+0bKU2FME6aacsoYeN0iIZwLBi60k=;
 b=lEWtlyln6KfA8LYv1R5w7bz5DTGuGz5tHhFWCMkUY3wHrVMfAMqg0hsxTrr5SWHpfP
 foKNiCcMkbKHCEE5y9LHlsZCtdIxiBWGPiEKQknoJAgpYkuINA3x3nj3ejwXI3jzqTDu
 GQaDXyAOTQSYT5CrhcXA+E17jjUNFfHuwKv4ywq51P9SAcPlnwQTBeR+aaeo2Fa41+0T
 j+6WOIiLQfxMrDf9KpVt2QfQBvJ00hxhtUcEmqd2Z6mS2EUlfO/0H2W/svgQj2O1zIFY
 M1MdqiS19EmY+QkUelA9idti+sGb0+6CBZrFWCF2XHoNim0Bir+pLHyjqhnl7Pa0yZxi
 qL4g==
X-Gm-Message-State: AOAM533UzrRuU+30mAzwu3bzXfM6NC9bSc+WvumbdEAyiDqh66xjWK2L
 +7PVDLBQ+w57l5DOgSZte3puc6NOxE4NvjaxYV8=
X-Google-Smtp-Source: ABdhPJyycfOVVp2To0Xg9XssB/E0MFqqRZIMLxBT3gYh7Rqk+glbRKkq+bRlySkifJ3Ew4jUgd6xh5aBBfLquQYF030=
X-Received: by 2002:a19:8207:: with SMTP id e7mr1076944lfd.372.1606385472590; 
 Thu, 26 Nov 2020 02:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20201126094727.43265-1-dwaipayanray1@gmail.com>
 <20201126100558.GA7169@PWN>
In-Reply-To: <20201126100558.GA7169@PWN>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 26 Nov 2020 15:40:43 +0530
Message-ID: <CABJPP5CNHGHddyg5ZtJitWVc=jmfM2ws1Ugd-BLUkxcXmN6mtg@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	TYPO_SPELLING check for words with apostrophe
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

On Thu, Nov 26, 2020 at 3:36 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Thu, Nov 26, 2020 at 03:17:27PM +0530, Dwaipayan Ray wrote:
> > checkpatch reports a false warning for some words containing an
> > apostrophe.
> >
> > A false positive is "doesn't". Occurrence of the word causes
> > checkpatch to emit the following warning:
> >
> > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> >
> > Check if any word character is present after the word boundary
> > in such cases. If present, it means a subpart of the word has
> > been matched and a warning should not be emitted.
> >
> > Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks for fixing it! Glad to see checkpatch is happy :)
>
> FWIW, the patch is:
> Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
>
Thanks for testing it Peilin!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
