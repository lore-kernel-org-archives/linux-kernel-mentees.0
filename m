Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A64C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 19:43:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1617320782
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 19:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ6vgzcy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1617320782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D23D86B65;
	Thu, 29 Oct 2020 19:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXy-0BVhmEQS; Thu, 29 Oct 2020 19:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6656E86B16;
	Thu, 29 Oct 2020 19:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41DD0C088B;
	Thu, 29 Oct 2020 19:43:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE8BAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 19:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B890487507
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 19:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6QGDGys1Pf+G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 19:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94BA6874FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 19:43:34 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f97so3433394otb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 12:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QMHkktR1AN54Wg0N9KepSSR48GY6n2n3J7dgBzNGJ4=;
 b=pZ6vgzcyAmAduZZuhmFC7CzdRl00JkSe8XPtDSW97WlwaZhthA2W/y0y6FHYC1G8d7
 EAUeUvDtVpBuT5pqhiKEv3kB7xtCl8HLzdOalGuTkqa0PnJ+cWZzDks8z0qw5Ofpbepr
 Z7CaFmhH1x/eJuHMEHwk+UQJNuvG+LOZk4Rmz4QF9KK4S5tn93cKH+bvW/q8nAwu5gMd
 gguetN8h5US3GGEseDCCLyKDMYQ6ZeTM2lYSgiJj4Nbj0p4Kugkp/paxa1Tzm3SgfAGe
 vFLRWF+2g7cbUedsAIqMYMlhXdSadygau94iSOe68autOYuM8MgDG3w0uMv1QIhSggJr
 O5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QMHkktR1AN54Wg0N9KepSSR48GY6n2n3J7dgBzNGJ4=;
 b=Y6vqeIv5FdZskTWHewrNQeRpz6VVO72EbFD2A5+MvrudNp7JamefpU4P+KknpQki44
 6vNMkSV6TPDK+snsK6Vmmz8cgrqjb/7zBGX4xDAyf1rQnHbf1wTTUHvp324uHZJB6lPl
 U/HYjX0/S6PNAXS2fmdWdbfXtf1p2Uh9wDIGaJClDmVw9aPgiGKM9M26oyWsE+UcLYY5
 pz0x/x3cjP3EVIwGXK7LVrXhgJnBlQfWx245tUBgLsyTu5cl+ED+iG+IND9TGKpKw7r4
 YAP9IrpmuhFOPPIt55n/EvwEAQNq70MnOX2QrT5cfb85F2baVf3oXoBdzxYk7OOfY9vF
 sO3w==
X-Gm-Message-State: AOAM533G71etXLm/VI3nsjR/x72sSX8hOzZ/MedlpARvSiBeWVnlimfw
 829es4k7l1VbmXCtJtXvF6e0s7Y3ejigKCzH78c=
X-Google-Smtp-Source: ABdhPJzq+PMt3L4KnWa57m8kNYD8b6eE9snTv9Xr68u8xGP/FXlBuaQ3Rphk6nP43gA/ZrcwtMO1tRII8hZ3uGeDVSY=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr4255633oth.215.1604000613543; 
 Thu, 29 Oct 2020 12:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
 <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
 <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
In-Reply-To: <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 30 Oct 2020 01:13:03 +0530
Message-ID: <CABJPP5AmE1QVMonmvz7TZrEmEqXvd+LUmKzV7Wd5X-2rz8jOHg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

On Thu, Oct 29, 2020 at 9:17 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> >
> > Hi Dwaipayan,
> > I have generated reports on v5.0..v5.4.
> >
> > Relative change in warnings/errors before/after your patch:
> > https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/summary_relative.txt
> >
> > Dropped warnings:
> > https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task4/relative_summary/dropped_warnings
> >
> > There may be some discrepancies due to multi-threading. But it should
> > give us a rough idea.
> >
>
> Thanks Aditya.
>
> Seems like 763 false positives were resolved successfully.
> So I guess the patch is working as intended.
>
> My evaluation is currently running and might need a few
> hours more. I will share it once it completes.
>

The summary of the analysis is as follows:

Commits checked: 47, 377 from v 5.4

Before the patch:
BAD_SIGN_OFF: 1516
FROM_SIGN_OFF_MISMATCH: 931
NO_AUTHOR_SIGN_OFF: 54

After the patch:
BAD_SIGN_OFF: 756
FROM_SIGN_OFF_MISMATCH: 898
NO_AUTHOR_SIGN_OFF: 54

A total of 793 false positives were resolved.

I think this patch does the job.
Lukas, what do you think?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
