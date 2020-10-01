Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD152C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 11:12:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495C62087D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 11:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMS+gLJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495C62087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDFA986A48;
	Thu,  1 Oct 2020 11:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Neaod-toi7y; Thu,  1 Oct 2020 11:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 672EF86A37;
	Thu,  1 Oct 2020 11:12:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B15C016F;
	Thu,  1 Oct 2020 11:12:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8CC9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C07ED8733A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zfs4z4RuOo2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:12:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DB2687317
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 11:12:35 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id q13so7411026ejo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4t04I8s6sB1Yrmu3g5e0Wt6p/EcT6Np/z3tPoVxvegA=;
 b=lMS+gLJRFrpu0uymz/ALbIgsRWpc042XICYRF3F9JpH/cZsJNlna7mLiV8jCBzIwzu
 YnccZoL1L1pLCNq9fER5P4M81OOiHze69+37oTRgVZAzqmZtz1Mlp3vAlC94tTTEN9mC
 TlHROUslwqYp1R36JpW7DIxwa7zAZuo6C90pKRSeFT3PC1CkHpY3/NfYKtCGGt7PDyq2
 KWN40PKadNPJu/LaDQKfz8lCrGgwng7ljlAHS9j7UQIgq6D/YjwhfD+UgRbpqKp2JTBa
 UU0dS5aXhkm8+xoDsvJdTgUxgmIvXqy+fJhCx9Q2Am/cecfxJEDkdW1oykMbklvCv2Ci
 0fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4t04I8s6sB1Yrmu3g5e0Wt6p/EcT6Np/z3tPoVxvegA=;
 b=aX2/Xxuh9alcAbhfHs3qfbtg79Et3pUUAN2vGB7f5LawEGG66FiQCdwmhscNomiIvF
 ESv+F9dyNbbcEmYgDeqfVW6ghQLbUPn3A9QKqGawUkG6ynEjgIod/j3VxcgSgywHl5yX
 MCJE17MagwkY1qkBrshrHy+ZkpuBqJUHSDeggCXX8TS6SDtMFckBF3Y1ZympvGxiT8/o
 IdtazZ8wUCYIlZND61K8278aeeLw2yKPFmefsrNahggFrO8NX1jnfaS8Ud5484GabnwC
 wn9deMQFL6Wu/T//kF70efMLsCMzjbNY6ptaT6coaTNN7EEpZ1xDhNDEcuEdKPi6HaSY
 JFew==
X-Gm-Message-State: AOAM533LNUdIMrxo2PwubYcxOWr/cAiYa2/q4FHpaOLkiKMbfVVBM0bf
 rtCckI12/I1QsIwWwYqNge8=
X-Google-Smtp-Source: ABdhPJwEzMnLajQjNK3iwkOQZhRiKx70lQQ0BSGy5SL+0BDManYw0CQU0M+mHVVdx347zWIcwQ7p6Q==
X-Received: by 2002:a17:906:e24d:: with SMTP id
 gq13mr7263019ejb.152.1601550754102; 
 Thu, 01 Oct 2020 04:12:34 -0700 (PDT)
Received: from felia ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id bk9sm3890193ejb.122.2020.10.01.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:12:33 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 1 Oct 2020 13:12:32 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20201001103314.136645-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010011309220.24571@felia>
References: <20201001103314.136645-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
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



On Thu, 1 Oct 2020, Dwaipayan Ray wrote:

> Checkpatch.pl doesn't have a check for excluding while (...) {...}
> blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> 
> For example, running checkpatch.pl on the file mm/access.c in the
> kernel generates the following error:
> 
> ERROR: Macros with complex values should be enclosed in parentheses
> +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
> +	while (len >= sizeof(type)) {					\
> +		__get_kernel_nofault(dst, src, type, err_label);	\
> +		dst += sizeof(type);					\
> +		src += sizeof(type);					\
> +		len -= sizeof(type);					\
> +	}
> 
> The error is misleading for this case. Enclosing it in parantheses

s/parantheses/parentheses/

In my previous review, I already pointed that spelling mistake; was there 
a mess-up with sending out the new patch?

I will start running a quick evaluation...

> doesn't make any sense.
> 
> Checkpatch already has an exception list for such common macro types.
> Added a new exception for while (...) {...} style blocks to the same.
> This effectively fixed the wrong error message.
> 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 72c4072307ea..c2c211374662 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5342,6 +5342,7 @@ sub process {
>  			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
>  			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
>  			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
> +			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&		# while (...) {...}
>  			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
>  			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
>  			    $dstat !~ /^do\s*{/ &&					# do {...
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
