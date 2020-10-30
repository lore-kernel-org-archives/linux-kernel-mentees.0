Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CFAC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 05:30:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C99AB22202
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 05:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oslRZQQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C99AB22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1AFD5864B2;
	Fri, 30 Oct 2020 05:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTIbk0SDZN+3; Fri, 30 Oct 2020 05:30:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E76FB85EF9;
	Fri, 30 Oct 2020 05:30:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE182C088B;
	Fri, 30 Oct 2020 05:30:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFCFCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 05:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DCEAB22D33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 05:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEdcHa4S4WQW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 05:30:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 94B3B22925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 05:30:36 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id g7so5467751ilr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 22:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZcVlm3Ay0f1SP59UwiCy+PYT14yy5fI5LnxjtijL8M=;
 b=oslRZQQIZtODIrW/5oNOthfDYsBLeNERy9nj97bmGxeX9Okhf62AQan5dAOj8uo/JQ
 7HoxU//XokuXMMdMVyBMAmR2rJLp3S4zWnG1sd02YaoTliXXvK9zyHCWG53isxspMt3B
 g0i0Lm574WspOepdVkRG4YKPBvKSyMeifKZlGt+SOmzOT8aBGzjqo3Kab0QLesK3n4gV
 dErm5s9E9nRfQT+6M7IhuZyuw4OM5JHtH7sAgqPUfWkfvAzmAnApwAHeFcC+ZJS4UeEE
 r60KV4006HCtQj4N0dC0zPpZYIE9HGp/eaueja2UfoZ9MVbxctgl/0muYXYLZgKSAQRT
 AGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZcVlm3Ay0f1SP59UwiCy+PYT14yy5fI5LnxjtijL8M=;
 b=Yfvt7Dpc7k4bkPBLrpEIVlJKD18itI+xylOVcJ1+tCcAWNO/i3salqqKFEV9mtsnhj
 UYLLorEu+Vra8CfELGUyu/mNo4vHCBs0B7GK7uih+0SrVpxt5S2R4TxbjsReIn6NhmC8
 pyofoEMUxxRlY2IiGKvoCj+o9JhjhE3LEFrkCz+jZS8sTy8HSJDdbEoxvswT2DlE2qwE
 OaQJziR+9dgCv1cAhthiTEcv55IGmAvNIQyjrV87GfV/DxPeXa9UTHOP+KZig/InDGeb
 vJtyfxQ4aLuA/dVMTsTxjH+hvAkvlfp9zJoXpixlT25WMDA5j5qPtBOVzIFwjVJdYbjT
 RGaQ==
X-Gm-Message-State: AOAM533PLwG+4SLEkwqjXsq3vFUntqk2IAYVWh9hViC/EvAQ9IjzlEM+
 MfsOeqwYKb5mq9muEMRifkWqaGALk1WGZh7wMmM=
X-Google-Smtp-Source: ABdhPJyd8GPB888xTRoxYzdfzL+c2xV4jyjuB9q1uEpfZav0Ajv6jjHBw4NbzuWAFpilmUQv+EHh+diMXNhbKs+CQWo=
X-Received: by 2002:a05:6e02:4a9:: with SMTP id e9mr699242ils.24.1604035835848; 
 Thu, 29 Oct 2020 22:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
 <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
 <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
 <CABJPP5AmE1QVMonmvz7TZrEmEqXvd+LUmKzV7Wd5X-2rz8jOHg@mail.gmail.com>
In-Reply-To: <CABJPP5AmE1QVMonmvz7TZrEmEqXvd+LUmKzV7Wd5X-2rz8jOHg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 30 Oct 2020 06:30:30 +0100
Message-ID: <CAKXUXMxE6e6NpkYBwB1UtBHvx=s2mANzGcTRr-MGW34HNjRQAQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
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

On Thu, Oct 29, 2020 at 8:43 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Thu, Oct 29, 2020 at 9:17 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > >
> > > Hi Dwaipayan,
> > > I have generated reports on v5.0..v5.4.
> > >
> > > Relative change in warnings/errors before/after your patch:
> > > https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/summary_relative.txt
> > >
> > > Dropped warnings:
> > > https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task4/relative_summary/dropped_warnings
> > >
> > > There may be some discrepancies due to multi-threading. But it should
> > > give us a rough idea.
> > >
> >
> > Thanks Aditya.
> >
> > Seems like 763 false positives were resolved successfully.
> > So I guess the patch is working as intended.
> >
> > My evaluation is currently running and might need a few
> > hours more. I will share it once it completes.
> >
>
> The summary of the analysis is as follows:
>
> Commits checked: 47, 377 from v 5.4
>
> Before the patch:
> BAD_SIGN_OFF: 1516
> FROM_SIGN_OFF_MISMATCH: 931
> NO_AUTHOR_SIGN_OFF: 54
>
> After the patch:
> BAD_SIGN_OFF: 756
> FROM_SIGN_OFF_MISMATCH: 898
> NO_AUTHOR_SIGN_OFF: 54
>
> A total of 793 false positives were resolved.
>
> I think this patch does the job.
> Lukas, what do you think?
>

Agree. The numbers and my quick spot checks suggest it is a good fix
to get merged.

Update the commit message to provide the overall summary of the two
evaluations (by adding them up for the combined git range) and send
the patch to Joe for a quick check.

By the way, I guess it is a good time to share the checkpatch.pl
evaluation scripts with each other, compare them and settle among us
for one common script to use.

(That gives away the mentee intro coding challenge but I am sure we
can come up with a new one...)


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
