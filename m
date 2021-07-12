Return-Path: <SRS0=bgCq=ME=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7551C11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 23:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D94260C40
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 23:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D94260C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0564055D;
	Mon, 12 Jul 2021 23:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2yy2fG9Wrdv; Mon, 12 Jul 2021 23:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 146DB40425;
	Mon, 12 Jul 2021 23:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2571C001A;
	Mon, 12 Jul 2021 23:08:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F93CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 23:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 261C240456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 23:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMr6m62889nn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 23:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6E7940425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 23:08:04 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d1so4861941plg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4pQlPWeYDasqT5HSwq98XRlnC0Bt0+1EaZmNOibXW04=;
 b=Yw3FqYsR8SI3j7U39sRckJQB5mg/EWKrrV5SEZSYye2fX8jrsH4vPluQayT/7/IhXr
 6agWVqffEsFS1ZF2Df8T3XP4sAia8Z8f/53QpJOqsTVOkGrFgwfdFm6P7kLGFTRzMWfQ
 Il78xfjXKZcgDQzaI53AzPyy+vxsn8eD9UaOqGM7XSqUuu4VSYRFQv3QxeMi+N8CRS1A
 zpnztX//YHHq+8jAjdrqXr5sigfuIqTJRYVLvv+/5QO0i+rV952c1N5dmlQKn/dvdR78
 PpOlpC08tSIn/J5civ1yvwKBRlRoUffVJvqKLfU0zlhVV4DFRGKUsfiD0gdr8W4YJSia
 NKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4pQlPWeYDasqT5HSwq98XRlnC0Bt0+1EaZmNOibXW04=;
 b=WsTsemxqS1zZxCDAzlxzhMqYMqV756VaXzUkwWIB24r8EIwXqXplH8VqjvA3qPXjT4
 FvcMVME7WzAT4n4g+/SJsLoeiMmD7v7Bj9Ag9PIkIEFGo6VaRepA74o4lzh6t7p/TNvK
 uxYMr7pnXt899Z/5L3YJYqWCu8CL1PoSCmrUR7ElnF+BD1qedlNdDwjsCjF8TzeQZ3xq
 uuUWTEzgClK6WE/lieetsq3LanoCp6S494MKmTtwC8nDEbTPEq0IECOrx5EfwU8jTEDb
 t84GRtyZptUIda2/HLvDxELSrUpco02NYbBXAB02wO8/HFPduN81qCwUO0yiwQKqN+rc
 ZKJw==
X-Gm-Message-State: AOAM5323MaflqQx3nauJmRLN5sAsDYXUUF2Mgk16RqsYzMdRjw6BKtLw
 sV3ju3B8gykz8ayeSlyqjPHsGfww7GxoY3g81Ec=
X-Google-Smtp-Source: ABdhPJwl/cs7gjt7UJvM1RfNNXWnPv2JwXE2ke1+At2e0tEfL/PE79WKC/dXpX7uZcwpL8qyXTn3xOsnANHWEcUeh70=
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr16378709pja.181.1626131284145; 
 Mon, 12 Jul 2021 16:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <YOwr/GMIExCoNjeZ@smile.fi.intel.com>
 <20210712223631.GA1682719@bjorn-Precision-5520>
In-Reply-To: <20210712223631.GA1682719@bjorn-Precision-5520>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Jul 2021 02:07:27 +0300
Message-ID: <CAHp75VfDcQXqmK9=4k4rqi7t2OZaVPC13b45vLY7fELr7zBG_Q@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

On Tue, Jul 13, 2021 at 1:36 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Jul 12, 2021 at 02:48:12PM +0300, Andy Shevchenko wrote:
> > On Thu, Jul 08, 2021 at 04:47:06PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Apr 02, 2020 at 11:23:27PM +0300, Andy Shevchenko wrote:

...

> > Datasheets are publicly available (at least one may google and find some
> > information about those PCH chips). I have in possession the hardware for
> > gpio-pch. I can easily test that part at least.
>
> If you have a URL for those datasheets, can you share it?  I spent
> some time looking but all I found was 1-2 page marketing brochures.

It's a part of the so called EG20T PCH. It's part of in particular
Intel Galileo (Quark SoC) and Intel Minnowboard (v1) (Atom E6xx SoC).
Hence the easily found links:

http://minnowboard.outof.biz/MinnowBoard.html
https://www.elinux.org/Minnowboard:Minnow_Original
https://en.wikipedia.org/wiki/List_of_Intel_Atom_microprocessors

https://www.intel.com/content/www/us/en/embedded/products/quark/x1000/documentation.html?grouping=EMT_Content%20Type&sort=title:asc
(Chapter 19)

https://ark.intel.com/content/www/us/en/ark/products/codename/37567/products-formerly-tunnel-creek.html

Hmm... Funny, the document #324211 can't be downloaded
https://download.intel.com/embedded/chipsets/datasheet/324211.pdf

I guess you may ping Intel and tell them that they should play nice
when talking about "open hardware" (MinnowBoard initiative).
Nevertheless, the (Old? #457798 is a specification update under NDA.
Okay, it refers to rev 8, while Mouser, see below, provides rev 9)
copy is available on other sites, such as

https://www.mouser.tw/pdfdocs/Intel_Platform_Controller_Hub_EG20T_datasheet.pdf
(Chapter 16)

> > > that's not a trivial task, and I don't think that burden should fall
> > > on anyone who wants to make any improvements to these drivers.
> >
> > > Another alternative would be to remove legacy PCI PM usage
> > > (ioh_gpio_suspend() and ioh_gpio_resume()) from gpio-ml-ioh.  That
> > > would mean gpio-ml-ioh wouldn't support power management at all, which
> > > isn't a good thing, but maybe it would be even more motivation to
> > > unify it with gpio-pch (which has already been converted by
> > > 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"))?
> >
> > With regard to (1) probably we may exceptionally accept the fix to
> > gpio-ml-ioh, but I really prefer to do the much more _useful_ job on
> > it by unifying the two.
>
> Should Vaibhav re-post this patch, or do you want to pull it from the
> archives?  I just checked and it still applies cleanly to v5.14-rc1.
>
> Here it is for reference:
>   https://lore.kernel.org/lkml/20200402155057.30667-1-vaibhavgupta40@gmail.com/

I'll take from the archives.

> I'll post a couple small patches toward unifying them.  They don't do
> the whole job but they're baby steps.

Thanks! I look forward to seeing them soon!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
