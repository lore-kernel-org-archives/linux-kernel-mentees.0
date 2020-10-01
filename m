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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76328C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F022087E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnP+SqoY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F022087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8374487282;
	Thu,  1 Oct 2020 08:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koeF9ctcrG2v; Thu,  1 Oct 2020 08:22:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7E7D87248;
	Thu,  1 Oct 2020 08:22:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB1A4C0889;
	Thu,  1 Oct 2020 08:22:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D042DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B92788724C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zUxJ0GLwvIn7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB46387248
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 08:22:06 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c8so4698623edv.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 01:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YF9evviq+nkxsuSsWVscNijCubvIgH7GtofQqCQyTR0=;
 b=DnP+SqoY6LRTMQREFtcRJuX98K2chfiyb5t5SW4mLYxw+bGz/dzQ0zHc+dXbgJF0As
 FaQOrMUlCJsw/rbH3TRcaD3QPmotb3GxwRnkqL6KLYwrV1DkSPeT/skdppeIUY0LWqxQ
 tMXiJAkyCtemAMIvrSFJMGITNlSEU6X6q4sxAEAPzpNP7HETjevAn2GYWTaUb/WPKLHY
 8vC/m6JTgGoU1en/Ojab6pO2SrKDsKYBJzl/0hQSqJ6h78iFi3b3DqkJECDutX4Pj2bS
 Vaybp2wN57t0dLzLjK/EHFk84Z6XYTXaJModqbVERJu7dEWzFZFM4iyE0j3JS6d/aMU5
 XYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YF9evviq+nkxsuSsWVscNijCubvIgH7GtofQqCQyTR0=;
 b=XqtWtyft2uQqLojK5KRctXV2xrpEsqR4+TjBWu1xMD815tAwv1lhje0qrJstDUHYNB
 5eX3XaIuQaK1M7hBlxSOC1ozjTG73NxtLFP5WQL3u05tyI2w+Fb1u0NA8g0dxggqnCvb
 HupKaC6mJ9hanFNApJ7UfC7DxCDyo4rXxl6pWS/ddBU6nvCDD/b2wWys3QSlpNKesMkE
 nSSq/gImehn+y8+hyFHilPrck+P/Eclxl+XmC2lk5sofuKev3I59pKwiCn65VHdR0biS
 DFZEOh5hfN5BeG4c/HRQPP799burggltL6gUsdZp0nfs9XzpkCRvqQ581mBgci3HG/n0
 TvQw==
X-Gm-Message-State: AOAM531ARCL43jBBttN2x1jwfXUz7sRsO4dyimNTgBzFf0pTFbcb2EVK
 EgBVzGcL1KyBkT/rZJVQkg0=
X-Google-Smtp-Source: ABdhPJzJ0mkMmNV4OrZMaWuD+lLzWWwMayJXuff9dxCs5j8aTiIfAFeFZXnU0vWOZDEfqNvvZN91Jw==
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr7010731edi.148.1601540525191; 
 Thu, 01 Oct 2020 01:22:05 -0700 (PDT)
Received: from felia ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id u13sm3647219ejn.82.2020.10.01.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 01:22:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 1 Oct 2020 10:22:03 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Theodoros Chatziioannidis <sdi1600197@di.uoa.gr>
In-Reply-To: <20200930210333.166006-2-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010011014540.24571@felia>
References: <20200930210333.166006-1-dwaipayanray1@gmail.com>
 <20200930210333.166006-2-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 2/2] checkpatch: fix
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
> The error is misleading for this case. Enclosing it in a paranthesis
> doesn't make any sense.
>

s/a paranthesis/parentheses/

> Checkpatch already has an exception list for such common macro types.
> Added a new exception for while (...) {...} style blocks to the same.
> This effectively fixed the wrong error message.
>

This seems easier to understand and to judge than the other patch.

We will still need an evaluation, though. Theodoros, maybe you can help us 
here.

Dwaipayan, looks good to me. Do you fix up the spelling mistake and then 
send that patch to Joe and lkml?
 
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
> +			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&			# while (...) {...}

Is it just the tab setting in my email client or is there a tab too much 
that it does not align with the other comments?

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
