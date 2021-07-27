Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_RED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BF9C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:21:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F3E60C51
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 00:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5F3E60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C54C82C21;
	Tue, 27 Jul 2021 00:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWj-8Fj_vU8G; Tue, 27 Jul 2021 00:21:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 12ED882C1E;
	Tue, 27 Jul 2021 00:21:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF532C0010;
	Tue, 27 Jul 2021 00:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F679C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38D1C82C21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpaVaZz9w-eu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:21:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43E4E82C1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0juv00Hz8G+KAjpAVMimNkL/v0zGOKjs/1MxFUmBO6A=; b=TPKrClUnGhwbJO9k0I5Bp5Oe3B
 A4hLfp6jVDNt33X50u+0LdfS9JYZxmO+yP78rGCLWlSIUK5M8yXoGO/k22AGjugBysrWH1WHFT2Ef
 yhLGOm4zW4LBXCZ95k2vd1JuWofvGJZxDL5lTEcZ1F5pYFr5jrMUNcU55Z9MJwSowXf05V9vZSSbE
 DZmVFdKZ7bevsCYvhzA48Pz111qed9lHgRcklYs+j5UgJd+OlCJPryyv7MLT2Pgfmvbiyx6aSCvMl
 2tQ79phEZ6vgN4W4+stUP1r4gGV3tD5aNQu4iK+wTIa0uBpviifkCSSt2sHH+tNphqn1x30hldMA7
 1HNJw6Ww==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8AqF-00ChGS-Rm; Tue, 27 Jul 2021 00:21:03 +0000
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Randy Dunlap <rdunlap@infradead.org>
Subject: patch suggestion: Kconfig symbols
Message-ID: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
Date: Mon, 26 Jul 2021 17:21:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
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

Hi,

Running scripts/checkkconfigsymbols.py reports several hundred (maybe thousand)
Kconfig symbols that are used questionably. Lots of these are false positives
but lots of the remainder could use some cleaning up.

One example:

DSCC4
Referencing files: arch/mips/configs/gpr_defconfig, arch/mips/configs/mtx1_defconfig, drivers/net/wan/Kconfig
Similar symbols: SCC, DMASCC, CRC4, CRC64

There is no longer a Kconfig entry for DSCC4 (it has been deleted, but some
references to it were not deleted) -- and this is not a typo
of one of the "Similar symbols" listed here.

So all of these references to DSCC4 can be (should be) deleted.
And of course, Cc: the GENERIC HDLC (WAN) DRIVERS maintainer on such a patch.


False positive example:

XCHOFFLD_MEM
Referencing files: drivers/scsi/qla2xxx/qla_mbx.c
Similar symbols: OF_PMEM, CXL_MEM, CXL_PMEM

The Referencing source file does this:
#define CONFIG_XCHOFFLD_MEM	0x3

which is legitimate, so no change is needed.


Comment example:

IA32_SUPPORT
Referencing files: arch/x86/include/asm/ia32.h
Similar symbols: MEDIA_SUPPORT, EDAC_SUPPORT, IOMMU_SUPPORT, USB_SUPPORT, I2C_PARPORT, NIOS2_FPU_SUPPORT, NIOS2_CDX_SUPPORT, NIOS2_BMX_SUPPORT, MEDIA_USB_SUPPORT, MEDIA_SDR_SUPPORT

The Referencing file has:
#endif /* !CONFIG_IA32_SUPPORT */

and this #ifdef block was begun with
#ifdef CONFIG_IA32_EMULATION

so the comment on the #endif line is incorrect.
This could be fixed but it's not a big deal just to leave it as is.

So there is lots here that could be done, but there are also lots of
false positives here that don't need to be touched.

-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
