Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DE4C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 13:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148BA60EEA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 13:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 148BA60EEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1035608B8;
	Fri,  6 Aug 2021 13:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WA-3pwKolJ2X; Fri,  6 Aug 2021 13:12:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C47E3607FB;
	Fri,  6 Aug 2021 13:12:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FCC4C0010;
	Fri,  6 Aug 2021 13:12:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76758C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6662D608B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYDAR0xYYdZc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58281607FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 13:12:22 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so22771208pjs.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=60uKtdwINE+uN93Wa1ZW6y+e6h8rIQC3ejNAePqit5Y=;
 b=cq/EJ9ZxPEOaI4PBUV6soP623hRpLHBUxrAvwGQLkO8QhRQLg9tULokwk12zXxdl3z
 ALE/I4Zxsmlbu3f6jBwdzT1Y8gDsdxUpU+GUkxan1GkZon4h10LQ2Af2tFnAuHHS1bH2
 igH3kveFdximYSy3DnUQICDr5YSkoBeOLf0zIDR/V6S9tyXBpIbJo61ZpLMLeOaceMNr
 ij81gP46AztgIy4y5lS0GVfEPZ2dvmYFhIobqLgFrpLFQLQI87x2jbQJtpaJCHrAbTpZ
 JhnYbD7k9ByfNow8tQKfjvUOeop2JCpxMQBVOw9gsGzTu5jH6cXTxDm2b6X6Jw2pqW+H
 vNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=60uKtdwINE+uN93Wa1ZW6y+e6h8rIQC3ejNAePqit5Y=;
 b=qXbl9hxQyLa/bnfFB+sAvnm53Q6Gjk0oTs14HQvayXKJ2DFFNuOThon5rHVMgnxGUD
 u7kk0RvP157mwQ+hXcQBT+zG2wiruobV7Te09u8p06veFcB7NsLmtUXdWqwYBsjEue/V
 mMZesT0X0o5m5KurVlFQIHnmMa9K0ugLTlGoMWqThQpE9CEIhtq3qrwcxUotjEb1MfMk
 NgEzyjQXbNPd5rAPsqXdeQ49pnftPl4AH9FM/9uuW0Ja3Y8OfKv/aU1xaERoVJBFcVmq
 WzQFu3lgm/qmVXDrn2C7DxcJEUyr2n7KbF9RmgxSFKhfHCxP+zP4rqldFZK8FErtt2zV
 Wp4g==
X-Gm-Message-State: AOAM530J0sK+PuR9qQ0ImUtfWy8nSB/KUYofs3p6mROgn/M4hfvrmM1Z
 dOWTmpP17OePiwavHEUFRSY=
X-Google-Smtp-Source: ABdhPJyyKvV6IK9iJnl3lVoDvk13Cy4vJM6xy/Be0XpeTtcY7Wl+rGmPNho8uMTPRecDG4uraAhFBg==
X-Received: by 2002:a05:6a00:2b0:b029:3c3:310d:a23e with SMTP id
 q16-20020a056a0002b0b02903c3310da23emr4903818pfs.2.1628255541701; 
 Fri, 06 Aug 2021 06:12:21 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:daf1:7357:b291:d057])
 by smtp.gmail.com with ESMTPSA id f1sm10827112pfk.115.2021.08.06.06.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 06:12:21 -0700 (PDT)
Date: Fri, 6 Aug 2021 18:42:08 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix quoted string split across
 lines
Message-ID: <20210806131208.GA5933@uver-laptop>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142109.17137-1-utkarshverma294@gmail.com>
 <CABJPP5A9wjSpoYfX3j2v1dUGWv17hE6mNztuk5z2d5hyFuwohA@mail.gmail.com>
 <CAKXUXMydtSce3t91s0wmD87qr005MiVeMQ15UH-HBfsVub5ABQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMydtSce3t91s0wmD87qr005MiVeMQ15UH-HBfsVub5ABQ@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 05, 2021 at 04:20:56PM +0200, Lukas Bulwahn wrote:
> On Thu, Aug 5, 2021 at 3:53 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Tue, Aug 3, 2021 at 7:51 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > >
> > > Fix checkpatch warning "quoted string split across lines".
> > >
> >
> > You could write a line about why this change is required.
> > And that there are no functional changes.
> >
> 
> ... and does this change actually increase the line length beyond 80,
> or even 100 characters?
> 
> So, did you run checkpatch on your patch?
> 

Yes, I did run the checkpatch on my patch, and all the warnings
regarding "quoted string split across lines" were removed.
Although the line length increased to more than 100 characters, there were
no warnings from the checkpatch.

> If you are just swapping one violation of one rule by the violation of
> another rule, you will need to make a judgement which rule is more
> important and provide a good reasoning for that.

Since there were no "LONG_LINE" warnings, so I didn't mention about it
in the commit description. But will rectify this in v2.

> Other than that, it looks good to me.
> 
> Lukas
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
