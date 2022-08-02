Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E4C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Aug 2022 16:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57A2E401A4;
	Tue,  2 Aug 2022 16:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A2E401A4
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=oEJBR4uc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0fc3KWqkF_K; Tue,  2 Aug 2022 16:29:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3C30140911;
	Tue,  2 Aug 2022 16:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C30140911
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07C0BC0033;
	Tue,  2 Aug 2022 16:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61BBAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 16:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17DD14093A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 16:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DD14093A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=oEJBR4uc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itbjA0-TJzyN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 16:29:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C0140935
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09C0140935
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 16:29:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659457757; cv=none; d=zohomail.in; s=zohoarc; 
 b=Djhgp8iXUCsOnH9BSyQXz7FMb/CCtRzW70p2rAlremDefOEUPhcd/lYHd1VRKZeM3YRLOGNNeSKuekz/r9J/Cn49yzNpUMEQk/U7HZ0F0dU6qL7jlpWZjfkeguXXmjpQVrk1nA5k/YeazDLsBEZWRk3lLjVla5iWdRN+d0OlXcI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659457757;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=tIaoKZqeKwVm3YXlgfzkmmqa+keWxZ5MypfokfBzu1Q=; 
 b=AOGAeRcesujq661zWHJWre5A0KEV7ftyIYUHwYhdkcRYgQoTz9AQSSgrxHs1NK9LGIbrboePn5bSh0gR8XBKh6erYOYNUqne/4m0siUOyp+1bs6fuW0+fY4votXtTHTN4gDECXJjXx3b9ZFHqxsyn3XwIq95LbbN7L3HGe9ZlzY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659457757; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tIaoKZqeKwVm3YXlgfzkmmqa+keWxZ5MypfokfBzu1Q=;
 b=oEJBR4ucJWNOr8jLGXAYjnRdA3ARGIT+6lE5L1REVDeYjJryM5Mj3+UeC4HtJ+nz
 4FEmI2NUKoT5AtsnyZJn4ho0wiCZs8S6B37xp/HmIEanfBVL8r0P40viL3GNKW0cONb
 /IlFqk+1C4+5t5EqcQkD4v2y1gzj2W7WIFrkVA4I=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659457745264923.42593622627; Tue, 2 Aug 2022 21:59:05 +0530 (IST)
Date: Tue, 02 Aug 2022 21:59:05 +0530
To: "Ingo Molnar" <mingo@kernel.org>
Message-ID: <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
In-Reply-To: <YukFgFTaq4Aw+uht@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
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

On Tue, 02 Aug 2022 16:37:44 +0530  Ingo Molnar <mingo@kernel.org> wrote:
> Your fix makes sense I suppose, but I'm wondering how testing didn't 
> trigger this warning.
> 
> Off-stack isn't a rare config option:
> 
>   kepler:~/tip> make allmodconfig
>   #
>   # No change to .config
>   #
>   kepler:~/tip> grep CPUMASK_OFFSTACK .config
>   CONFIG_CPUMASK_OFFSTACK=y
>   kepler:~/tip> 
> 
> What am I missing?

Maybe this triggers on certain config options set, or maybe due to new
gcc version? (I'm using gcc-12, I also likely saw while on gcc-11.)
It nevertheless is a helpful warning.

I just now tried `make defconfig` (default configuration based on
'x86_64_defconfig') and compiling with `make -j13 all`, and gcc doesn't
give any warning. (CONFIG_CPUMASK_OFFSTACK isn't even listed in the
.config file produced, grep fails.)

The config on which I can reproduce the warning can be found here:
https://gist.github.com/siddhpant/0197ea2b9873e8719d5d7ef991e2cd89
(It has 8969 lines, thus uploaded as a gist.)

This is a modification of a config found on syzkaller, which I was using
to compile and test some bug. I had noticed the gcc warning earlier while
on similar detours and usually ignored it, but now I finally took a look.

I tested compiling with it 5 times (`make clean` and `make -j13 all`),
and gcc gave the warning in all attempts. I also tried `make -j1 all`,
which also had gcc spitting out the warning, so it cannot be any race.

> > Fixes: c032ef60d1aa ("cpumask: convert node_to_cpumask_map[] to cpumask_var_t")
> > Fixes: de2d9445f162 ("x86: Unify node_to_cpumask_map handling between 32 and 64bit")
> 
> These are ancient commits from 2009 & 2011.

Yes, that's where blaming the file leads me to.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
