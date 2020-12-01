Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CBCC64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 11:06:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C312206CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 11:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzKNikVp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C312206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 920AB8710A;
	Tue,  1 Dec 2020 11:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrmZnX+zWcqR; Tue,  1 Dec 2020 11:06:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18A83870EB;
	Tue,  1 Dec 2020 11:06:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0099EC163C;
	Tue,  1 Dec 2020 11:06:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60BBCC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5C42887CA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRDoG9Ga6+Dg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AFD4687C8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:06:11 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id b12so1034707pjl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nKIYXaScaIE7TEOxHPKKOMA1edFOJVdBECoLY/zrsjk=;
 b=gzKNikVppqu163aDscUKjy47nSF+BZMMVUkL1n8ZhDCAzk/k1f5Gz1cvFju0C5AssG
 dMiiNelWookXTDzBGk+qPQ0pW2PrMDJ9NNNnKNDrKmJijIz4t+BzJXhM5TPeuzukh3Zp
 8yLmjVEjzwA1R7OFORS0IAguWeLl2FGTcOajuaOJHRty478JWLV3/s58wiRfmQX9UnOj
 QTeqaI8KUMGlLld21DZJphgMWDR3BROhD52bb5FYj+V6qK3P+f3OTwTu1hiusvUMSTAz
 tRSvYXeCW7oSnKuSv4pTaGdtEW5EUfOtL3nJXcGrbQ1LhIQL7P4VzEDMRz4efDwgK1Ma
 1JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nKIYXaScaIE7TEOxHPKKOMA1edFOJVdBECoLY/zrsjk=;
 b=hR1kedKq9+YsehFekT+oJnj0qkstGPdWs0LlzwNbG+xnwK5bDLZxft7drFCIwuLFva
 by2Ks3Pp4J2nzt/jaqh095PllsaEB9GzC68nChOCXt6nGt5bzV41rZO+iRHfnMrPFjNZ
 +3n+hf3Q/h8WxwUmGAGkkIksjS4Lx24Z/7ry18MTcFwmnU9Ue2s28VWRpv/+WBT6blAz
 /S9NEZ8LDTp0uPZ48tPVvq8E5qWJnb3S0NmRi8wH9x+YJLBsivUbUJz6AQzheBEqIgwj
 LiReROb6n6BAD1m7VSjaJ4QCKyjjCWxEn1R4Wh6IS0o2QaOR8tczzkpK+97z6xuE99m2
 nOWg==
X-Gm-Message-State: AOAM531Ahj/XMqhhDi3tyh8pedgx4ZujEj5Z0ZXIsZlXxgzwFwXq55Ct
 Bi+AUrCXsQCLYdJ1Sg+19A6C5Y53ADC8fhtCdhE=
X-Google-Smtp-Source: ABdhPJwGj51Jga696lxn1uueNX6o3bKkRA2+c5xczsN64bmbGAJmaBGOQfx6Y32TI0yXWgAaHPiLtdss+msba2YlucA=
X-Received: by 2002:a17:902:ac93:b029:d8:d2c5:e5b1 with SMTP id
 h19-20020a170902ac93b02900d8d2c5e5b1mr2295356plr.17.1606820771072; Tue, 01
 Dec 2020 03:06:11 -0800 (PST)
MIME-Version: 1.0
References: <20201201071632.68471-1-98.arpi@gmail.com>
In-Reply-To: <20201201071632.68471-1-98.arpi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 1 Dec 2020 13:06:59 +0200
Message-ID: <CAHp75VfV60sRAKkzvbEKW7UEZSiDmNVfd_kB-OOKZRk5MNMeDQ@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_hexdump.c
	to KUnit
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

On Tue, Dec 1, 2020 at 9:21 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> Convert test lib/test_hexdump.c to KUnit. More information about
> KUnit can be found at:
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> KUnit provides a common framework for unit tests in the kernel.
> KUnit and kselftest are standardizing around KTAP, converting this
> test to KUnit makes this test output in KTAP which we are trying to
> make the standard test result format for the kernel.

Below doesn't suit commit message, perhaps adding it after '---' line
would be good. In the commit message you can choose one failed case
followed by all OK and show the difference.

> I ran both the original and converted tests as is to produce the
> output for success of the test in the two cases. I also ran these
> tests with a small modification to show the difference in the output
> for failure of the test in both cases. The modification I made is:
>  static const char * const test_data_4_le[] __initconst = {
> -       "7bdb32be", "b293180a", "24c4ba70", "9b34837d",
> +       "7bdb32be", "b293180a", "24c4ba70", "9b3483d",
>
> The difference in outputs can be seen here:
> https://gist.github.com/arpi-r/38f53a3c65692bf684a6bf3453884b6e

Looks pretty much good, what I'm sad to see is the absence of the test
statistics. Any ideas if we can get it back?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
