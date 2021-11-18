Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFE9C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 13:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 944DD61350
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 13:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 944DD61350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 522C94015E;
	Thu, 18 Nov 2021 13:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSiHkHZO2-eE; Thu, 18 Nov 2021 13:30:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DD77D400E1;
	Thu, 18 Nov 2021 13:30:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C372DC001E;
	Thu, 18 Nov 2021 13:30:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6935BC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 13:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50DAB6072F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 13:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 571xiuYtCYiH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 13:30:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5305E60723
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 13:30:57 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u11so5250428plf.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rri8CgMU3iUgw+czpevbWjMbr1UWm75xhAwXD02I6xU=;
 b=FDEnvL+UtpoLRk6Q1zJ5TWKgN3pkejoc+c1lfiUwMmvGmldi6KxwZO1grB8bUwgggl
 NxymJ9lCNeYeShRKPCEoAFb/qyeXIlHXW6H9LhjrDZVVUGNirPbyJuI24LirczSzl/Na
 OK380QfTTMyJLsiytjnQRYSmo9aAci9N0vFC8VP0JB29tQt8eoW/ggKIxCPmK5+dxsXW
 XwurEenZVOh5wEwUMaPPAASeHd9USOigFhhHFenuvMmC1EPdDlgUL2LZwm9an0CE8meS
 Rv6YcVKeQnHd4N1kacEKQoyflUzVHPAi/1nTgQ8d8eBhHJHyNrVBYPckBm/kGT11HH/L
 8L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rri8CgMU3iUgw+czpevbWjMbr1UWm75xhAwXD02I6xU=;
 b=5Azd81i5oeCCOwCOQclmPQ3hjFLFkP5EUhmtteqfTFl5v2V0HmnzblRFohuABWrcAm
 MM+ysix3Pgv1TrxV2jOo7eL+S0g3wrP5RPQ4k186gl2gVUf59R0RQWI/Xbe3sem746U5
 2rv3wuerJNT0qcfLL3VwOv4eNlj3W6FB+fsTVlR6svFSCijth983yBoiH1cfKvoj8Al/
 i5Fh89F9RDLMKcKxXGE+/DJGAe/+wDOM7IZxo2dV5UWS38bPXoYFaxgpbMdL1h9mgTE4
 H38/g9lDQXjUSCeekqxMfjPfun8a+p2Rmhzu2sWZC0ndPbdmnrXPEt4PfEFKiIq0jXSF
 7/IQ==
X-Gm-Message-State: AOAM531r1/D95wUxrY27CgNe2k13UDi1iqO4q/Vdan2kwKPSNkmAJ01+
 5v+oHZHpMCScipQAtTr5X78=
X-Google-Smtp-Source: ABdhPJw603nbU+O/fPHP8RoT4nn8P5boytORpwShOu3KLVJrVk3lFo3z0RQCNEqj18u5XFcu5Q1lpg==
X-Received: by 2002:a17:90a:df14:: with SMTP id
 gp20mr10690696pjb.186.1637242256451; 
 Thu, 18 Nov 2021 05:30:56 -0800 (PST)
Received: from theprophet ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id z19sm3624615pfe.181.2021.11.18.05.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 05:30:56 -0800 (PST)
Date: Thu, 18 Nov 2021 19:00:20 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <20211118133020.nkr3xzbzonxtrqbw@theprophet>
References: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
 <20211117235812.GA1786428@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117235812.GA1786428@bhelgaas>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>, Toan Le <toan@os.amperecomputing.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robert Richter <rric@kernel.org>,
 Sean V Kelley <sean.v.kelley@intel.com>, Ray Jui <rjui@broadcom.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Joyce Ooi <joyce.ooi@intel.com>,
 Shawn Guo <shawn.guo@linaro.org>, linuxppc-dev@lists.ozlabs.org
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

On 17/11, Bjorn Helgaas wrote:
> On Thu, Oct 21, 2021 at 08:37:26PM +0530, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > Add a PCI_ERROR_RESPONSE definition for that and use it where
> > appropriate to make these checks consistent and easier to find.
> > 
> > Also add helper definitions SET_PCI_ERROR_RESPONSE and
> > RESPONSE_IS_PCI_ERROR to make the code more readable.
> > 
> > Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  include/linux/pci.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index cd8aa6fce204..689c8277c584 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -154,6 +154,15 @@ enum pci_interrupt_pin {
> >  /* The number of legacy PCI INTx interrupts */
> >  #define PCI_NUM_INTX	4
> >  
> > +/*
> > + * Reading from a device that doesn't respond typically returns ~0.  A
> > + * successful read from a device may also return ~0, so you need additional
> > + * information to reliably identify errors.
> > + */
> > +#define PCI_ERROR_RESPONSE     (~0ULL)
> > +#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
> > +#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))
> 
> Beautiful!  I really like this.
>

Thank you very much for the review ^^

> I would prefer the macros to start with "PCI_", e.g.,
> PCI_SET_ERROR_RESPONSE().
> 

ACK

> I think "RESPONSE_IS_PCI_ERROR()" is too strong because (as the
> comment says), ~0 *may* indicate an error.  Or it may be a successful
> read of a register that happens to contain ~0.
> 
> Possibilities to convey the idea that this isn't definitive:
> 
>   PCI_POSSIBLE_ERROR_RESPONSE(val)  # a little long
>   PCI_LIKELY_ERROR(val)             # we really have no idea whether
>   PCI_PROBABLE_ERROR(val)           #   likely or probable
>   PCI_POSSIBLE_ERROR(val)           # promising?
>

ACK. Will use PCI_POSSIBLE_ERROR()

> Can you rebase to my "main" branch (v5.16-rc1), tweak the above, and
> collect up the acks/reviews?
> 

ACK

> We should also browse drivers outside drivers/pci for places we could
> use these.  Not necessarily as part of this series, although if
> authors there object, it would be good to learn that earlier than
> later.
> 
> Drivers that implement pci_error_handlers might be a fruitful place to
> start.  But you've done a great job finding users of ~0 and 0xffff...
> in drivers/pci/, too.
> 

A quick grep showed that there are around 80 drivers which have
pci_error_handlers. I was thinking that it would be better if we handle
these drivers in another patch series since the current patch series is
itself 25 patches long. And in my short tenure reading LKML, I gathered
that folks generally are not so kind to a long list of patches in a
single patch series ^^' (I might be wrong though, Apologies)

The consensus on the patch series does seem slightly positive so
ideally, I was hoping that we would not have the case where a author
does not like the way we are handling this patch. Then again, I'm
pretty sure that I might be wrong ^^'

I hope it would be okay that I send in a new patch series with the
suggested changes and handle the other changes in another patch series
^^

Thanks,
Naveen
> > +
> >  /*
> >   * pci_power_t values must match the bits in the Capabilities PME_Support
> >   * and Control/Status PowerState fields in the Power Management capability.
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
