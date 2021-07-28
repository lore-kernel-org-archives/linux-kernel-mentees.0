Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDB0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 09:13:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9B360F43
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 09:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA9B360F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF49C4035C;
	Thu, 29 Jul 2021 09:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbTjaGODnHc2; Thu, 29 Jul 2021 09:13:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 635C04012A;
	Thu, 29 Jul 2021 09:13:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36FEBC0010;
	Thu, 29 Jul 2021 09:13:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 184EBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F422D4012A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHXbQS9PsFCb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:13:31 +0000 (UTC)
X-Greylist: delayed 06:59:57 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB8AA40025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 09:13:31 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 1B5D8183A350B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 15:37:32 +0000 (UTC)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id E08D08384364;
 Wed, 28 Jul 2021 15:37:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id E75A51E04DC; 
 Wed, 28 Jul 2021 15:37:27 +0000 (UTC)
Message-ID: <e77e2329bdafdbea538be0d7edb8a9d7d3e45990.camel@perches.com>
Subject: Re: patch suggestion: Kconfig symbols
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org
Date: Wed, 28 Jul 2021 08:37:26 -0700
In-Reply-To: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E75A51E04DC
X-Stat-Signature: 5qy31or89zijdnzzji1i1rkhscozjti7
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18FCgSRglZtDtTA2N1byAEZIZJGv29Lhfk=
X-HE-Tag: 1627486647-572440
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Mon, 2021-07-26 at 17:21 -0700, Randy Dunlap wrote:
> Running scripts/checkkconfigsymbols.py reports several hundred (maybe thousand)
> Kconfig symbols that are used questionably. Lots of these are false positives
> but lots of the remainder could use some cleaning up.
[]
> False positive example:
> 
> XCHOFFLD_MEM
> Referencing files: drivers/scsi/qla2xxx/qla_mbx.c
> Similar symbols: OF_PMEM, CXL_MEM, CXL_PMEM
> 
> The Referencing source file does this:
> #define CONFIG_XCHOFFLD_MEM	0x3
> 
> which is legitimate, so no change is needed.

Legitimate is perhaps dubious.

It might be better if Kconfig has exclusive use of CONFIG_<foo> naming so
renaming all the other existing CONFIG_<foo> defines might be appropriate.

$ git grep -P '^\s*#\s*define\s+CONFIG_[A-Z]+\b'
arch/alpha/kernel/smc37c93x.c:#define CONFIG_CONTROL            0x02
arch/sh/drivers/pci/ops-sh4.c:#define CONFIG_CMD(bus, devfn, where) \
arch/sh/include/asm/smc37c93x.h:#define CONFIG_PORT             0x3f0
arch/sh/include/asm/smc37c93x.h:#define CONFIG_ENTER            0x55
arch/sh/include/asm/smc37c93x.h:#define CONFIG_EXIT             0xaa
arch/sparc/kernel/pcic.c:#define CONFIG_CMD(bus, device_fn, where) (0x80000000 | (((unsigned int)bus) << 16) | (((unsigned int)device_fn) << 8) | (where & ~3))
arch/um/drivers/mconsole_kern.h:#define CONFIG_CHUNK(str, size, current, chunk, end) \
drivers/atm/he.h:#define CONFIG_RSRA            0x00000
drivers/atm/he.h:#define CONFIG_RCMLBM          0x08000
drivers/atm/he.h:#define CONFIG_RCMABR          0x0d800
drivers/atm/he.h:#define CONFIG_RSRB            0x0e000
drivers/atm/he.h:#define CONFIG_TSRA            0x00000
drivers/atm/he.h:#define CONFIG_TSRB            0x08000
drivers/atm/he.h:#define CONFIG_TSRC            0x0c000
drivers/atm/he.h:#define CONFIG_TSRD            0x0e000
drivers/atm/he.h:#define CONFIG_TMABR           0x0f000
drivers/atm/he.h:#define CONFIG_TPDBA           0x10000
drivers/comedi/drivers/ni_at_a2150.c:#define CONFIG_REG         0x0
drivers/crypto/atmel-i2c.h:#define CONFIG_ZONE                  0
drivers/dma/idxd/perfmon.h:#define CONFIG_RESET         0x0000000000000001
drivers/gpu/drm/amd/amdgpu/sid.h:#define        CONFIG_MEMSIZE                                  0x150A
drivers/gpu/drm/amd/amdgpu/sid.h:#define CONFIG_CNTL    0x1509
drivers/gpu/drm/radeon/cikd.h:#define   CONFIG_MEMSIZE                                  0x5428
drivers/gpu/drm/radeon/evergreend.h:#define     CONFIG_MEMSIZE                                  0x5428
drivers/gpu/drm/radeon/nid.h:#define    CONFIG_MEMSIZE                                  0x5428
drivers/gpu/drm/radeon/r600d.h:#define  CONFIG_MEMSIZE                                  0x5428
drivers/gpu/drm/radeon/r600d.h:#define CONFIG_CNTL                                      0x5424
drivers/gpu/drm/radeon/rv515d.h:#define CONFIG_MEMSIZE                  0x00F8
drivers/gpu/drm/radeon/rv770d.h:#define CONFIG_MEMSIZE                                  0x5428
drivers/gpu/drm/radeon/sid.h:#define    CONFIG_MEMSIZE                                  0x5428
drivers/macintosh/therm_adt746x.c:#define CONFIG_REG   0x40
drivers/memory/ti-aemif.c:#define CONFIG_MASK   (TA(TA_MAX) | \
drivers/mtd/spi-nor/controllers/aspeed-smc.c:#define CONFIG_REG                 0x0
drivers/net/ethernet/smsc/smc91x.h:#define CONFIG_REG(lp)       SMC_REG(lp, 0x0000,     1)
drivers/net/ethernet/smsc/smc91x.h:#define CONFIG_GPCNTRL       0x0400  // Inverse value drives pin nCNTRL
drivers/net/ethernet/smsc/smc91x.h:#define CONFIG_DEFAULT       (CONFIG_EPH_POWER_EN)
drivers/pcmcia/cs_internal.h:#define CONFIG_LOCKED              0x01
drivers/pinctrl/mvebu/pinctrl-dove.c:#define CONFIG_PMU BIT(4)
drivers/staging/vt6655/device_cfg.h:#define CONFIG_PATH            "/etc/vntconfiguration.dat"
drivers/staging/vt6656/device.h:#define CONFIG_PATH                     "/etc/vntconfiguration.dat"
drivers/thermal/qcom/tsens-8960.c:#define CONFIG_ADDR           0x3640
drivers/thermal/qcom/tsens-8960.c:#define CONFIG_MASK           0xf
drivers/usb/host/xhci.h:#define CONFIG_CIE              (1 << 9)
drivers/video/fbdev/geode/display_gx1.h:#define CONFIG_GCR  0xb8
tools/power/x86/intel-speed-select/isst.h:#define CONFIG_TDP                            0x7f
tools/power/x86/intel-speed-select/isst.h:#define CONFIG_CLOS                           0xd0
tools/testing/selftests/powerpc/copyloops/asm/ppc_asm.h:#define CONFIG_ALTIVEC
tools/testing/selftests/powerpc/stringloops/asm/ppc_asm.h:#define CONFIG_ALTIVEC
tools/testing/selftests/rcutorture/formal/srcu-cbmc/src/config.h:#define CONFIG_SMP
tools/virtio/linux/kernel.h:#define CONFIG_SMP


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
