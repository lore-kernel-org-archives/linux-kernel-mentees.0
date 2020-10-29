Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7285C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 08:04:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDA220791
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 08:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CDA220791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D31186948;
	Thu, 29 Oct 2020 08:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqYozcfnhQtP; Thu, 29 Oct 2020 08:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 779758491C;
	Thu, 29 Oct 2020 08:04:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54E08C088B;
	Thu, 29 Oct 2020 08:04:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ACD9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A797220B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87IQwE2RO-rw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by silver.osuosl.org (Postfix) with ESMTPS id E2B502152E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:04:33 +0000 (UTC)
IronPort-SDR: M6gGfs7yZUlqCk82lhYO9P5IFxuwacJhGxGK1VVPGJi2ZEHedIUjl0d56gjvbQ3t81RNs2vdVu
 t7pdx9UnvAyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="148251964"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="148251964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 01:04:32 -0700
IronPort-SDR: lwT/dKncOx5kf3TRp5J0H5XXaCISUOoeOR8tDgFy3UVAUT8vt6avsh5BsnIP+TMN0RQt3VgENg
 L4H5dy1e2I9A==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="536572832"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 01:04:26 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 29 Oct 2020 10:04:24 +0200
Date: Thu, 29 Oct 2020 10:04:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20201029080424.GM2495@lahna.fi.intel.com>
References: <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 wang jun <availa@outlook.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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

On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> > > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > >> On 10/26/20 11:54 PM, Coiby Xu wrote:
> > >>> Hi Hans and Linus,
> > >>>
> > >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
> > >>> Interrupt Connection Resource Descriptor as disabling debouncing
> > >>> filter?
> > >>>
> > >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> > >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> > >>>
> > >>> I'm not sure if Windows' implementation is the de facto standard like
> > >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
> > >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> > >>> can fix this touchpad issue and potentially some related issues by
> > >>> implementing the feature of supporting configuring debounce timeout in
> > >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> > >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> > >>> What do you think?
> > >>>
> > >>> A favorable evidence is I've collected five DSDT tables when
> > >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> > >>> an non-zero debounce timeout value for the edge type irq and for all
> > >>> the level type irq, the debounce timeout is set to 0x0000.
> > >>
> > >> That is a very interesting observation and this matches with my
> > >> instincts which say that we should just disable the debounce filter
> > >> for level triggered interrupts in pinctrl-amd.c
> > >>
> > >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
> > >> table, but I'm not sure that 0 always means disabled.
> > >>
> > >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
> > >> and the docs on "PinConfig()"  say:
> > >>
> > >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
> > >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
> > >> property is specified by multiple descriptors for the same pins, the order in which these properties
> > >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
> > >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
> > >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
> > >> timeout, 0 should be used for GpioIo/GpioInt.*
> > >>
> > >> So that suggests that a value of 0 does not necessarily mean "disabled" but
> > >> it means use a default, or possibly get the value from somewhere else such
> > >> as from a ACPI PinConfig description (if present).
> > >
> > > Nope, it was added to get rid of disambiguation when both Gpio*() and
> > > PinConfig() are given.
> > > So, 0 means default *if and only if* PinConfig() is present.
> > >
> > > I.o.w. the OS layers should do this:
> > >
> > >  - if Gpio*() provides Debounce != 0, we use it, otherwise
> > >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
> > >  - debounce is disabled.
> > >
> > > Now we missed a midentry implementation in the Linux kernel, hence go
> > > to last, i.e. disable debounce.
> > > But it should be rather done in gpiolib-acpi.c.
> > >
> > > Hope this helps.
> > >
> > > I Cc'ed this to Mika as co-author of that part of specification, he
> > > may correct me if I'm wrong.
> >
> > I see, so then the right thing to do for the bug which we are seeing
> > on some AMD platforms would be to honor the debounce setting I guess ?
> >
> > Can you and/or Mika write a patch(set) for this ?
> 
> I will look at it, but meanwhile I would postpone until having a
> Mika's Ack on the action that my understanding and course of actions
> is correct.

From what I recall this sounds correct :)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
