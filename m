Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6B7C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 06:47:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD7320663
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 06:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD7320663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1897B20489;
	Wed, 15 Jul 2020 06:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA5CUxy52qIi; Wed, 15 Jul 2020 06:47:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F0A9A20385;
	Wed, 15 Jul 2020 06:47:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAB84C0891;
	Wed, 15 Jul 2020 06:47:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27924C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 06:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AB8B320385
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 06:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBq1lBwvq62c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 06:47:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by silver.osuosl.org (Postfix) with ESMTPS id 6D33D20116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 06:47:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MLi4c-1kDGbw0zke-00Hi7L for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 Jul 2020 08:47:36
 +0200
Received: by mail-qk1-f170.google.com with SMTP id r22so816334qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 23:47:35 -0700 (PDT)
X-Gm-Message-State: AOAM530suTnUOSqNhbOKMqt9wA4+JQOXW3p7QQyIWTxXPdEL8pVsA1gt
 j3ytJaDjJneFJ5gM48fE2b02lR927Oxs0sTEkuE=
X-Google-Smtp-Source: ABdhPJyFS0Zk4AmYJjgRoHnkDRGYzV2yqrKuev4xpaWExBMOSp+Vk7tlNoV31gVNZsw16288M3SPusHOFA0ODDFCn0I=
X-Received: by 2002:a37:a496:: with SMTP id n144mr8314087qke.286.1594795654855; 
 Tue, 14 Jul 2020 23:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <20200714234625.GA428442@bjorn-Precision-5520>
In-Reply-To: <20200714234625.GA428442@bjorn-Precision-5520>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jul 2020 08:47:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
Message-ID: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Provags-ID: V03:K1:ZLprmHjAtc3lOQ3yHQxKaVdSKpU1KtsqHcwVHA+ycGYR/Qn88tg
 UwmwY74te3AWxtzFtg5UpuusJJMPM5RDfL+qYe7UzBLr45ZWKPkCCEZNpinK5yxlHoFLcAU
 JlnmlYfV4C54paWxG51WAU3gkAM22qFWgUSOeWSLRCjMPskck4BRIbNujVhD7XosduI8z+C
 sGg93jqMi57M2DjzYbIVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p3WszVwTCm8=:eTmhEebr0nnEh1YYzq6Dv2
 n4L06ZeXX+D3QzhXvmL9+FAsrMIp+9H/M48ssGn6W6LOLdx0vKhoWLByq1FIvw8gifSm3BdZC
 g+6p55jiF2mFWsWE9Mo7YhPARn6MhtDQONNu2RxFp4tR0H2oFl8fiK39mpePgxVZQd7u2Py8p
 yUWk6mWi5kIMh527q9b53RRukdoAgv4Zz+reZhaJQjWoVd8re2e8s+hz00P+mUgk0s8Ih86jt
 ODLwJXs3Ks1PKDD7KagPYBENcR6diXv7KXfUa6cj/KmwZxx/RtTfrk0v4g59djJK2vaCa4pEH
 1kb+SQyFs91fRVUpfG+I3oGhI7gKRAkbk5x0P+miYuYzyyMF7E3B5KZC6K0XOKZK4CNVztmHZ
 k8TYHym4vzGpL/s/ZbkqrQizXwYcQd1pTBDnpmbjaFhZrAjppx130Ya0vVvUy9H/tN0FFmmVM
 /Gu82C+eqNoB4a+swd0icECSZUwvNgOgYsawaBib+L4eDAvSlHLdOUAHRoG/WsTGgoKOERpAY
 Ih5cxTVq1GFvB5Xi94WlqRjnNNWmWJREyjCG9y+7F7bNrXY/sh0a6lRLMtEOUEhZEHRI2cNAK
 S3hdweMyITE10k/lrbjJIVxI6YJGyVpkQ7YMwjKJhvyNh/xjE/piDv1G3np+aoeVdTQsc80XO
 O/b7KS/ogpZns6M14eZOU5nbskbaEfWV8pHv/nYu00jlTDeYs5uw4s4eJ4mmN7yduCngdahrK
 UYcvUmwMv83feeYlF57Jbkk7RTkQripAmaHhgCek8rahJ84AXkdsUF4Ncze0foXYCDOuQ5P9e
 9oRNV0I1XU9BS2yvMHZweddOjxvjUd3LHQVagVK8IcT3BmfylSWCs3n4fi1hT9NH93VVTQyzg
 FJk9PNZxQXrPseDECLQQEOGVlTzAlZRTNK16DtNzuj3UWkmvTvv6G5jmkSx3rqWxfcQWXKheS
 43JOS0nwY/A+lkew+/NYvaFv/zV4xoEnjEjPZVYfK+muTlnvpVBQz
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci <linux-pci@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 00/35] Move all PCIBIOS*
	definitions into arch/x86
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

On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:

 So something like:
>
>   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
>
> and where we used to return anything non-zero, we just set *val = ~0
> instead?  I think we do that already in most, maybe all, cases.

Right, this is what I had in mind. If we start by removing the handling
of the return code in all files that clearly don't need it, looking at
whatever remains will give a much better idea of what a good interface
should be.

>  git grep -E "(if|return|=).*\<pci_(read|write)_config" drivers
> finds about 400 matches.

Right, and this is some 112 files to look at.

I had a slightly different regex, which found more false-positives, but
also these:

arch/x86/kernel/amd_nb.c:      : pci_read_config_dword(root, 0x64, value));
drivers/i2c/busses/i2c-sis630.c:     pci_write_config_byte(sis630_dev,
SIS630_BIOS_CTL_REG, b | 0x80)) {
drivers/i2c/busses/i2c-viapro.c:     !pci_read_config_word(pdev,
SMBBA2, &vt596_smba) &&
drivers/ide/rz1000.c:     !pci_write_config_word(dev, 0x40, reg & 0xdfff)) {
drivers/net/ethernet/realtek/r8169_main.c:
pci_write_config_byte(pdev, 0x070f, val) == PCIBIOS_SUCCESSFUL)
include/linux/rtsx_pci.h:#define rtsx_pci_read_config_dword(pcr,
where, val) pci_read_config_dword((pcr)->pci, where, val)
include/linux/rtsx_pci.h:#define rtsx_pci_write_config_dword(pcr,
where, val) pci_write_config_dword((pcr)->pci, where, val)
drivers/misc/cardreader/rts5261.c:              retval =
rtsx_pci_read_config_dword(pcr,
drivers/misc/cardreader/rts5261.c:      retval =
rtsx_pci_write_config_dword(pcr, PCR_SETTING_REG2, lval);

That last one is interesting because I think this is a case in which we
actually want to check for errors, as the driver seems to use it
to ensure that accessing extended config space at offset 0x814
works before relying on the value. Unfortunately the implementation
seems buggy as it a) keeps using the possibly uninitialized value after
printing a warning and b) returns the PCIBIOS_* value in place of a
negative errno and then ignores it in the caller.

      Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
