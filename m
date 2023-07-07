Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0BFEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Jul 2023 16:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BD4611F6;
	Fri,  7 Jul 2023 16:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BD4611F6
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mNGL9eTY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcxXpI0_JdHx; Fri,  7 Jul 2023 16:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C2471611DF;
	Fri,  7 Jul 2023 16:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2471611DF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C0FAC0071;
	Fri,  7 Jul 2023 16:57:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2382FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5EA5829A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5EA5829A9
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=mNGL9eTY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYAjl4CBOGOt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:57:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AFB828F8
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18AFB828F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:57:54 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-6826902bc8dso4584559b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 09:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688749074; x=1691341074;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=T8kfXm2/W74B4zGPxoyUW11PQqOgj8MhgRjbVw9AImg=;
 b=mNGL9eTYdMsq+LURUt5eBgtvWnohTWqHeLUTVaVHmwEgtsySYbFd91gLrQrnBFFDgW
 IHlFTIYZcjpn26R3cv4CEAvrz1ul83FTamN/ukFEMhWUutBsVzC0zWeUs+c0yodE2PFC
 kgv04pRZ24D6NvXIxMGzevSqr8UiI9ldB7BgNMUmnkDo9WSqR0nsZK5wtg9hEvs0pzao
 a0BK2sPsDqLU009+4lDRyaM+53JRPG2yRYkFeBT/N7tAujfn5kWMa2s5C3zxYh0QvsNN
 qF0/pQjbM22JA1iHYj6UB63WK/aMYmv9VD00bzN9hp3tQgbSFQWlUz3fYJMhPdMj/m+F
 hCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688749074; x=1691341074;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T8kfXm2/W74B4zGPxoyUW11PQqOgj8MhgRjbVw9AImg=;
 b=N3vtUXGhurrma5Bn2N7Zj8ZwvEZNe2U3V82PP8ZbirLjIHBf37uJYVmcKHIH3LmEAo
 NhoRcoCkOEZaS8V025TZrQgF+JJ/Gqtby19Ux3KYWIcdAeq1RGYYecrhfI2rM/hjwoT+
 rt1z2uRaC5XWVq0fQX/qff/2+58s8J75dxirMqWyQ5MxowtGhY64onlhRKGlIOSlS/Kt
 6oE/3IwcZVDjJ6yGiqaRy/2CdIz1JneViWDg3TB3I6ldmE4ZArtSkwg2FYEU95ZSDnxG
 nMoWGPyqXaDL2FsIdXy+XhVTB98aWLzlw3ddEYUHiJJoFxC4ym+3/Kl5RujMv8kU3nSC
 vdOg==
X-Gm-Message-State: ABy/qLbc8KVT7TxG0i2QYgvBryOEXehGoT1mefbVaWpm/bJrkOpC3KIi
 9714AYYHGeegGIBgcSHXS4oPAy0=
X-Google-Smtp-Source: APBJJlGW5xvGodePp4EGgD63HeAi4mU4GzzBnZjwPfWwIZH5pTIeS5ZQxjYWlIQteGJJYSB5gokwIlk=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6a00:39a6:b0:676:20f8:be57 with SMTP id
 fi38-20020a056a0039a600b0067620f8be57mr8183036pfb.0.1688749074558; Fri, 07
 Jul 2023 09:57:54 -0700 (PDT)
Date: Fri, 7 Jul 2023 09:57:52 -0700
In-Reply-To: <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
Mime-Version: 1.0
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com> <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
Message-ID: <ZKhEEJfzCyYI7BfH@google.com>
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

On 07/07, Anh Tuan Phan wrote:
> 
> 
> On 7/7/23 01:16, Stanislav Fomichev wrote:
> > On 07/06, Anh Tuan Phan wrote:
> >> Update the Documentation to mention that some samples require pahole
> >> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
> >>
> >> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> >> ---
> >>  samples/bpf/README.rst | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
> >> index 57f93edd1957..631592b83d60 100644
> >> --- a/samples/bpf/README.rst
> >> +++ b/samples/bpf/README.rst
> >> @@ -14,6 +14,9 @@ Compiling requires having installed:
> >>  Note that LLVM's tool 'llc' must support target 'bpf', list version
> >>  and supported targets with command: ``llc --version``
> >>
> >> +Some samples require pahole version 1.16 as a dependency. See
> >> +https://docs.kernel.org/bpf/bpf_devel_QA.html for reference.
> >> +
> > 
> > Any reason no to add pahole 1.16 to this section above?
> >> Compiling requires having installed:
> >  * clang >= version 3.4.0
> >  * llvm >= version 3.7.1
> >  * pahole >= version 1.16
> > 
> > Although clang 3.4 probably won't get you anywhere these days. The
> > whole README seems a bit outdated :-)
> >
> 
> Put pahole requirement as your idea is better, thanks for suggestion.
> Will update it and clang version as well. For clang version, I think I
> can update min version as 11.0.0 (reference from
> https://www.kernel.org/doc/html/next/process/changes.html). Do you see
> any other potential outdated things in this document? I follow the above
> steps and it help me compile the sample code successfully.

Maybe we can reference that doc instead here? Otherwise that copy-pasted
11.0.0 will also get old. Just mention here that we need
clang/llvm/pahole to compile the samples and for specific versions
put a link to process/changes.rst
 
> >>  Clean and configuration
> >>  -----------------------
> >>
> >> @@ -28,6 +31,10 @@ Configure kernel, defconfig for instance::
> >>
> >>   make defconfig
> >>
> >> +Some samples require support for BPF Type Format (BTF). To enable it,
> >> open the
> >> +generated config file, or use menuconfig (by "make menuconfig") to
> >> enable the
> >> +following configs: CONFIG_BPF_SYSCALL and CONFIG_DEBUG_INFO_BTF.
> >> +
> > 
> > This is usually enabled by default, so why special case it here?
> > Maybe, if you want some hints about the config, we should add
> > a reference to tools/testing/selftests/bpf/config ?
> > 
> 
> The config CONFIG_DEBUG_INFO_BTF is disabled for some distros at least
> for mine. I ran "make defconfig" and it's not enabled by default so I
> think it worth to mention it here to help novice get started. I'll
> update it to reference to tools/testing/selftests/bpf/config .
> 
> >>  Kernel headers
> >>  --------------
> >>
> >> -- 
> >> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
