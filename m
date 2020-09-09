Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A48C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 13:10:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3D7206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 13:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCC/h+mF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3D7206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31B87871FC;
	Wed,  9 Sep 2020 13:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5gn2No0cP6Z; Wed,  9 Sep 2020 13:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D57187204;
	Wed,  9 Sep 2020 13:10:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5DDBC0859;
	Wed,  9 Sep 2020 13:10:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D09FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 13:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 41D8287628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 13:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tuYyepOtEV8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 13:10:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5C1E875CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 13:10:33 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id q13so3446788ejo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=a5nFoefz0dFapmLX5QbAwgV5kNLDauws60Ngd59ih9w=;
 b=YCC/h+mFrFOJRWmQ50ujG0S7DCsUpfdcAg3vnlSZkBp6DS/QcmZG7jtmlMIp/kSbkw
 OEhf4Buvc4opIRoOaEEBubSiozcTJppgEgq3rdyypAhDudLOJcpIqpvAMyaT0cb+bPyd
 EUnaJiIXOpko9mjZ0iWWQEKKHckN7HJrd14NR2JrB30tzQU2aEBVGgiSt8yIoaECpZkB
 wcw0RCBuTW7q6G22w7oc7AB6QUGLVAzqnG+8j0yX7iHcyyvD/9PafD38rEp2DrukxXQg
 xQHdcV2PMuYzVmUmzW7m6xM1FqAgpfKvevGWnEiMLUPAGwy0qti1lzwMlqNz61S5Vo1U
 WCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=a5nFoefz0dFapmLX5QbAwgV5kNLDauws60Ngd59ih9w=;
 b=T32fzoRUq9H/lRIacOn9L2yZk5QE7JyOCel2diJ4vw+W/u5OPtmy31gzIHwT4AxMzV
 nk6T6AoO1Qzpm8D8aaL8q2HneZ7F/nbIDbcrMbzbvKkrrpWol0iXo2kHbEt/vE7FBwoJ
 IP97s4Q4aGbTblrkBY40oKegRI9ObWntq6CkJEMU/5ahwOrlucFtTsllrdCraRlcvSNr
 1B0FwaMSpmOaacOHqG1KjeKzwTpZkOhfyWONhJG/oNBCW5mL9dqy2dbTtYVJbuN1OYji
 tZ35U/soF6s/ZrYkQxu6iQG9Je5gk9AAeV4kLnd0qOp9DNN+g9/k9jKUgN9cC2fDMa4w
 QU+g==
X-Gm-Message-State: AOAM531/g8xzr/1bGOVm05nnSvH04tsxUyF4pqYyui1RM423gsq12Iwc
 dMgbvvSuafBL4CCcsR65V74=
X-Google-Smtp-Source: ABdhPJw6XUmZ4wEEGWjyIQ+GAjfbu0fNByX8pihDQyn5SaTmNibqLGCtDv49AEOdIb5Z0nyvJy9FDw==
X-Received: by 2002:a17:906:ae8f:: with SMTP id
 md15mr3375412ejb.131.1599657032100; 
 Wed, 09 Sep 2020 06:10:32 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id bn14sm2242200ejb.115.2020.09.09.06.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 06:10:31 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 15:10:25 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <1d6548cc89bf89a0bea9a2d84a94a01cebc4ec7b.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2009091506130.23843@felia>
References: <alpine.DEB.2.21.2009091152530.5622@felia>
 <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
 <20200907151417.44453-1-ayush@disroot.org>
 <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
 <3dea1eefdbbf97791bed3f838d4f06a7@disroot.org>
 <alpine.DEB.2.21.2009091324590.5622@felia>
 <1d6548cc89bf89a0bea9a2d84a94a01cebc4ec7b.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: GIT_COMMIT_ID:
 handle commit messages with multiple quotes
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



On Wed, 9 Sep 2020, Joe Perches wrote:

> On Wed, 2020-09-09 at 13:32 +0200, Lukas Bulwahn wrote:
> > dropped the maintainers.
> > 
> > On Wed, 9 Sep 2020, Ayush wrote:
> > 
> > > Sir,
> > > 
> > > > As the mentor in the linux kernel community bridge program, I usually
> > > > inform the mentees when the review on the mentee mailing list has
> > > > successfully concluded to a first acceptable state and I think it is well
> > > > advised to reach out to the maintainers for further discussion.
> > > > 
> > > > You did not do that, but just send some patch to the maintainers.
> > > > That is fully up to you, but I will not support the patch acceptance in
> > > > any way, and it suggests that you do not see the need to be mentored.
> > > > 
> > > > If you can land patches without mentoring support successfully, that is
> > > > great, but then you do not need a mentorship.
> > > 
> > > I am extremely sorry for my mistakes. It won't happen again.
> > >  
> > > > Now, to the commit:
> > > > 
> > > > Ayush, your commit message is largely incomprehensible.
> > > > 
> > > > Your follow-up explanation that was needed should have been in the commit
> > > > message in the first place.
> > > 
> > > It was my first patch, so I had very little idea of forming commit messages. 
> > > I will discuss it with mentors next time before sending the patch next time.
> > > 
> > 
> > Let us start with the simpler patch and then see if you can write a commit 
> > message that convinces Joe to ack your patch.
> >  
> > > > Ayush, you did not sign-off with your full legal name.
> > > 
> > > My legal name according to all official identification documents of India is Ayush. 
> > > I have no surname registered legally.
> > > So should I include "Ayush <ayush@disroot.org>"  or do I need to include my last name too (Which is Ayush only)?
> > > 
> > 
> > Okay. If you say so, I cannot judge but you should try to use a name that 
> > others can with a fair chance uniquely identify that is you.
> > 
> > The name is used in git log summaries, pull requests, etc.; so, it should 
> > be a name that with high chance to refer to one person.
> > 
> > Maybe you find a good way that works as suitable name for 
> > unique identification?
> 
> I believe the Developer's Certificate of Origin (DCO) in
> Documentation/pr
> ocess/submitting-patches.rst just asks
> for a "full name".
> 
> If Ayush has no surname, then I imagine that his actual
> full name Ayush should be good enough for the DCO.
> 
> A line like "Signed-off-by: Ayush <ayush@disroot.org>"
> should be fine.
>

Agree. Let us, Ayush and me, focus on getting some patches technically 
ready for your review, Joe, and with that, continue to improve 
checkpatch.pl.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
