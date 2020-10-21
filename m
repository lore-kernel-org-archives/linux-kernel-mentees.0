Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2157C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:17:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69765241A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uX+TIkLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69765241A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12AD91FEF0;
	Wed, 21 Oct 2020 22:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ifz+DSCLDjB4; Wed, 21 Oct 2020 22:17:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8288D2E44B;
	Wed, 21 Oct 2020 21:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BCEDC088B;
	Wed, 21 Oct 2020 21:18:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C8BFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A0272E5F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJlbfgySLVex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id A50F933930
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:56:28 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id 33so1740558edq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QAQplRo+V55ajN3EGanzMyFt2i4l3+5LI1zmZ61vsOs=;
 b=uX+TIkLLy+7Otu7CTomnUg12kE3DaPfD7PjMUyEFfIVVqc2VFYm6ex1EebG/9wL72q
 VdUWgn3U3N5e/FVv92We8hfo0yiO1VQLyhu6pa0AzBe7m+Y6QMTonbvNOVHCbhuVxBha
 xufpeCaZHCxaEkdEWGUAnfh6XPvxVJwrQiLRDU0t3uwfXP9pgYH9GL9jTMEXI+pJ7gp6
 SnPdlJaMCjAkol1eQwjVPk1WRBi23szC6K6p6Eau2XRpExJN33TU4IVLcz1skWr/kYW6
 9umwlR3Kswn83JdtTaPNsH24Pxh2FsZS1ZJ3DzJ/+he1bTmVaHPZTb908GGyZUC24WdM
 Z+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QAQplRo+V55ajN3EGanzMyFt2i4l3+5LI1zmZ61vsOs=;
 b=lhlQFBQUFgx2BY1Yo7CZ0JTx6f2XG+74VyCOgP3QBotbk0VhhJXegGLL0jnd+y5Ec9
 tgPmHO4MV4CkpECHasrPDHGESd92LL48BglGUROHENAWFORhsf51iyXGvbvD4fm7cSzb
 ZhB2ll//BrJ9WBWNYx1ynJ8rGq4zoEnIpiyCXEP/cItNvueF1+JFX4rGR44B9lw75FwZ
 pacMng59eYeshqGI4uFOR6O8pWYMZ76mhG6gZlG3xxOHNBtzMJILskHpqLOJ8ZAgCrfl
 /zcFDE5SJnmNJG2PJqpK8StRTCHyt7dAoYU6Hgxn8Xo6Zzw8HhvHSvKdboZPklB4GGKJ
 3aKQ==
X-Gm-Message-State: AOAM530qu883MKTMlA3HoACizPk0pp61Ngqy056Yn3tE+mDGZmk/K0si
 3wfEyK2LdQ41DjKECn0i+lQl+omnvwXpqQ==
X-Google-Smtp-Source: ABdhPJyUhpVR6RncxQ+cZIqYEAC5gRNNYu0Z9D61VnyThrZgfCd/CVMhlVaEJtCmKQhD4u6EbNhr6w==
X-Received: by 2002:a50:9fe9:: with SMTP id c96mr1946520edf.241.1603270586896; 
 Wed, 21 Oct 2020 01:56:26 -0700 (PDT)
Received: from felia ([2001:16b8:2dac:c500:96c:5366:5c94:6f3])
 by smtp.gmail.com with ESMTPSA id p15sm1849660eji.40.2020.10.21.01.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:56:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 21 Oct 2020 10:56:25 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5CQgkzYnq6KrwfAaaTbORLVSKqxdF=8-eM8stPtJOXOjQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010211053430.8328@felia>
References: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
 <alpine.DEB.2.21.2010210717460.8328@felia>
 <CABJPP5CQgkzYnq6KrwfAaaTbORLVSKqxdF=8-eM8stPtJOXOjQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch: improving comment parsing in
	email
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



On Wed, 21 Oct 2020, Dwaipayan Ray wrote:

> On Wed, Oct 21, 2020 at 11:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Tue, 20 Oct 2020, Dwaipayan Ray wrote:
> >
> > > Hi,
> > > checkpatch seems to have problems parsing some types of
> > > email comments. Some examples I could find were of the type:
> > >
> > > 1) address@example.com (Comment)
> > > 2) "Name (Comment) " address@example.com
> > > 3) address@example.com #comment
> > >
> > > These comments aren't processed currently which causes
> > > false BAD_SIGN_OFF warnings.
> > >
> > > Examples are:
> > >
> > > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com
> > > (big endian system concerns)' might be better as 'David.Laight@aculab.com
> > > (big endian system concerns)'
> > >
> > > WARNING:BAD_SIGN_OFF: email address 'stable@vger.kernel.org #4.20+'
> > > might be better as 'stable@vger.kernel.org#4.20+'
> > >
> > > The earlier warning is very frequent in the kernel.
> > >
> > > I did send a patch solving (1 and 3),
> > > https://lore.kernel.org/linux-kernel-mentees/a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com/
> > >
> > > Joe points out that comments and multiple comments can
> > > exist at any part of email. (perhaps RFC 5322 Appendix A.5). So
> > > that patch didn't solve the problem at the very root.
> > >
> > > What do you recommend be done?
> > >
> >
> > I cannot say much of BIG value and insight.
> >
> > As of now, I think these cases should be handled correctly and the check
> > for: is it the same name or is it the same email should work properly no
> > matter where and which kind of comment is used (as described by RFC 5322
> > as you pointed out).
> >
> > I might change my opinion when:
> >
> > 1. We have an evaluation on how many cases of BAD_SIGN_OFF (and related
> > types) do we currently still observed among 100,000 commits and how many
> > due to not handling comments properly?
> >
> > 2. We have a rough idea how complex this whole checking function will get.
> > At the moment, I cannot say if it "just 10 lines of code addition" (even
> > if they might be quite intrinsic to get right) or if we need hundreds of
> > lines with thousand of special cases etc. (which I do not expect, but who
> > knows which complexity might be involved, once we go into the details).
> >
> > So, I suggest to evaluate and prototype and then we can better judge if it
> > is worth really going forward, discussing it with Joeand adding it to mainline.
> >
> >
> > What do you think, Dwaipayan?
> >
> 
> Hi,
> I completely agree with you. We could run the evaluation first and
> see what kinds of comment patterns are used. We could also keep
> the RFC 5322 guidelines as a base and modify the code to recognize
> the comment blocks as per the specifications.
> 
> It could get fairly complex, because comment blocks are allowed almost
> anywhere. So maybe we should just solve the most
> common ones first. That would help the committers largely.
> 
> I think Joe wanted a complete solution for it. So I guess i will try
> to cover as many cases which doesn't increase the code complexity
> much.
> 
> I will start with the evaluation. If others can help out too it will be great.
> After it, we can determine what cases need to be handled and what
> can be ignored.
>

Go for it and share your results with the group once you have something 
which others can review and help to evaluate.

The requirement for future applicants to be selected is to show that they 
can help you with their work on evaluations and their explanations.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
