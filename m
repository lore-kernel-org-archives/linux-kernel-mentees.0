Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3253C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:34:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF0F20738
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 09:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyauHyC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF0F20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67BD8855B1;
	Thu, 27 Aug 2020 09:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kh7AgvwR09s6; Thu, 27 Aug 2020 09:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9C9185579;
	Thu, 27 Aug 2020 09:34:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D760CC016F;
	Thu, 27 Aug 2020 09:34:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B746FC0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A6E96855B1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zK3KkhQc2I_1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:34:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 955E585579
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 09:34:20 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id si26so6719520ejb.12
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OPN019dv0ZwUErJy29rnKsWnH/b9Woj3nbMNGrhAC8c=;
 b=QyauHyC15viX8/8BETQHlA5pax/IjzY2rWvLVuAuDl/aesI3URhsEWV8La+UcF2aVm
 m6zW1XaCMrXpkMix02OjT9BelGbwB5kM1LV7nGw+onYgBfkOhl/NE6CTCBRofdXqL6+A
 19IcOKKtBV1dOQ6wXaWpYAG/z8wtS28hnixs8V4HiKzuVENEFpmnYlSrLlzRJIAGK7Ka
 fwlStZZUBm8wIffQaA9j/8d80xQB63VXetYk8UTIJX0Ava4YvK/QW1H7BYkCdkwYs/wu
 /jc6vpwc3osLgK3/HEFkDTlRVMKL/cpNloPS8Wd4o3iszmzY7jEpij2iumzvqffjt49H
 k3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OPN019dv0ZwUErJy29rnKsWnH/b9Woj3nbMNGrhAC8c=;
 b=A1+1nWwE5QAryG97+jR3YrSftkTs70wNF14N69UQVr7B9/pThpT3GTdstP1QsqvdQ0
 PwH3G0aTGi9k1n5Xd32J7t2YEGZzQG6optpl+9KrNHWZStOkaVWbJkuhSHDHeL67yUfs
 u+u2zfJj0wPi07WpxfwzbZwg/Fg++NIWn5SMyRr672XmtxUfgtsuF01xTcpBGx7CQOEQ
 pM8qGUtvuWnM7S3R6aoJNb9uwxdEG8Wcprd8hj0U9bCWZRoWUdRalSfSXKee9QxgD1T6
 vtSiYnUY8b3uEavIpQIprTvLehKXe3zUheYT9cl5PE1gkFRYxULYA6cQAo16JjXKtufn
 d0dw==
X-Gm-Message-State: AOAM530fd+hgrUWaWU5FmhAJKjdUhq0WhNSfg0SebgXxbu3bxVgUOX45
 tPBgSGn9guNZfGu1h4xlcak=
X-Google-Smtp-Source: ABdhPJzffUigmoS/TVvnVrsWqLpw6dP+dVGX9uIaZIdtyoo+ufdyWlLglYNyqstNFbsWvQVHH8RfgA==
X-Received: by 2002:a17:906:780f:: with SMTP id
 u15mr6347818ejm.259.1598520858899; 
 Thu, 27 Aug 2020 02:34:18 -0700 (PDT)
Received: from felia ([2001:16b8:2d0c:fc00:340b:71b8:4541:aa75])
 by smtp.gmail.com with ESMTPSA id f5sm1132738edv.4.2020.08.27.02.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 02:34:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 27 Aug 2020 11:34:17 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
Message-ID: <alpine.DEB.2.21.2008271128540.25858@felia>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-spdx@vger.kernel.org, maennich@google.com, linux-kernel@vger.kernel.org,
 re.emese@gmail.com, tglx@linutronix.de,
 Linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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



On Thu, 27 Aug 2020, Mrinal Pandey wrote:

> commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> spdxcheck-test.sh to the repository without the executable flag and license
> information.
> 
> commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> and commit 9b4ade226f74 ("xen: build infrastructure for generating
> hypercall depending symbols") added the file xen-hypercalls.sh without the
> executable bit.
> 
> Set to usual modes for these files and provide the SPDX license for
> spdxcheck-test.sh. No functional changes.
> 
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>

This is a contribution from a candidate of the Linux Kernel Onboarding 
Mentorship. If successful, the candidate will work on improving 
checkpatch.pl so that we get closer to a state where we can run it as a 
bot reporting on patch submissions to mailing lists.

This was clean-up work we came across looking at SPDX license warnings,
script shebangs, and executable modes of files.

Acked-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

> ---
> applies cleanly on next-20200827
> 
> Kees, Matthias, Thomas, please ack this patch.
> 
> Andrew, please pick this minor non-urgent cleanup patch once the
> mainainers ack.
> 
>  scripts/gcc-plugins/gen-random-seed.sh | 0
>  scripts/nsdeps                         | 0
>  scripts/spdxcheck-test.sh              | 1 +
>  scripts/xen-hypercalls.sh              | 0
>  4 files changed, 1 insertion(+)
>  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
>  mode change 100644 => 100755 scripts/nsdeps
>  mode change 100644 => 100755 scripts/spdxcheck-test.sh
>  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> 
> diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plugins/gen-random-seed.sh
> old mode 100644
> new mode 100755
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> old mode 100644
> new mode 100755
> diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
> old mode 100644
> new mode 100755
> index cfea6a0d1cc0..e2902520a081
> --- a/scripts/spdxcheck-test.sh
> +++ b/scripts/spdxcheck-test.sh
> @@ -1,4 +1,5 @@
>  #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
>  
>  for PYTHON in python2 python3; do
>  	# run check on a text and a binary file
> diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
> old mode 100644
> new mode 100755
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
