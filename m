Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159D1C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:58:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EAFE221E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZHsNXwC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EAFE221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE84484A5F;
	Fri, 30 Oct 2020 11:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpNWBlmRj8op; Fri, 30 Oct 2020 11:58:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95EAD8471C;
	Fri, 30 Oct 2020 11:58:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D926C0859;
	Fri, 30 Oct 2020 11:58:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58A22C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 43AFD87343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P682lhse6T6n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:58:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5278F8733E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:58:51 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id o21so1198366ejb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=es3W41hUxdDg86pFUPaiLWzXfxDdY/Ymsd0P2JgEFGo=;
 b=hZHsNXwCnLH3/hTG8xsUeiLZro+ZFgot6WaiRq6UequqNI9tv7Vg5BHmMULLNrDtxX
 StSru51lI1cyWLUg55nOXG2qO7armb1lk0UIm9kpz3p2I993FySrJmdffVT1Or6UsZCZ
 yPoU1e1Dz0KZyhtOGGEUSo4b0j9qTiZWw4iLE/NYEkJZS2o5aVp8pmx/jOCxr2Emc395
 gYezdSj/zntBomqcGTLSRALS6l4IkwxIuOTWMHkMHxeqFvJfIh5s2CeHPkAatjbUGkRa
 AfXhFxmgAyDrD8k0duE3DHigGOdRyuln7iRcnErs+/Z5m2sY2ACe7ChqJALH7gsSpufS
 qeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=es3W41hUxdDg86pFUPaiLWzXfxDdY/Ymsd0P2JgEFGo=;
 b=Ch/C4KY2vRHltW04MntAuMr5HYW0NrteqVu7KiVWKnJCEi420dfbHNTuOibyC/LiPj
 cWUwzHfZussKW4cf/NHUjvt8dmFfp7TuW3g23cwITBSVte+W9fEcHpP+5WrSfV9qDVSE
 if22Z/v5eE02OnTlDC4mHToXGs1yD/Q6B+ksH+kD7U9/Il/Y8HsCtkAxZjWwfXWD2QIv
 sf45O+RXgSLLO9ZUnbyAv+9kZLS4FOnrqjLnUjQC236LQHc3TYqpWC56lkYcn9D+vz29
 tS5lRcy0omW44cgVawFu4y/jTSDRGCgmO9WLiqbjG8UINIpsoc+fQnwtRRnicyjHNjsO
 QNfQ==
X-Gm-Message-State: AOAM530h5JybcH0hNbZGK4O5tOklFbDah4LiKOMQunezMWAlkg21YxEo
 kwAZ1SkTshqtS/JEBrjSiIg=
X-Google-Smtp-Source: ABdhPJzky4bcRdmCiAHwi7ZjnIhj4MyNII8wAYI1joF/7yR+oooejVL+zdMXPs4WUyFkOx6S7uVmdw==
X-Received: by 2002:a17:906:6a57:: with SMTP id
 n23mr2155448ejs.315.1604059129670; 
 Fri, 30 Oct 2020 04:58:49 -0700 (PDT)
Received: from felia ([2001:16b8:2d02:400:25af:1ff4:dc3:177c])
 by smtp.gmail.com with ESMTPSA id u13sm2868017ejj.4.2020.10.30.04.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:58:49 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 30 Oct 2020 12:58:47 +0100 (CET)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <9d5c8699f94481ab5bf2d37348199ca1d6343c8b.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010301255460.16621@felia>
References: <20201030090704.40533-1-dwaipayanray1@gmail.com>
 <9d5c8699f94481ab5bf2d37348199ca1d6343c8b.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: improve handling of
	email comments
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



On Fri, 30 Oct 2020, Joe Perches wrote:

> On Fri, 2020-10-30 at 14:37 +0530, Dwaipayan Ray wrote:
> > checkpatch has limited support for parsing email comments. It only
> > support single name comments or single after address comments.
> > Whereas, RFC 5322 specifies that comments can be inserted in
> > between any tokens of the email fields.
> > 
> > Improve comment parsing mechanism in checkpatch.
> > 
> > What is handled now:
> > 
> > - Multiple name/address comments
> > - Comments anywhere in between name/address
> > - Nested comments like (John (Doe))
> >
> > A brief analysis of checkpatch output on v5.0..v5.7 showed that
> > after these modifications, the number of BAD_SIGN_OFF warnings
> > came down from 2944 to 1424, and FROM_SIGN_OFF_MISMATCH came
> > down from 2366 to 2330.
> > 
> > So, a total of 1556 false positives were resolved in total.
> 
> A mere reduction in messages emitted isn't necessarily good.
>

Agree. That is why I also went through the list of those warnings.

I could not spot any obvious true positive among the reduced ones.
 
> Please send me privately a complete list of these nominally
> false positive messages that are no longer emitted.
> 
> I believe one of the relatively common incorrect messages is
> for the cc: <stable@vger.kernel.org> where a version number is
> continued on the same line after a #.
> 
> CC: stable@vger.kernel.org # for versions x.y.z and above
>

That was one, another common pattern was just quotes put inconsistently at 
different places.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
