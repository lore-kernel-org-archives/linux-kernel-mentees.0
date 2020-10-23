Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716E9C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 21:10:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50A1208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 21:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgGdzCIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50A1208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A7648769D;
	Fri, 23 Oct 2020 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTPEwy7A+py2; Fri, 23 Oct 2020 21:10:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EDE1F86923;
	Fri, 23 Oct 2020 21:10:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E991EC088B;
	Fri, 23 Oct 2020 21:10:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609A8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4962D2151E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kLgfp9+Y7XV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 21:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 82C00207B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 21:10:25 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m11so2574382otk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymCmJTooyNdL1EqF0pjKK4EeKCNVf3sxNXseKAntLks=;
 b=SgGdzCIM9osaG0ky/Dn1c01P5XE9EBK2cScEBQuUiz/osI+jK/49RRGupO9Xv3rxW+
 IEU2CstR7jq6a90p61j8Jcl4NIG4BkGK47Gv7ImkjPaWHgr0aNZzrKiOVKCVnrkzLwhp
 cQv8uqohtTcITy0zRMmPgUjgno4JMC+ioxY56H7vggbrboz7fRM4yehZ08zCltOWC5kr
 yBMJhWc+iNdGz0pi3qaUOMsQrKrYAVPoYHFc45boIU4GYGL0GdSd0y/9y4TXPmWosqPC
 kmETOtVNCz9qnahyuIUh4wH4l0bjfKuBqJWn1sHMku9A1Z6XVC01N9cWLH1czBcMEy1U
 xNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymCmJTooyNdL1EqF0pjKK4EeKCNVf3sxNXseKAntLks=;
 b=EZtu1Nq7MHzkLZle8Gpoh5VNC+GFcVJkYvB4Qmidi2dctN0wYgEP/Z5IPuxvIra8WP
 JXCQjxcZZuPmpyISE1ZWHtoEqpi1MueeqjFKTCqCBqlk2p455Ipa5egLCqBsn8OV+7VT
 49XrWHpiZsMhFlhGN4wVC8JiaTH1Zk4pQSxhd/XyiP9qyJReKLKOTWEzcbscCG4Ro87N
 fCb6p11g4wkofH+cajBBh+DY/9WUYDDJ0DxbtKcXAi7vLIwEBUuymuFTL2+dFNLERQkm
 MjzaLAUqMxR6tXJEfhJX3hLdAftP13L+n4JzLe5g/rD/uArFYJV8BYQjfW76oADArZ2i
 GdaA==
X-Gm-Message-State: AOAM5311mNN01ND+WnHgxUPs7TEBnrPSqgXb4Zr7AYSSKbRf711+YCTm
 UuxvgEvVF2ZLP6a8CV3SbXUAXw5jpdV81hOx7F8=
X-Google-Smtp-Source: ABdhPJz4qNwKWDma5pGy66C5m2BYX1dI/OdUywP3C7yjlamQOd24uLp8vrjmNSmoldjPUKH6WfU867AJN+QD9k0EYZI=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr3028527oth.215.1603487424607; 
 Fri, 23 Oct 2020 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
 <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
 <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
 <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
 <2a3b90ee-b9bd-2586-9d68-45cbf7e499a9@gmail.com>
 <8710630d8c01bf6f3749e3d11d193a805f2d2048.camel@perches.com>
 <CABJPP5AcjAq0kg0MMggd2D6YUwVhq96otm-qQB3Snddt77VxAA@mail.gmail.com>
 <4317722a8dc93b6de1dc974a8cb51c7f22d86ecf.camel@perches.com>
In-Reply-To: <4317722a8dc93b6de1dc974a8cb51c7f22d86ecf.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 24 Oct 2020 02:39:55 +0530
Message-ID: <CABJPP5BWRWFd=fUMMuWE7R3+w-y_6i9uxK=jZFVijZ8xWThT2Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
	attributes check to handle more patterns
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

On Sat, Oct 24, 2020 at 2:34 AM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-10-24 at 02:27 +0530, Dwaipayan Ray wrote:
> > Also I tried the pattern  attr =~ s/^_*(.*)_*$/$1/
> > for trimming the _ earlier. I think it doesn't trim the
> > trailing underscores in the suffix as (.*) captures everything greedily.
> >
> > Is the iterative one perhaps okay instead?
> > while($attr =~ s/(.*)_$/$1/) {}
>
> Then perhaps
>
>         $curr_attr =~ s/^_+//; $curr_attr =~ s/_+$//;
>
Okay thanks!
I will send in a new version when everything looks good
and tested.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
