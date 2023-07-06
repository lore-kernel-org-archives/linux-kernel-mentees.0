Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064AEEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 18:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814658227F;
	Thu,  6 Jul 2023 18:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814658227F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=I7RGLB0u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uMZU0VszvIk; Thu,  6 Jul 2023 18:16:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5E34A821A5;
	Thu,  6 Jul 2023 18:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E34A821A5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AAB1C0071;
	Thu,  6 Jul 2023 18:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C508C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40AE82258
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40AE82258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4cOMDTeReg1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:16:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F9D821A5
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0F9D821A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:16:29 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-668728bb904so1529235b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 11:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688667389; x=1691259389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=g7bcGKfqy3IhA8j+aFZQMe/R+wBoGTcL9Apo1o/U2h0=;
 b=I7RGLB0uTkALR8qWTmrtGHlWVVgMld9o1QUAQ3tS1bqbk5UjIwpmXfYdf3FLWKl0lk
 R8B4ltEjgeARF1XkSlCqOCmBTIfA8+mwlZ2ODD4LLJC/O/RN5jrCmqQ2yJkRHJiWLZzB
 mKjgscm1aQsVWLyyQ6hv8TMGY4tEOEZQ0Cnj20AXL5zgOXmoCUZmBjGHpyUs38KuFP02
 5NrHsJq4RQ9I31NEG3dRYpfzCC4AaLjN6jlKd1e0KIAr5S0RIaepfyrD1gxeJH44Ep1L
 fV+mjTz4YI+GLe7/hC85lcP4opBE8ZuOnyr0xgMQkpWcAri5koVY6mHp58mG9sbVNMrM
 JBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688667389; x=1691259389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7bcGKfqy3IhA8j+aFZQMe/R+wBoGTcL9Apo1o/U2h0=;
 b=bIHYxKu7E0n+LJ6buyfW/7RTmiDHDxNC0R4OiiYymOSg0gDCPs805ItlY9zLMi+rAJ
 eck+CetnTI8BkL/5eAGgYLz8HcplxHTy9ADHPR1a3VdL39q2mVzO9WXFONmR/HDPg69B
 AQHoQPUJQy/+c+q+tNdp7W+YHnyQKvm6vAhWqrYO9zr9f0sKZEkuVm6KIw6x5ZMfc1I6
 2OalGJlP3/OorxVrbEsAfn7nrp4ZzseQgaOlSQ7ZTjeGWuO93yzVbgF9446AUviuaa4F
 8mvuGYnJ5HeUnwHN3ZizIftKI6odSEqJKcl8hUOooC7esPQG5lAPRLiekTmVQU94UqyW
 JtHg==
X-Gm-Message-State: ABy/qLbh4DB1poQeI4filmZi1ySVla3d5EP6mJwxbtncu7EG8WpWR57/
 GqQvrWYdGH3zMz6UxabQ/kAB4Ak=
X-Google-Smtp-Source: APBJJlFaBwwxr4fY3i/lCrJiyW37Yf3g8v6biv1f6tLtm/C1dz1mPpymUT8bzPmG6Zq4RDKPDTISh60=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6a00:1a94:b0:676:ba7f:7906 with SMTP id
 e20-20020a056a001a9400b00676ba7f7906mr3263742pfv.3.1688667389054; Thu, 06 Jul
 2023 11:16:29 -0700 (PDT)
Date: Thu, 6 Jul 2023 11:16:27 -0700
In-Reply-To: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
Mime-Version: 1.0
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
Message-ID: <ZKcE+wMWGdVFSBX2@google.com>
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 07/06, Anh Tuan Phan wrote:
> Update the Documentation to mention that some samples require pahole
> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
>  samples/bpf/README.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
> index 57f93edd1957..631592b83d60 100644
> --- a/samples/bpf/README.rst
> +++ b/samples/bpf/README.rst
> @@ -14,6 +14,9 @@ Compiling requires having installed:
>  Note that LLVM's tool 'llc' must support target 'bpf', list version
>  and supported targets with command: ``llc --version``
> 
> +Some samples require pahole version 1.16 as a dependency. See
> +https://docs.kernel.org/bpf/bpf_devel_QA.html for reference.
> +

Any reason no to add pahole 1.16 to this section above?

Compiling requires having installed:
 * clang >= version 3.4.0
 * llvm >= version 3.7.1
 * pahole >= version 1.16

Although clang 3.4 probably won't get you anywhere these days. The
whole README seems a bit outdated :-)

>  Clean and configuration
>  -----------------------
> 
> @@ -28,6 +31,10 @@ Configure kernel, defconfig for instance::
> 
>   make defconfig
> 
> +Some samples require support for BPF Type Format (BTF). To enable it,
> open the
> +generated config file, or use menuconfig (by "make menuconfig") to
> enable the
> +following configs: CONFIG_BPF_SYSCALL and CONFIG_DEBUG_INFO_BTF.
> +

This is usually enabled by default, so why special case it here?
Maybe, if you want some hints about the config, we should add
a reference to tools/testing/selftests/bpf/config ?

>  Kernel headers
>  --------------
> 
> -- 
> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
