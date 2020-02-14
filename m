Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CA8C3B18F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 05:08:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32802222C2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 05:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8Z4upYy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32802222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 04DB6220C1;
	Fri, 14 Feb 2020 05:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7VwECUskWag; Fri, 14 Feb 2020 05:08:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 403BA20364;
	Fri, 14 Feb 2020 05:08:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3649CC07FE;
	Fri, 14 Feb 2020 05:08:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B772C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 05:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7066D86371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 05:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B50iepRhrSig
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 05:08:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CD6D86356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 05:08:17 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id p125so8265813oif.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 21:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g5tkm3qb8BO7Z0wo0yBzQsaZJjInwgc2KW7PmkfJN8o=;
 b=P8Z4upYyZIt9rC+Lze8OM1PYy6byNSNWD5OYBPeQMzKcHotaP+7c4dSOESMUFxRq44
 qyjgfhaGLL0dgP2WUxEiLcnY6Zm0V3/I7HvAMdb9aqGlYH6fv1ci0BMa3u3dXYFE/Hbn
 T7Fa4xwV8jMKeR2cVOBtDPZZx52wdG9JmuE20YRKj1OOWdrggzmY6gYtY+VTEeEXpUDO
 2jj5EfbEPJBRczsUmctJZrXMMeL/xrwlErTCAKu4XlJQU4Zm2R2pNWNYCB3KvWu+Jyg1
 v85ORQWKAzvwPLvTmkOjMkpX9NG2KI1WvbdOPmOsunZGa2zhPppezeMRAmmnZrsCyS6k
 UOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g5tkm3qb8BO7Z0wo0yBzQsaZJjInwgc2KW7PmkfJN8o=;
 b=eNr/5qTlp6UhSChw4Uo1PMr7RQSMo0PoUwfruiGZJsnjFooLit7a/JWhIRra/rydSC
 SYCTkTByX5ZhFBDD2yn/gF/jiGxqHHcjcjURs9Vv5W5vZoepYU+si6w2ks4X1DyKSsMY
 01okOsdPZjMD/8mcEIKwE7k1uIQmnAeA0j6ZRgkObr2jqvMVoEHJn8k8+9xUcEeR/fTc
 yR8bXtKnObifskEaUaalO6oRv8NoVZqA+XIxcTprSO0pKZxkMK+0rUfksZeKwiNwDn4D
 uRAe5vr5EnUNFABmGsEfyHF8QabeqaByZ0dt0MdCYBSHR1le6kGU4K37B4lvV2rcgU2x
 n3+g==
X-Gm-Message-State: APjAAAVw2XVUyAcCXopKuiKoN466pkfF7RVyyMvQ720+3GZQggL9UnP0
 H0CBTdgdeRMkMiM3A2gU6PQ=
X-Google-Smtp-Source: APXvYqwmsvJ9mLd4oS94dKKQMhOhT/VRHdWDfoyvWZlcE8NKg5nlpI9KvjoEo3R8/ZFz7AH47hGyGQ==
X-Received: by 2002:aca:37c3:: with SMTP id e186mr717091oia.155.1581656896255; 
 Thu, 13 Feb 2020 21:08:16 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id t23sm1436883oic.28.2020.02.13.21.08.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Feb 2020 21:08:15 -0800 (PST)
Date: Thu, 13 Feb 2020 22:08:13 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
References: <20200210154102.118166-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210154102.118166-1-dwlsalmeida@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] media: dvb_dummy_tuner:
	implement driver skeleton
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

Hi Daniel,

On Mon, Feb 10, 2020 at 12:41:02PM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> The virtual DVB test driver serves as a reference DVB driver and helps
> validate the existing APIs in the media subsystem. It can also aid developers
> working on userspace applications.
> 
> This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> ISDB-T and ATSC when completed.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

This patch and another one that you have [1] cause a ton of build
warnings with clang, as reported by the 0day bot, because of the
implicit conversions from floating points to integer. Is this
intentional? Would you mind taking a look at them and addressing them if
you do another revision?

You can view the reports here:

https://groups.google.com/d/msg/clang-built-linux/54FdauqEgTY/EjYzpdgxBgAJ
https://groups.google.com/d/msg/clang-built-linux/VY02Ju2AHrk/Hu8lxhdCBgAJ

[1]: https://lore.kernel.org/lkml/20200210154555.156283-1-dwlsalmeida@gmail.com/

Cheers,
Nathan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
