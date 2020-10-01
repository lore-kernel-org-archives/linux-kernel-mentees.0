Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE7CC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 15:36:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86C24206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 15:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAIryjrG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86C24206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22FEB86A83;
	Thu,  1 Oct 2020 15:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V13bmCnBPOSU; Thu,  1 Oct 2020 15:36:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A25986A6F;
	Thu,  1 Oct 2020 15:36:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E9BDC016F;
	Thu,  1 Oct 2020 15:36:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 229CCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F1FB86A78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GomzacvmNKjK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:36:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E4B286A6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 15:36:46 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 185so5984287oie.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTRcLiitCGxtErYo95DQsuhS+3OUv5XK3IV763QSggk=;
 b=eAIryjrGkerzMGunb1ZsmgjTEM6lxDD9ynZkPH6JSZRoOCVtbiBQ9lnOdtK1vRhDda
 iV2Uwnxf7YD4ZzGTXuc1D91QRjfrGEmJlykSRyYduyZ7LvfCLRWNayoLerQVmPpV7XLI
 ZhNj8NBOmSJPfd89OtYYnxCdzkKyxsoILt0Y1ZCcujnXmQqqBB/zRbTszNS4gGeGsRI7
 LsmSikTfFgOXC+HBrTsOkmJbCwFguMFRbV8oeWtcQ59XmYERg9oTjo3HiXXgJ5IOhJH1
 YPN2NYuAaSh0JvTQmMBXmD0q1YndiHnf62j0WZYkOXUI2n/3JxMf57CMFilRWJKLj8oB
 DbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTRcLiitCGxtErYo95DQsuhS+3OUv5XK3IV763QSggk=;
 b=FxHCbnYeCTbEW8WWkhq52BFRyPkGiSKgbylkCHPu5uzGd4lUsa8sYuCJucDSOqTY4y
 0VAO0Wu9mA842WqpMfOZxhOUO9hlHiVloEQko61HLmooX2NYPSnLrYR4skPvAv7a5rwB
 NCMAc5BEr1QhRyFLkQZSI/RSijrsrrdVAKHg1bd6nEzGigVHrlKGbdcs5EyoahcP/rtK
 oWiff2CQTx5rHsEqXiDJylrGjvjg+4TYQLFmr3g1XY/F5xA7r7CSWTSsMDT57l15zpae
 Cm3u+zBFquctYS5pluddZu/hYM7D8f2V0Vn9plgWP0t+OQUPgRUAA4FehS2aLhEE4gYU
 T5Tw==
X-Gm-Message-State: AOAM5308wiy7/kerRQKGY7qEEsWhhGDe8hKcU+lg6paese1psy1TVO9w
 ofMBWuPvaUDc1Sk7oe2n6C1Y6T+d06SEAVxcnMg=
X-Google-Smtp-Source: ABdhPJxpPLsfUZNUyhh5FlvHaLwRFS9ey7i+2W4qyQeVK5y8yLqt8zz98x9DwIGkY+BvHmS93cOgBJdKSmLm0uUu3cU=
X-Received: by 2002:a05:6808:6:: with SMTP id u6mr347726oic.74.1601566605366; 
 Thu, 01 Oct 2020 08:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201001103314.136645-1-dwaipayanray1@gmail.com>
 <8e110121c89414ab1601071868dbcf410195a209.camel@perches.com>
 <CABJPP5CFE3KXzMzuvVxtJt5tOg8Ye6y1V7-mqT5pqazHjVWvJw@mail.gmail.com>
 <f3dadda8af7eef6613d7a4105170058f2759507d.camel@perches.com>
 <CABJPP5AM01voDwARL4G0vMhFw4hMY+=dEQ7=obiKPzNtunyb7Q@mail.gmail.com>
 <361bda20762efce0e374bd2ba7c82d1c64628a67.camel@perches.com>
 <dc985938aa3986702815a0bd68dfca8a03c85447.camel@perches.com>
In-Reply-To: <dc985938aa3986702815a0bd68dfca8a03c85447.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 1 Oct 2020 21:06:22 +0530
Message-ID: <CABJPP5AvdWDJP1mkpdk_y-OVQnJb7utC3qCqOn=vP93DC7QwGg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix
	multi-statement macro checks
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

> > All I'm trying to point out to you is that $Constant\s*$Constant
> > isn't a proper test as the first $Constant will pull the test
> > entire sequence of digits and the second $Constant will not be
> > met.
> >
> > It may take some conversion of the collapsing of the dstat
> > block to work appropriately
> >
> >
> >                       # Flatten any parentheses and braces
> >                       while ($dstat =~ s/\([^\(\)]*\)/1/ ||
> >                              $dstat =~ s/\{[^\{\}]*\}/1/ ||
> >                              $dstat =~ s/.\[[^\[\]]*\]/1/)
> >                       {
> >                       }
> >
> > Maybe the /1/ should be / 1 / but I didn't look to see what
> > happens to the exclusion tests below that.
>
> I think your patch would work well enough if the /1/ bits
> here were simply changed to /1u/.
>
> 1 is a $Constant as it's just a number.
> 11 though is also a $Constant.
> 1u is also a $Constant but it stops the acquisition of
> digits that 11 would not and the sequence of
> "while1u1u" should match your newly introduced test
> of $Constant\s*$Constant as "while11" would not match.
>
>

Hi,
That's an amazing idea! I tried it and this time it seems to
detect it properly. Also this fixes the similar case in
for(...) {...}.

It should not have any side effects also for other checks.
Pretty amazing.

I will rewrite the patch with your suggestion and send it
back.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
