Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3F3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 15:08:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD03205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 15:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD03205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 032878902F;
	Mon, 13 Jul 2020 15:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMItPMj5LsTE; Mon, 13 Jul 2020 15:08:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FF408901F;
	Mon, 13 Jul 2020 15:08:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D7D9C088E;
	Mon, 13 Jul 2020 15:08:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574A1C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 15:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 44FDD86119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 15:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0Zd2FNSdBtB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 15:08:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B04E385AE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 15:08:30 +0000 (UTC)
Received: from mail-lf1-f47.google.com ([209.85.167.47]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mxlmw-1knUlZ3lHS-00zE0V for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Jul 2020 17:08:27
 +0200
Received: by mail-lf1-f47.google.com with SMTP id y13so9270413lfe.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 08:08:27 -0700 (PDT)
X-Gm-Message-State: AOAM532zN65C83Pi24nLxDHsjez5tNJ+p5EkDURWTKjvbQfvoOCgn+Xd
 Mue1y0DoXz6reaT2qitM3L+XMAb+PfkllecYzlc=
X-Google-Smtp-Source: ABdhPJwTQltR//Qoy7CJjbYFWf5SE8su8bBzApvuOmTDy/uiiaL5a6kEWZGPL3gOs+ATNW8dGkRO2Pf0imsPrOKn0vM=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr53585665lfk.173.1594652906936; 
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200713122247.10985-1-refactormyself@gmail.com>
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jul 2020 17:08:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
X-Provags-ID: V03:K1:oxZ0hZTulh/X9XVkTg27v4lvBuGMP8mHen3tzmi4XXP+Y2UYED9
 +cWR0GjUlVvlYbjxGN9BVKrwKwFB2PjSgiinxIoMPllRSJCIR0+tHRajRJpXJIC8+/w1HlZ
 p9tMkq0tl+JbPF6CZ0gNbjFHRtJfCTlq4+KwgyxDz2Q5yg0ys7+s+qvL2Jrib/cnPtKPgdb
 DWE2qBbRWSZ+QxuHMlpzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:neFTGN6s59g=:WGW0HfhJTqUpqW04NjSf7b
 cSbfO/tswXJot+bgZ7zfv1eH4Pyja7CVreOh+62gCy/U2eA4Qn28w0ZD0W8rEVEE7J1lZurh1
 ZXsjgLfLCzBzWU5HRsvmn+wnzh5nXegCTM9o4earGQJIJ4yeZTsDmQJElehIMmrFu+A3S/2wf
 ww3CSKRX89pwJ70Jh81yShAmMQn2FX2u49R2xlVt0ZHvXzAIA2fhez0Xanz5PpC/gWDHgaHG2
 AKrq7vFfzlRLeJVY+qkiqYw2fNEo7/5GrjHJMIOIXspwV5SbdbZluIy9ONxrouh4xkA1NpK16
 dn2tRTjKiK0y9FbZotKb4Iq4w1QZyWTZ47djCTz5rYm93YN9rxT5QtsdHnSPTinhaRVXaeNd5
 UiU7To5UdUiBHSW85HpMbEqBMnSx0k7fJfnaTmbwJjfoyXE82GPVhFhiR+McRGdpjBeX5XTEZ
 2+uqrpmCo5x0CS1ubSsf+zOi81gAwFxHpdAU0fJW++yQAhU4T661nWaldpDsuGTpSFD2pcibV
 1ownJDrWC8GNgcO0DXdX5V6E+Yy3jb56rjkpZ59AJpHU7HZpVrcJaJDOJ+55VG6LuJdRD+nwV
 UYdVzNrr+hYBhPkUzFQt6JDTFxivjcyPHk6vpEAJkRU+3OheBihkphLdnTC+4SGwPCQSklGPu
 hXbZzciyFag1HxmoTbn+3+GNNqCuqYaV7HIsdJRbYHj23SPk/QSesPdwLCeKywlNCQOdHMA7r
 Zm06w1buiFr9sd7X3k739bwsDoBjVA5FfV5E42IOegE4vHySNmkHKCJdnLB4aTJH1hp/dKZbE
 xAwrELVfBkdsDIlSO3BaMBfy+xKjATiNE9iaD3dOMU+X1LZrDVqEh3HpLvaYX4pOtR5CoQj
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Paul Mackerras <paulus@samba.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-scsi <linux-scsi@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-atm-general@lists.sourceforge.net, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Networking <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, alpha <linux-alpha@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
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

On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.
>
> PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
> codes of PCIBIOS* are positive values and this introduces some complexities
> which other archs need not incur.

I think the intention is good, but I find the series in its current
form very hard
to review, in particular the way you touch some functions three times with
trivial changes. Instead of

1) replace PCIBIOS_SUCCESSFUL with 0
2) drop pointless 0-comparison
3) reformat whitespace

I would suggest to combine the first two steps into one patch per
subsystem and drop the third step.

> PLAN:
>
> 1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0
>
> 2a.  Audit all functions returning PCIBIOS_* error values directly or
>      indirectly and prevent possible bug coming in (2b)
>
> 2b.  Make all functions returning PCIBIOS_* error values call
>      pcibios_err_to_errno(). *This will change their behaviour, for good.*
>
> 3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
>      This handles the positive error codes directly and will not use any
>      PCIBIOS* definitions. So calls to it have no outside dependence.
>
> 4.   Make all x86 codes that needs to convert to -E* values call the
>      cloned version - pcibios_err_to_errno_v2()
>
> 5.   Assign PCIBIOS_* errors values directly to generic -E* errors
>
> 6.   Refactor pcibios_err_to_errno() and mark it deprecated
>
> 7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
>      or 0.
>
> 8.   Remove all PCIBIOS* definitions in include/linux/pci.h and
>      pcibios_err_to_errno() too.
>
> 9.   Redefine all PCIBIOS* definitions with original values inside
>      arch/x86/pci/pcbios.c
>
> 10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c
>
> 11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()
>
> 12.  Remove pcibios_err_to_errno_v2()
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

I would hope that there is a simpler procedure to get to good
code than 12 steps that rename the same things multiple times.

Maybe the work can be split up differently, with a similar end result
but fewer and easier reviewed patches. The way I'd look at the
problem, there are three main areas that can be dealt with one at
a time:

a) callers of the high-level config space accessors
   pci_{write,read}_config_{byte,word,dword}, mostly in device
   drivers.
b) low-level implementation of the config space accessors
    through struct pci_ops
c) all other occurrences of these constants

Starting with a), my first question is whether any high-level drivers
even need to care about errors from these functions. I see 4913
callers that ignore the return code, and 576 that actually
check it, and almost none care about the specific error (as you
found as well). Unless we conclude that most PCI drivers are
wrong, could we just change the return type to 'void' and assume
they never fail for valid arguments on a valid pci_device* ?

For b), it might be nice to also change other aspects of the interface,
e.g. passing a pci_host_bridge pointer plus bus number instead of
a pci_bus pointer, or having the callback in the pci_host_bridge
structure.

> Bolarinwa Olayemi Saheed (35):
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0

Some patches have identical subject lines including the subsystem
prefix, which you should avoid. Try to also fix the git request-pull
output to not drop that prefix here so the list makes more sense.

        Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
