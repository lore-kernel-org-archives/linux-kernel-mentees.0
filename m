Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BB3C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 22:29:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CDF92071A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 22:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="fhWMlcxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CDF92071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D43D87122;
	Wed, 22 Jul 2020 22:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CM_sPlzOPsRK; Wed, 22 Jul 2020 22:29:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2BF9870EE;
	Wed, 22 Jul 2020 22:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97A10C004E;
	Wed, 22 Jul 2020 22:29:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72D3EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 50F422344A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmgf0RnBKERc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:29:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 3CF162343B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 22:29:18 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id 2so1800981ybr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDU5F+lKnx2jbAbcQ8EdWpqtNDoD+1zrWyM5bAIpN5w=;
 b=fhWMlcxqko5jvxwun7u9Uh71irn2Il2ZaOvNhovugAKiQoGmJ9IDiPrToHA8cjDMRu
 x1VrYa/E0VvPZoA+NaZhZXbLqncS8YhFZHpYr0fz0yhxXm9p5ySMNW38C59WR90QeHIN
 kWZ4lbpJlxdBM/tAzlp6Aj4Twlsi8M1xoZanH3IeoZa029h5A781Eq8/2XYuLuPXNnUZ
 r/RdyDA+lFa6N7kQAAG4rnbsYAyFVjv9fgJaUVY06JmjP2AsOflm13HWTc3BgsiQLiG/
 t3SwYffYY1obba81noPsvPY03PPzwOCaRAq0ZEtJmkURsIdWLd/Lf5moo2ds+3peAf40
 Zsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDU5F+lKnx2jbAbcQ8EdWpqtNDoD+1zrWyM5bAIpN5w=;
 b=qc4vB3q/y37oceC+A1TIofRh+rGGh7k7KF+UxsFJZy1Ap1QnVVcxERkKNPKBaOQEsY
 tODUjDRdOuUuA6xHcegpqAHaiiKDMGLnIVTeBJTeUGjCE5iTgDoIqupy5qOOeWi/D8/H
 1CNF8kVu20GQHG7lbSFEqonu6pEU8CbQho+75hKdxPu9ry6wYlhjLsK3RIYrs2jfQjvm
 g25LuCTzfFHRKLPfWJ4A0fzJHxkB6WYic2dbSLHI2IysnTh9UiJRzaPaifRf12Vzy6i7
 5R+RUoQEHtHsfbv4zCTxgiYr/R3NeOti8MQW8+NSiiunajS7OqptNT5kmYVNUgrjXdgo
 fiig==
X-Gm-Message-State: AOAM532YldEmM1RYZSQynSYE5ZlTqDOLvd4UWBNFVFblrpGBC+Vomgtx
 S7vREymwu675dK2yZUwU2gTnf6+9bttWPZvDT9TvYw==
X-Google-Smtp-Source: ABdhPJyLKRl2cLOz/lGg7WJPCuMu3otLZQXrSRuCWupUdKjm0eoPDEEAPrS2s+m18HN0tAIQub01+IJfHDQ0XRTs6cM=
X-Received: by 2002:a25:ae01:: with SMTP id a1mr2350192ybj.119.1595456957139; 
 Wed, 22 Jul 2020 15:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
 <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
 <202007211911.666E080@keescook>
 <CADQ6JjUgVXBfHfb=V2ajwm=rHi12rxiqEtpivjY03xZbp6k7wg@mail.gmail.com>
 <202007221244.4E3C9E45@keescook>
In-Reply-To: <202007221244.4E3C9E45@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 22 Jul 2020 19:28:41 -0300
Message-ID: <CADQ6JjV8cXsEKX-Yn2udhnZgJQWkbtS4XL+yaRzfydaWV5EbSQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
	to KUnit test
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

On Wed, Jul 22, 2020 at 4:45 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jul 22, 2020 at 03:29:27PM -0300, Vitor Massaru Iha wrote:
> > On Tue, Jul 21, 2020 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Tue, Jul 21, 2020 at 07:19:12PM -0300, Vitor Massaru Iha wrote:
> > > > When you talk about end-of-test summary, is it what is written in
> > > > dmesg and not the kunit-tool?
> > >
> > > Right, if I build this as a module and do "modprobe user_copy_kunit",
> > > what will show up in dmesg?
> >
> > No, It doesn't. I'll put the messages again.
>
> Would it be possible to add that behavior to the core KUnit output? Then
> all module-based tests would include a summary line?

Nowadays with modprobe this is shown, is it necessary to add anything else?

root@(none):/# modprobe user_copy_kunit
TAP version 14
    # Subtest: user_copy
    1..1
random: fast init done
    ok 1 - user_copy_test
ok 1 - user_copy
root@(none):/#

>
> --
> Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
