Return-Path: <SRS0=t6EQ=FO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56429C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 14:46:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FB222D74
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 14:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FB222D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63CE385965;
	Thu, 10 Dec 2020 14:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItqoT1vf1vsW; Thu, 10 Dec 2020 14:45:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF74D857D6;
	Thu, 10 Dec 2020 14:45:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9530C0893;
	Thu, 10 Dec 2020 14:45:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 931B5C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 814178586F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNa+I19lvQlB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:45:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0140.hostedemail.com
 [216.40.44.140])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3B0E3857D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:45:56 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id DA320800FCDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 14:36:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 8A46E180206F5;
 Thu, 10 Dec 2020 14:36:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: elbow97_3e04abc273f9
X-Filterd-Recvd-Size: 5049
Received: from XPS-9350.home (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Thu, 10 Dec 2020 14:36:07 +0000 (UTC)
Message-ID: <97a20537627bb281745fee157713200830c3a7bb.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 10 Dec 2020 06:36:06 -0800
In-Reply-To: <20201210141903.72327-1-dwaipayanray1@gmail.com>
References: <20201210141903.72327-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, 2020-12-10 at 19:49 +0530, Dwaipayan Ray wrote:
> Documentation/process/coding-style.rst specifies the use of
> IS_ENABLED macro:
> =

> Within code, where possible, use the IS_ENABLED macro to convert a Kconfig
> symbol into a C boolean expression, and use it in a normal C conditional:
> =

> 	if (IS_ENABLED(CONFIG_SOMETHING)) {
> 		...
> 	}
> =

> checkpatch correspondingly has a check for IS_ENABLED() without
> CONFIG_<FOO>.
> Add a --fix option to the check to automatically correct the argument.
> =

> Macros like:
> =A0#if IS_ENABLED(THERMAL)
> =

> is corrected to:
> =A0#if IS_ENABLED(CONFIG_THERMAL)

I think adding a --fix option here is not a good option.

Look at the existing uses without CONFIG and tell me
the majority of them need to have CONFIG added.

$ git grep -P '\bIS_ENABLED\s*\(\s*(?!CONFIG_)'
arch/arc/include/asm/asserts.h: chk_opt_strict(#opt_name, hw_exists, IS_ENA=
BLED(opt_name));     \
arch/arc/include/asm/asserts.h: chk_opt_weak(#opt_name, hw_exists, IS_ENABL=
ED(opt_name));       \
arch/arc/include/asm/setup.h:#define IS_USED_CFG(cfg)   IS_USED_RUN(IS_ENAB=
LED(cfg))
arch/arm64/include/asm/alternative-macros.h:    __ALTERNATIVE_CFG(oldinstr,=
 newinstr, feature, IS_ENABLED(cfg))
arch/arm64/include/asm/alternative-macros.h:    alternative_insn insn1, ins=
n2, cap, IS_ENABLED(cfg)
arch/arm64/include/asm/cpufeature.h:    (IS_ENABLED(config) ? FTR_VISIBLE :=
 FTR_HIDDEN)
arch/x86/mm/numa.c:     if (IS_ENABLED(NODE_NOT_IN_PAGE_FLAGS)) {
drivers/gpu/drm/exynos/exynos_drm_drv.c:#define DRV_PTR(drv, cond) (IS_ENAB=
LED(cond) ? &drv : NULL)
drivers/gpu/drm/i915/i915_utils.h: * This is a lookalike for IS_ENABLED() t=
hat takes a kconfig value,
drivers/gpu/drm/i915/i915_utils.h: * Sadly IS_ENABLED() itself does not wor=
k with kconfig values.
drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    if (IS_ENABLED(cond) && \
drivers/net/wireguard/allowedips.c:             WARN_ON(IS_ENABLED(DEBUG) &=
& *len >=3D 128);
drivers/net/wireguard/allowedips.c:             WARN_ON(IS_ENABLED(DEBUG) &=
& len >=3D 128);                      \
drivers/net/wireguard/noise.c:  WARN_ON(IS_ENABLED(DEBUG) &&
drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_PRINT_=
TRIE_GRAPHVIZ)) {
drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_PRINT_=
TRIE_GRAPHVIZ)) {
drivers/net/wireguard/selftest/allowedips.c:    if (IS_ENABLED(DEBUG_RANDOM=
_TRIE) && success)
drivers/phy/broadcom/phy-brcm-usb-init.h:       if (IS_ENABLED(CONFIG_MIPS)=
 && IS_ENABLED(__BIG_ENDIAN))
drivers/phy/broadcom/phy-brcm-usb-init.h:       if (IS_ENABLED(CONFIG_MIPS)=
 && IS_ENABLED(__BIG_ENDIAN))
include/asm-generic/vmlinux.lds.h:#define OF_TABLE(cfg, name)   __OF_TABLE(=
IS_ENABLED(cfg), name)
include/crypto/blake2s.h:       WARN_ON(IS_ENABLED(DEBUG) && (!outlen || ou=
tlen > BLAKE2S_HASH_SIZE ||
include/crypto/blake2s.h:       WARN_ON(IS_ENABLED(DEBUG) && ((!in && inlen=
 > 0) || !out || !outlen ||
include/linux/init.h:   int var =3D IS_ENABLED(config);                    =
               \
include/linux/kconfig.h: * This is similar to IS_ENABLED(), but returns fal=
se when invoked from
include/linux/kconfig.h:#define IS_ENABLED(option) __or(IS_BUILTIN(option),=
 IS_MODULE(option))
include/linux/page-flags-layout.h: * the IS_ENABLED() macro.
include/linux/raid/pq.h:#define IS_ENABLED(x) (x)
lib/crypto/blake2s-generic.c:   WARN_ON(IS_ENABLED(DEBUG) &&
lib/crypto/blake2s.c:   WARN_ON(IS_ENABLED(DEBUG) && !out);
lib/crypto/chacha20poly1305-selftest.c: for (total_len =3D POLY1305_DIGEST_=
SIZE; IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)
lib/test_ubsan.c:                       #config, IS_ENABLED(config) ? "y" :=
 "n");       \
scripts/checkpatch.pl:# check for IS_ENABLED() without CONFIG_<FOO> ($rawli=
ne for comments too)
scripts/checkpatch.pl:                       "IS_ENABLED($1) is normally us=
ed as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr);
scripts/checkpatch.pl:                           "Prefer IS_ENABLED(<FOO>) =
to ${CONFIG_}<FOO> || ${CONFIG_}<FOO>_MODULE\n" . $herecurr) &&
scripts/checkpatch.pl:                          $fixed[$fixlinenr] =3D "\+#=
if IS_ENABLED($config)";
tools/testing/scatterlist/linux/mm.h:#define IS_ENABLED(x) (0)



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
