Return-Path: <SRS0=t6EQ=FO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE977C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 14:54:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2401323118
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 14:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2401323118
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DC6C87150;
	Thu, 10 Dec 2020 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GA-pCKg3rAYb; Thu, 10 Dec 2020 14:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13DCD87135;
	Thu, 10 Dec 2020 14:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF050C0893;
	Thu, 10 Dec 2020 14:54:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6714C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 96AF520479
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RvOC3HVw-ju
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 6B2B620111
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:54:42 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h19so8569027lfc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O6ptu9+yUqmrrvRHBz+Ms5c7MJTZlfGGguaJ8+pJhRs=;
 b=qxBha0sjMFxg78EJkra1StvHmiJuvX4oZdELZZHCiMYynG9+F2BGZs8Yaiw9qAKdi8
 fxY7UzrkO85flZO+CSrbBvebiSEju746gwY/NF4sBcdMiwzhEFWDk16DGFly+nVSgIc1
 LnJK7PLqlSTzXFJDHN7xtRWPo+m+1IsIwr43WWde3G8pDSP7KFg1I3Ie6gTsWrW0ncPr
 XY9y4A2Hu8YsqjB4iZVfOgDMk62zejdDD+8h1zWB06jIcljpu0N3Pque8hVyd5QqcD6q
 /5AbBTX81YZ/S2rW7rphnJ5dOCB0Y0uLvMMwbaYS/bGF7RUXBTOtwYp00VZfEvwEb/mc
 Bh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O6ptu9+yUqmrrvRHBz+Ms5c7MJTZlfGGguaJ8+pJhRs=;
 b=h2kFN4wfdpfC5nS5CbtWHVhEGpsOmm1LCjufVVe4B/xZm3E5lH7YqKlJNdcFome2Hd
 orKB9Ye9SO5jnIs8lkyRv5dheOd+QengBU/5zMGAUz9eCIXVgTLGdzZtY3I4Wu5NKJJX
 1LyVe6hCBh0u5wlsv39fG4OzwFRD7z/NO+kT34eKTrt6yTJrBppUuNf8OzP/oSe0dU6z
 TeX+GUGz96+AqQi6ay06IoiOkRWxMDYT4RhbXmrG3oGCG7RN1dQj9BwFXgTwxwqbt9J4
 mmQqQnkmXYar7Zf7vpu+CbikN5fC+dZs3gnj2/cEGGl+1xng3uLZmYsxk9gCUYkBzXvD
 VH8Q==
X-Gm-Message-State: AOAM530RzEFZiVh+itDwh5Jgn4sVrQjXI2vseq1TnjNKLoYfnxhTwnx8
 M2VF7hH5xsCcvkt9ZEOu8W4zKrL8AlcKNCYgr0Y=
X-Google-Smtp-Source: ABdhPJx9BBe95t8VEi0zGcvOT3yVFSJe0tilLfooilcZm/UnWooZuHQA/ZBkhpu8dfmwgsQSCzqTTtmtUxFTJgle8F0=
X-Received: by 2002:a19:5f06:: with SMTP id t6mr2921786lfb.117.1607612080214; 
 Thu, 10 Dec 2020 06:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20201210141903.72327-1-dwaipayanray1@gmail.com>
 <97a20537627bb281745fee157713200830c3a7bb.camel@perches.com>
In-Reply-To: <97a20537627bb281745fee157713200830c3a7bb.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 10 Dec 2020 20:24:15 +0530
Message-ID: <CABJPP5Cjyh1QekK7LnTbxYEgmtLMO81Vdu77tGTRrNhjL_iEcg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option to
	IS_ENABLED_CONFIG check
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

> > checkpatch correspondingly has a check for IS_ENABLED() without
> > CONFIG_<FOO>.
> > Add a --fix option to the check to automatically correct the argument.
> >
> > Macros like:
> >  #if IS_ENABLED(THERMAL)
> >
> > is corrected to:
> >  #if IS_ENABLED(CONFIG_THERMAL)
>
> I think adding a --fix option here is not a good option.
>
> Look at the existing uses without CONFIG and tell me
> the majority of them need to have CONFIG added.
>
> $ git grep -P '\bIS_ENABLED\s*\(\s*(?!CONFIG_)'
> arch/arc/include/asm/asserts.h: chk_opt_strict(#opt_name, hw_exists, IS_ENABLED(opt_name));     \
> arch/arc/include/asm/asserts.h: chk_opt_weak(#opt_name, hw_exists, IS_ENABLED(opt_name));       \
> arch/arc/include/asm/setup.h:#define IS_USED_CFG(cfg)   IS_USED_RUN(IS_ENABLED(cfg))
> arch/arm64/include/asm/alternative-macros.h:    __ALTERNATIVE_CFG(oldinstr, newinstr, feature, IS_ENABLED(cfg))
> arch/arm64/include/asm/alternative-macros.h:    alternative_insn insn1, insn2, cap, IS_ENABLED(cfg)
> arch/arm64/include/asm/cpufeature.h:    (IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
> arch/x86/mm/numa.c:     if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
> drivers/gpu/drm/exynos/exynos_drm_drv.c:#define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
> drivers/gpu/drm/i915/i915_utils.h: * This is a lookalike for IS_ENABLED() that takes a kconfig value,
> drivers/gpu/drm/i915/i915_utils.h: * Sadly IS_ENABLED() itself does not work with kconfig values.
> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    if (IS_ENABLED(cond) && \
> drivers/net/wireguard/allowedips.c:             WARN_ON(IS_ENABLED(DEBUG) && *len >= 128);
> drivers/net/wireguard/allowedips.c:             WARN_ON(IS_ENABLED(DEBUG) && len >= 128);                      \
> drivers/net/wireguard/noise.c:  WARN_ON(IS_ENABLED(DEBUG) &&
> drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)) {
> drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)) {
> drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_RANDOM_TRIE) && success)
> drivers/phy/broadcom/phy-brcm-usb-init.h:       if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
> drivers/phy/broadcom/phy-brcm-usb-init.h:       if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
> include/asm-generic/vmlinux.lds.h:#define OF_TABLE(cfg, name)   __OF_TABLE(IS_ENABLED(cfg), name)
> include/crypto/blake2s.h:       WARN_ON(IS_ENABLED(DEBUG) && (!outlen || outlen > BLAKE2S_HASH_SIZE ||
> include/crypto/blake2s.h:       WARN_ON(IS_ENABLED(DEBUG) && ((!in && inlen > 0) || !out || !outlen ||
> include/linux/init.h:   int var = IS_ENABLED(config);                                   \
> include/linux/kconfig.h: * This is similar to IS_ENABLED(), but returns false when invoked from
> include/linux/kconfig.h:#define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
> include/linux/page-flags-layout.h: * the IS_ENABLED() macro.
> include/linux/raid/pq.h:#define IS_ENABLED(x) (x)
> lib/crypto/blake2s-generic.c:   WARN_ON(IS_ENABLED(DEBUG) &&
> lib/crypto/blake2s.c:   WARN_ON(IS_ENABLED(DEBUG) && !out);
> lib/crypto/chacha20poly1305-selftest.c: for (total_len = POLY1305_DIGEST_SIZE; IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)
> lib/test_ubsan.c:                       #config, IS_ENABLED(config) ? "y" : "n");       \
> scripts/checkpatch.pl:# check for IS_ENABLED() without CONFIG_<FOO> ($rawline for comments too)
> scripts/checkpatch.pl:                       "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr);
> scripts/checkpatch.pl:                           "Prefer IS_ENABLED(<FOO>) to ${CONFIG_}<FOO> || ${CONFIG_}<FOO>_MODULE\n" . $herecurr) &&
> scripts/checkpatch.pl:                          $fixed[$fixlinenr] = "\+#if IS_ENABLED($config)";
> tools/testing/scatterlist/linux/mm.h:#define IS_ENABLED(x) (0)
>
>

That's true.
The following looks okay to me:

IS_ENABLED(DEBUG)
IS_ENABLED(cfg)
IS_ENABLED(opt_name)
IS_ENABLED(option)
IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)
IS_ENABLED(config)
IS_ENABLED(cond)
IS_ENABLED(__BIG_ENDIAN)
IS_ENABLED(x)
IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)

Adding a CONFIG_ in these would be wrong I think.
I will drop this patch.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
