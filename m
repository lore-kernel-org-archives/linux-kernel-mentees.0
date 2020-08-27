Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B270C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 18:14:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270A722B4B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 18:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WX1hyySD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270A722B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9AB386092;
	Thu, 27 Aug 2020 18:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ebbio11dRXAD; Thu, 27 Aug 2020 18:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37CED8601B;
	Thu, 27 Aug 2020 18:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C010C07FF;
	Thu, 27 Aug 2020 18:14:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9EF9C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 18:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A2BD186277
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 18:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDIe-dVREfge
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 18:14:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2BA96865C1
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 18:14:31 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p37so3943885pgl.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=egw9om8RsmaPZ5tPzAY0iuGJgt+M0MCv6BBpqYPOWiA=;
 b=WX1hyySDuKLYfX6LFE7cjlGRzvBh5H+D8/6DEOHbE489xogPA18r7xRo+mNtq95+SD
 jdo8ktSdqVe+C7IGoj4w2k3XgUmfq9gLxxXgdThL++o0uYN5Ktltt8w/cv0iv1I5CH++
 EHrnuIKZN5nGzyROQNpq2pVY+p/Eu/MlTpyiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=egw9om8RsmaPZ5tPzAY0iuGJgt+M0MCv6BBpqYPOWiA=;
 b=iMD+R78IuQ/qTqp2cn25SWLXqs+ygMFHOMjUEbgHrm/VnJ9C1W927dbWH4aCQhCvGB
 WRGsV2F6qbh5pdWCpsqx17j544xwxyut75Xn3GorFnLboBkXOaSFZQ6NHvvy9nvmxGaS
 j6wu8R4wDRGwFUpXXA0wHPzm7FYh4m9NIEWubbdw7ln6oDWAjGrlG+DAoIsxJorBkulR
 fgl/LOWRVm4IL0klwURSh3zRRg6O2/8nzyARbThKqtuZ4WBanffxxY+58Y3IEc5ib1ut
 MyM6Pf2dFdMsWtl+bVepJdxcHxCkifpfRX3t+RFpPXUNj/k++W5Ns5cmBhfdayj2Wn5K
 l3QA==
X-Gm-Message-State: AOAM5327XI2k5IN+X3fBzFxFyweHwuJ76j/GqwRdfL2KVW77yzblhQ8L
 PPo6bm5fzZiLzwmW6hNQIUezSg==
X-Google-Smtp-Source: ABdhPJzGV2QPSzG3uVRG/o6Jhtf+oerJPcX2VXfJOagxOj7GobYJzv+lAXoO9dgsj/XS21gERtZ6ug==
X-Received: by 2002:aa7:9f5d:: with SMTP id h29mr2404455pfr.133.1598552070574; 
 Thu, 27 Aug 2020 11:14:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u8sm3476103pfm.133.2020.08.27.11.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 11:14:29 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:14:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Mrinal Pandey <mrinalmni@gmail.com>
Message-ID: <202008271102.FEB906C88@keescook>
References: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827092405.b6hymjxufn2nvgml@mrinalpandey>
Cc: linux-spdx@vger.kernel.org, maennich@google.com,
 linux-kernel@vger.kernel.org, re.emese@gmail.com, tglx@linutronix.de,
 Thierry Reding <treding@nvidia.com>,
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

On Thu, Aug 27, 2020 at 02:54:05PM +0530, Mrinal Pandey wrote:
> commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> and commit 9b4ade226f74 ("xen: build infrastructure for generating
> hypercall depending symbols") added the file xen-hypercalls.sh without the
> executable bit.
> [...]
>  scripts/gcc-plugins/gen-random-seed.sh | 0
>  scripts/nsdeps                         | 0
>  scripts/spdxcheck-test.sh              | 1 +
>  scripts/xen-hypercalls.sh              | 0
>  4 files changed, 1 insertion(+)
>  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
>  mode change 100644 => 100755 scripts/nsdeps
>  mode change 100644 => 100755 scripts/spdxcheck-test.sh
>  mode change 100644 => 100755 scripts/xen-hypercalls.sh

I can't find "official" guidance on this right now, but I'm pretty sure
this (having execute bits set correctly) wasn't something we could depend
on (i.e. regular "diff" output doesn't support it (just git's diff),
and copies of the tree (or tarballs, etc) may have missed the bits). All
the portions of the kernel that uses these kinds of files explicitly
specify the interpreter (or universally set the execute bit)[1]. As such,
is this change useful?

It might be better to _remove_ execute bits to catch the places where
the build is accidentally depending on them. ;)

-Kees


[1] These all use CONFIG_SHELL:

scripts/gcc-plugins/Makefile:
  $(CONFIG_SHELL) $(srctree)/$(src)/gen-random-seed.sh $@ $(objtree)/include/generated/randomize_layout_hash.h

Makefile:
       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps

arch/x86/entry/syscalls/Makefile:
quiet_cmd_hypercalls = HYPERCALLS $@
      cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$^)
...
$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh
        $(call if_changed,hypercalls)

And I can't even find anything in the kernel that calls
scripts/spdxcheck-test.sh :) I think that should likely be moved into
the selftests directory and wired up.


-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
