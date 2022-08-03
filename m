Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F8C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 08:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C2D640A91;
	Wed,  3 Aug 2022 08:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2D640A91
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=aCGxjGgu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEJebkHjcGOF; Wed,  3 Aug 2022 08:58:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02E3A40A8B;
	Wed,  3 Aug 2022 08:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E3A40A8B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEBFDC0033;
	Wed,  3 Aug 2022 08:58:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C171EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A100940A91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A100940A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVhHQC6kwXoE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:58:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3C840A8C
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D3C840A8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 08:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659517103; cv=none; d=zohomail.in; s=zohoarc; 
 b=Z0C1RFtHhWVL38VXioPhEM9PPXQDeSm2BDZOVRVGojx6UymDi/ZUoEg/9UlUSIi8g46xDsAVg3Wogu/iGCelF+aWVZgdR30N2JlZVoWe0d7g9IZEbw8HknkaCjZS/WUf9xENkOYap7Kid2PxtROalZuz9xImGkscEjCgzYGXK/w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659517103;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=UWM3Q8d65CxhgoPYwJTl/FGjavrP+S1bO4WDYI0LZmM=; 
 b=W1ZXKcqpJWvXzse0uYPyMk5Wbt9n5kgRL/CVobzc02368p5EC0Ah11Wp88I6dQluMagaIz4YapLyoKV4I92lJKghTxunvVTR7ciVfMNZTYGJTZrhddT9YrFsVYVxEqNoANNhdj+Cq8NcBSExPI+hLofdFE4yO4jASvWPZLYwIZc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659517103; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=UWM3Q8d65CxhgoPYwJTl/FGjavrP+S1bO4WDYI0LZmM=;
 b=aCGxjGguCX3vmghCE0g7WVP1LHmEMjvjiTKUyp/oqsYrIKb3ZJNjNRLgT+oM4CoJ
 rWMDVAwlOrhZwXBzDi0MRaLxBoGofBlWCY+U+51CCIwe+hrxMUUzFVdUFsrOuwCpAcw
 54wHQHb2HtbY4dhL/2oz06j/DHLsiwL0BnUp6/mc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659517084780174.63182416015275;
 Wed, 3 Aug 2022 14:28:04 +0530 (IST)
Date: Wed, 03 Aug 2022 14:28:04 +0530
To: "Ingo Molnar" <mingo@kernel.org>
Message-ID: <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
In-Reply-To: <Yuo2UkkyaYtZ3rMZ@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
 <Yuo2UkkyaYtZ3rMZ@gmail.com>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 03 Aug 2022 14:18:18 +0530  Ingo Molnar <mingo@kernel.org> wrote:
> 
> * Siddh Raman Pant <code@siddh.me> wrote:
> 
> > On Tue, 02 Aug 2022 16:37:44 +0530  Ingo Molnar <mingo@kernel.org> wrote:
> > > Your fix makes sense I suppose, but I'm wondering how testing didn't 
> > > trigger this warning.
> > > 
> > > Off-stack isn't a rare config option:
> > > 
> > >   kepler:~/tip> make allmodconfig
> > >   #
> > >   # No change to .config
> > >   #
> > >   kepler:~/tip> grep CPUMASK_OFFSTACK .config
> > >   CONFIG_CPUMASK_OFFSTACK=y
> > >   kepler:~/tip> 
> > > 
> > > What am I missing?
> > 
> > Maybe this triggers on certain config options set, or maybe due to new
> > gcc version? (I'm using gcc-12, I also likely saw while on gcc-11.)
> > It nevertheless is a helpful warning.
> > 
> > I just now tried `make defconfig` (default configuration based on
> > 'x86_64_defconfig') and compiling with `make -j13 all`, and gcc doesn't
> > give any warning. (CONFIG_CPUMASK_OFFSTACK isn't even listed in the
> > .config file produced, grep fails.)
> 
> Does 'allmodconfig' reproduce the warning for you:
> 
>   $ make allmodconfig
>   $ make arch/x86/mm/numa.o
> 
> ?
> 
> If yes, then this could be due to gcc-12, as it doesn't reproduce with 
> gcc-11 for me:
> 
>    gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1) 
> 
> Thanks,
> 
>     Ingo
> 

There is no reason why allmodconfig would trigger the warning, as it has
CONFIG_CPUMASK_OFFSTACK=y, but the warning is because of the other case.
Still, I tried that, and as expected there was no warning.

Did you try the config file I had linked to earlier?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
