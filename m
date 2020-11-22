Return-Path: <SRS0=zGdC=E4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410ECC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 07:52:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE442078E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 07:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3RCpky7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE442078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 496E886B7F;
	Sun, 22 Nov 2020 07:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dtg8-e5KaIcL; Sun, 22 Nov 2020 07:52:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2C5286B7B;
	Sun, 22 Nov 2020 07:52:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3852C163C;
	Sun, 22 Nov 2020 07:52:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20EB8C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 07:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1407B86B7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 07:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzar-d2p03CN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 07:52:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 418E786B7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 07:52:23 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f5so11750115ilj.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 23:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uya8M97MSbquGLSSuEgi1pTq3SA20oRBkUbMUoRL2DM=;
 b=l3RCpky7pEJahNyOzSKPzHEbxrZssTSLX78WpDOiUN7yBHPD54PajJZTrEp4nhrrrb
 PeP0/8+cH3iRxXGARquJKFdPIAm2lULUwXsH20Njh6N26UGC1x1n+4WDOKQee0Leu1/S
 KpLs7wRyPOafpJlCNz+6Gm/iM5/KYrPpausVtbXAY9g9GaK8DhQGRLX5vLE5SgFkonsN
 nhezHUTyPIPlx2IrN4k9MGR/SqsAph/vfrwEQavvTBQsBuliX4r4pbDGJMs3umb1DblO
 bymJQG2ek2iFYFm+wPr2N1DyWkB28oVYL/+V0spd6KBxnmt9LEvI65L6UTnK1q6su5mm
 3NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uya8M97MSbquGLSSuEgi1pTq3SA20oRBkUbMUoRL2DM=;
 b=EsDm6rWsSWevsY96Sj6qNU8RzWGlCPlEMiL13ZjgwB3zBuYf9jc07B9hFWS4eaX5yx
 bT6qaQo2ttcUSkybgdiTkUrF1nFykktkDRULAVKEwyKlbJjKd/TrnuX5YWRNXUMwhjet
 BC4SYJBOB+Hid+c5/WXtZHaJ0GKcgCL/AhWaRoNNn29ejx2kM7cIHmloSFPzvmoHtXvW
 wWuk/35B56iybKeuxAXJfk1xWE/ErFN2Uww4OxHBN1PLm+EUc12Dxo2svjaAVR3A6KEN
 t+IN5Z3Du2cLvVU4fPY6y0wVECCZ9mEqjlq+CKmKlltM29cws64VVFPsFFV6RiLbU3eq
 JAEA==
X-Gm-Message-State: AOAM530ZsPNFTgC16ZAJ2QDqe3LKQqmABjfV//aUOihek+tBbNq98R3S
 yN/41NtE8oOrMVd3N79Dy3I6+GhWJlTuLRzHPXk=
X-Google-Smtp-Source: ABdhPJyyQllnqBTOv2EnvSEVnvvAU2LtNHovkMC1LxZZuh7fm1TTzXW7u+7wlZ4FQ1reHwq8FhemrmPmldNHvmIw5k8=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr14926400ill.64.1606031542550; 
 Sat, 21 Nov 2020 23:52:22 -0800 (PST)
MIME-Version: 1.0
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
In-Reply-To: <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 22 Nov 2020 07:52:13 +0100
Message-ID: <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for NETWORKING_BLOCK_COMMENT_STYLE
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

On Thu, Nov 19, 2020 at 11:44 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
> > On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
> > wrote:
> >
> >> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
> >> if we use an empty '/*' line for comment and contents of comments are
> >> in next line
> >>
> >> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
> >> the refs / unrefs from the transport") reports this warning:
> >>
> >> WARNING: networking block comments don't use an empty /* line, use /*
> >> Comment...
> >> +               /*
> >> +                * If the TXQ is active, then set the timer, if not,
> >>
> >> Provide a fix by appending the current line contents to previous line
> >> and removing the current line
> >>
> >
> > Patch generally looks good.
> >
> > Can you check how many comments in net actually follow that style and how
> > many follow another style?
> >
> >
>
> In drivers/net:
> Wrong style: 14695 lines
> Correct style: 147961 lines (ie around 10 times)
>
> In net/:
> Wrong style: 5090 lines
> Correct style: 30485 lines
>

Can you find out where the wrong style is used?

Maybe the documentation is a bit outdated.

For example, some drivers and some subdirectories might have settled
for another commenting style.

I guess you can submit the fix option, but it could be that the whole
rule/feature is broken anyway... so I do not know if that fix is of
any good...

I think it is better to actually understand, document and encode the
current rule that applies.

Can you provide an evaluation where the different styles for
commenting are aggregated in a good way?
E.g., consistently within a file with style XYZ; mixed style but
80-90% are of style ABC; consistent within a directory.

If you think some cases are in the wrong style for some specific
files, simply send a patch correcting the commenting style and see.

Lukas

> There is also a documentation regarding this different comment format,
> and can be found here:
> https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
>
> Thanks
> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
