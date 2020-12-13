Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8394CC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:19:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC9B23122
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFC9B23122
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64A57869F1;
	Sun, 13 Dec 2020 08:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBcvBVeNFgb8; Sun, 13 Dec 2020 08:19:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C747B86BFA;
	Sun, 13 Dec 2020 08:19:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B06B6C0893;
	Sun, 13 Dec 2020 08:19:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D8C4C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BC7C873D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt0Gxx-IgpMY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 984B087303
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:19:24 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id w13so22370301lfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 00:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGpGJE117uuu0mrJjD3uk83rQznDbmUGhxCc2a6Owt0=;
 b=VafUivgY/GTbQUK7U+t47larm9y1WZVXfFLko+4/fILf0w9h1+1YXiOrObZxalMVXv
 74DOYg6i7o+jDeCMR6MmeDgA6B3ITUEtILbcKgTTRFsRpoYXPJG8ZltVQoC0d83UW85+
 2ObAsi0WHefdn0gWwxnAPS8gUJ4LYL3B0ao9ikkrjvCzb7ucD8DOlnxXHehG05g8rTcL
 DSMZUJQ+ZNkmIyklyaCG/zQipNGiNurpo4yerBfjYqk74YlOTvIW1wc46sZH36bAihJG
 Ne7beno5RVLSMdZYUbj6FN1hAqM7Nlm3id88ysyNnQwHXKjWu14bKtb7oywSUf7hon0s
 Kqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGpGJE117uuu0mrJjD3uk83rQznDbmUGhxCc2a6Owt0=;
 b=ldPelEFNymJePYinkRK2/AU8ZqhIM1U+dalTRG6lI3XL+8S9FaBNVlSBRYTxhPDq75
 q+lvmgGC9s745CIvjcyfZRQgT1R2g8+7iSiSqqL5ffb6Y182LXdSZK+T3bOcAizvICOM
 eJIdgNQES2qe8tGYPJBYE0mtlNuUCOfEjlwXoOnFLKhkLHM7YTVgJ2o5raD9S0dL4UYQ
 eMQ4wZNDK8mWHO6Dbqx4go12sFJY6tts/SkJauZx6k4+lTF4S+0tDjaFX4pjroTTB4gA
 ot6wJ2/FYO3SLPF8BUV4Eu+5GZA15smfCAYlxoQrEWdMgk/hsjBkzdbVDgksRR40vrF5
 QM8w==
X-Gm-Message-State: AOAM5311eWMjT19GbEAxptVvULhw2mPigsEmXRo40wqr0JWbEuvTSSXW
 j02QRO3OqJ2j4dqyqg8bggTHyKuVTWELnk2CPPo=
X-Google-Smtp-Source: ABdhPJzB1WJVmw6oioR+YnA3WOh0S77J//JsdipVKPwKjVz/MpcQscWUBzPJZk2Xs7h70pReIf9bMvQmtdxPEsLvjY4=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr7486964ljc.284.1607847562396; 
 Sun, 13 Dec 2020 00:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20201212195548.231494-1-dwaipayanray1@gmail.com>
 <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
In-Reply-To: <CAKXUXMx9EnhWhGAJf4ousAgkxDUrN=g2zGaPEk6ijJYse7VJaQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 13 Dec 2020 13:48:58 +0530
Message-ID: <CABJPP5BeB-aXDDk-8vy-8dOaNaM5jitx6QWKtV7Y3zXM5DgvUA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-leds@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] leds: Use DEVICE_ATTR_{RW, RO,
	WO} macros
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

On Sun, Dec 13, 2020 at 1:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Dec 12, 2020 at 8:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Instead of open coding DEVICE_ATTR() defines, use the
> > DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
> > macros intead.
>
> typo: s/intead/instead/
>
> No need to use the word "instead" twice in one sentence, though, we got it :)
>
> >
> > This required a few functions to be renamed, but the functionality
> > itself is unchanged.
> >
> > Note that this is compile tested only.
> >
>
> This note does not go in the commit message. In the future, this will
> be simply not true anymore, but this below the "---" (see HERE! as
> marker).
>
> For testing, you can generate the objdump of the binary before and
> after and compare if that is as expected.
>
> Other than that, the change itself looks good to me, so:
>
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Thanks, Dwaipayan, for fixing this up.
>
> Will you also add a checkpatch rule to identify other DEVICE_ATTR(...)
> that can be adjusted to the refined macros, so that checkpatch informs
> other submitters as well?
>

I think a checkpatch rule for this already exists. But it cannot automatically
rename the function names. That might be the only drawback we got.
Probably clang-format could fix these automatically.

> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Cc: linux-leds@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-kernel-mentees@lists.linuxfoundation.org
>
> As far as I know, the maintainers will add the Cc lines---if they like
> those---with script support.
>

I thought I might ease the work of maintainers to add those lines :(
But nevertheless I will remove them.

> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
>
> HERE!
>

Thanks Lukas.
I will be sending in a v2 if the led maintainers have no problem with
this patch.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
