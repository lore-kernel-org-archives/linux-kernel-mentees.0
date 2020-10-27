Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC917C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:09:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28017207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NumASSN5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28017207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A11A320535;
	Tue, 27 Oct 2020 16:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdEqY-7CrdJh; Tue, 27 Oct 2020 16:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A5772010C;
	Tue, 27 Oct 2020 16:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19BEBC088B;
	Tue, 27 Oct 2020 16:09:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75941C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F50E85EC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHwZGYJjyCzH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:09:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BFFDA85E28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:09:01 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id i3so148192pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8z713XlayESH339Gp0VA0pxVEZrHHHC1564eAGVGao=;
 b=NumASSN5jUGYa6e5z22XehydqEuDytI4MnptHFy12+L7djPz4ENXxNeSTt8AUpwpbB
 e0o2xgt4N2sAtEC3XKrqQ1QMWH6Xeh0zbkKofMJkByOwtn6kFUEgdeYAdPEUy5mbmxeL
 iQApgLUgSL3DsxMER2bJ2GVtl1wxyhPppNCCw2B95tepbbefUytZHVC/RdMMBWb6m0/S
 +GOF9lGzFzvAZ6Tte7HivoAELh4vRVCjhZRLHX6nlPwmlM2gHLv+UhR8c5ONoeBOXoe+
 CKnDnmURtNcns/625CYiXS+Tp11k71VLmQizLT4J3uZ692I3y3dXiTHzWntBzkxt3kEq
 ji2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8z713XlayESH339Gp0VA0pxVEZrHHHC1564eAGVGao=;
 b=IWgrpQweQCtSWO1Ixb0xbGCrm3p+6gMMn3ZPSs3wBpLpGB+2Ijofun7b1KB8Fdq2Li
 ZcGyVH07VWfcqVONpHFJ7KyBwv+EePBNbQseKu+OAQ3YQq/ZTG6g6oX6z65aUOaVVaG5
 vU6XTe2bhSfZaz7+WKXDPeRqJDKIgSKjubzr0P87QG9QRMGODQncc/OncapiYN8+b7r5
 OwNGThmPdZuL+oqe41rj1EoSufUqwl87CuxeuKGGV5leLGOeObUiSN3my3T40Y/grvpN
 wpulnqdCeOXDo5I5m95H7k4Uh7OCnDZq0cjaTAP4UiroZ4jaj8de3HR9e/Nc7o9ryfJz
 /w8Q==
X-Gm-Message-State: AOAM530VHekShRK6k7cd7/l1FQfmpzoKPuQrATYHozu/IuwvBZCIMl1u
 Uk6YZ4uZMtcK8WpId9u2lmmV8zF/eg/xuSv3gFA=
X-Google-Smtp-Source: ABdhPJwnRuw6kfpLU6usrKj8k9y5UpG9W4uTmoM226PnUmWKyb6+ZHmI86szqWRZzz77ikQ9UMC5mgmvMFEAAnXWNfk=
X-Received: by 2002:a17:902:7442:b029:d6:4773:7cdc with SMTP id
 e2-20020a1709027442b02900d647737cdcmr3310063plt.21.1603814941169; Tue, 27 Oct
 2020 09:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
In-Reply-To: <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Oct 2020 18:09:49 +0200
Message-ID: <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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

On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 10/26/20 11:54 PM, Coiby Xu wrote:
> >>> Hi Hans and Linus,
> >>>
> >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
> >>> Interrupt Connection Resource Descriptor as disabling debouncing
> >>> filter?
> >>>
> >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> >>>
> >>> I'm not sure if Windows' implementation is the de facto standard like
> >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
> >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> >>> can fix this touchpad issue and potentially some related issues by
> >>> implementing the feature of supporting configuring debounce timeout in
> >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> >>> What do you think?
> >>>
> >>> A favorable evidence is I've collected five DSDT tables when
> >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> >>> an non-zero debounce timeout value for the edge type irq and for all
> >>> the level type irq, the debounce timeout is set to 0x0000.
> >>
> >> That is a very interesting observation and this matches with my
> >> instincts which say that we should just disable the debounce filter
> >> for level triggered interrupts in pinctrl-amd.c
> >>
> >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
> >> table, but I'm not sure that 0 always means disabled.
> >>
> >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
> >> and the docs on "PinConfig()"  say:
> >>
> >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
> >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
> >> property is specified by multiple descriptors for the same pins, the order in which these properties
> >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
> >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
> >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
> >> timeout, 0 should be used for GpioIo/GpioInt.*
> >>
> >> So that suggests that a value of 0 does not necessarily mean "disabled" but
> >> it means use a default, or possibly get the value from somewhere else such
> >> as from a ACPI PinConfig description (if present).
> >
> > Nope, it was added to get rid of disambiguation when both Gpio*() and
> > PinConfig() are given.
> > So, 0 means default *if and only if* PinConfig() is present.
> >
> > I.o.w. the OS layers should do this:
> >
> >  - if Gpio*() provides Debounce != 0, we use it, otherwise
> >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
> >  - debounce is disabled.
> >
> > Now we missed a midentry implementation in the Linux kernel, hence go
> > to last, i.e. disable debounce.
> > But it should be rather done in gpiolib-acpi.c.
> >
> > Hope this helps.
> >
> > I Cc'ed this to Mika as co-author of that part of specification, he
> > may correct me if I'm wrong.
>
> I see, so then the right thing to do for the bug which we are seeing
> on some AMD platforms would be to honor the debounce setting I guess ?
>
> Can you and/or Mika write a patch(set) for this ?

I will look at it, but meanwhile I would postpone until having a
Mika's Ack on the action that my understanding and course of actions
is correct.

> > P.S. Does RedHat have a representative in ASWG?
>
> I think so yes, but mainly focussed on server related things I guess...


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
