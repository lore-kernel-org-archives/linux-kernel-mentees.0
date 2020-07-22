Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A7CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 19:45:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4D420825
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 19:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rvheysi+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A4D420825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E268B204B8;
	Wed, 22 Jul 2020 19:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHCjyFkiOpMk; Wed, 22 Jul 2020 19:45:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4E33F2035D;
	Wed, 22 Jul 2020 19:45:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3097AC004D;
	Wed, 22 Jul 2020 19:45:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58903C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5503086C24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 19:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjM751iSE8Vw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 19:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D9DD086A5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 19:45:12 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id k5so1935255pjg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nWRg8habjmwUq/aSOIs5oJ/PIMDu1J2enCdaZpnqjtI=;
 b=Rvheysi+PYCBmuMOpzRtK6Oze6jqgkcolfrm0c2G06ZfucZ7GN0cNoCE00nMt2FymF
 bAeDzTaaaM7LEWiVN/ByX7unj0u0rupZmXTT/6dfvTS1tdTa5UQ1K1x+SZPtoxk/hjTq
 +c06od/fOU5c0Kj4Evbb/bGw1U4B0Ub2f8v6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nWRg8habjmwUq/aSOIs5oJ/PIMDu1J2enCdaZpnqjtI=;
 b=fcHqzlCNJGwWkQccEngYbCNd/flwisl6aBOg1LsaolL6pJ0UT5YYbfexS2jo8r2L8n
 S8cWjXx5HvwbFNfBO2AwL10ZVF9Ze1lmkIP8ERG+wz/JHIBHORyYAgSTPUPCVQdHysZr
 99DongQGwh/7ZN2OUpQlL4YSI9eh9xftv0kb6Z/BYBuT0IJoT4T2zVaYbttRZ0EDI//p
 7vlxPzQ81TqY7Hb49GQeElKm7p0ltvvEPFXIHgZQXCoC7lOitlSIbpTCGcIDksKo2slg
 XM2lWBTqiT15GE37xR7f0r7bKjgPuBgrrmkMRIuWFw8cK8qULapnhQq7t2zQgZpdzRzf
 skUg==
X-Gm-Message-State: AOAM532dNWz/km0VptQtlt7Iz1plgkSCu8j/4+9uDxYOQngxewL/EEtW
 yIjZS8DzUOICc9sa5Rfl83p3Mw==
X-Google-Smtp-Source: ABdhPJxp0OPbK17T/FisysBhZk0+gpPejV6bgMq7eWQizEQTOQ0sgf0Q3VWKJW6xGgrHmxb3WQ5IuA==
X-Received: by 2002:a17:90a:a50d:: with SMTP id
 a13mr837453pjq.95.1595447112507; 
 Wed, 22 Jul 2020 12:45:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t29sm432106pfq.50.2020.07.22.12.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 12:45:11 -0700 (PDT)
Date: Wed, 22 Jul 2020 12:45:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202007221244.4E3C9E45@keescook>
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
 <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
 <202007211911.666E080@keescook>
 <CADQ6JjUgVXBfHfb=V2ajwm=rHi12rxiqEtpivjY03xZbp6k7wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADQ6JjUgVXBfHfb=V2ajwm=rHi12rxiqEtpivjY03xZbp6k7wg@mail.gmail.com>
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

On Wed, Jul 22, 2020 at 03:29:27PM -0300, Vitor Massaru Iha wrote:
> On Tue, Jul 21, 2020 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Jul 21, 2020 at 07:19:12PM -0300, Vitor Massaru Iha wrote:
> > > When you talk about end-of-test summary, is it what is written in
> > > dmesg and not the kunit-tool?
> >
> > Right, if I build this as a module and do "modprobe user_copy_kunit",
> > what will show up in dmesg?
> 
> No, It doesn't. I'll put the messages again.

Would it be possible to add that behavior to the core KUnit output? Then
all module-based tests would include a summary line?

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
