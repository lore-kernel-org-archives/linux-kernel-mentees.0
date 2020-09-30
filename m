Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA36CC4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:38:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DFC420709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fa/JNUcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DFC420709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C007A2279B;
	Wed, 30 Sep 2020 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0b5asORvTQk; Wed, 30 Sep 2020 19:38:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 608D0203B9;
	Wed, 30 Sep 2020 19:38:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52374C0889;
	Wed, 30 Sep 2020 19:38:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CD70C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 24EA184ADC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_Jvj7R7_W1o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:37:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 37636847DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:37:58 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id qp15so3630019ejb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pRHQdu6r7qwaPsOOSNiGVYsmsASi8JcHvYxcPRJmbJ4=;
 b=fa/JNUcUPnZtrW38W/HtK4QPzB8NTkPDLeF1uMUnnT1aXVeWf4SLF9T63iBC1DAXmM
 m9+NHhnv8hrTYfbtBDdy2y00MU+UreIS+Q5n0jik+12xZ22onD0BAYlRnA4qba4ePqd6
 MLPsZWiZbCWcY5PjoH2sBl8tQq9DUMEhgx+PtRPYEB25LoCzLd4RYu3mCn/JrZCJRW1h
 J1zYytWodkZcPbxNNS1bUjwj0bRtoLzE4gAYlP4rPRhsDF8rY8QuEsVaEnxqxNZBLYeQ
 OupfJtBynOSYj4fy420jDrlT/QFbGdEJD54LJgeTDTE38lfFl6upRDkGuJKnBY61cd+U
 3MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=pRHQdu6r7qwaPsOOSNiGVYsmsASi8JcHvYxcPRJmbJ4=;
 b=j2GFE/lBx0oJfuchga1IXSGns7QGpjxmxxyg9yPidZ2k+c9PW//gxuQXdqhnU/pE8U
 6awhAupjYf863kpGfKVrvBKifQFZ+ydOsZyxb/Ml5UeLjnUof+250ErW8lHk1P18Zmzw
 sh8Cx9tafWji3L5vVmxeZjg1Me7atVnfOgI6Dkm4uETfr5r176E4tTum9fOMnqaD+d9z
 0oDE6yXLpYJtuySyMN5WnARfr3VoWxH9bS6n6xUB06N3cC4H3FgNWkPGt3TmP1TVuptw
 KbqC3H/1O3Ut0DWzv5N9n5HxERlZmoarC+pQlc5V4o1KouFLePQvo/vE45othr3jRECq
 pAiA==
X-Gm-Message-State: AOAM533UDnYcc1RFPg75irWuXQaZDkPM+Uw6EMV/C8IGgnFKyVJ/auPz
 3dNT+FzcvNnYr7xn6x5C6Y4=
X-Google-Smtp-Source: ABdhPJx95ZpYm2WMWZWhZ1p0i5in+9QIvPGXN96qwMK2UUu0Kswka+8ciT3Fc4PBda0wu6JWUTOV5A==
X-Received: by 2002:a17:906:1e10:: with SMTP id
 g16mr4547946ejj.438.1601494676763; 
 Wed, 30 Sep 2020 12:37:56 -0700 (PDT)
Received: from felia ([2001:16b8:2d6f:5600:7072:b735:b671:fb4f])
 by smtp.gmail.com with ESMTPSA id bt19sm2281088ejb.44.2020.09.30.12.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 12:37:56 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 30 Sep 2020 21:37:55 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5A9hGU=zmQShThBqdj1d4gMWeg2Qza=fgwqk8spQE04Fg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009302135580.8279@felia>
References: <20200929205731.207393-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009302102420.8279@felia>
 <CABJPP5A9hGU=zmQShThBqdj1d4gMWeg2Qza=fgwqk8spQE04Fg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multistatement macro checks
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



On Thu, 1 Oct 2020, Dwaipayan Ray wrote:

> On Thu, Oct 1, 2020 at 12:40 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> > Dwaipayan, did you checkpatch.pl your patch before sending it out?
> >
> 
> Oh right! I goofed up! Sorry about that.
> 
> > On Wed, 30 Sep 2020, Dwaipayan Ray wrote:
> >
> > > Checkpatch generates incorrect error message for certain
> > > macros.
> > >
> > > When checkpatch was run on commit 4649079b9de1
> > > "tracing: Make ftrace packed events have align of 1"), it
> >
> > brace ( is missing, checkpatch should warn you.
> >
> 
> Again, I may have been too hasty in sending out the patch :(
>

That is what the linux-kernel-mentees list is for. Send something out 
quickly and have some people with patience check it.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
