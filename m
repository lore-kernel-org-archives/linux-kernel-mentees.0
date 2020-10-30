Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA87CC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 04:54:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E345B221F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 04:54:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzRcM5tD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E345B221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 26F568740B;
	Fri, 30 Oct 2020 04:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6XgoCePz7xq; Fri, 30 Oct 2020 04:54:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06BE5873A3;
	Fri, 30 Oct 2020 04:54:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC4BEC0859;
	Fri, 30 Oct 2020 04:54:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1681CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E9DE8228D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiTKxctO7R2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:54:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B1CE82037B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:54:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o3so4172950pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 21:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AYm6LBgb7gkjxk146JV0bBOgWeS48lTJuMc/ZNaPwxA=;
 b=lzRcM5tDOhiYgjnssxP4imcYKpiRtYMTGv0mrynZWFQzuaGyPo7utcsf7rb6m6gfcq
 3uDNfDpvxFy9OJMYOeK5j/OM5kCU5pP/KwxXxuO57IIOBzORb47HRTUuYDJxy1SLxuvp
 Ege5KOLV2+z8Lt/7Suw91NZkXShAVQRh2Oj+lwi1G+zPXbIdKpckk9UFt3dp0b9Jn94I
 bFbRP0JjzeW4JROoVRycLASBPxjnFgTq5hMe5aSffJKf9ULgc5kT4aBt3DhrYiKSeKMy
 p/v+49NrpC8rrW11YedNwYc5nYtP+BF4MVdmTMS9kulYYAxk0WvDklsnDG4Y8ZqeZB39
 FZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AYm6LBgb7gkjxk146JV0bBOgWeS48lTJuMc/ZNaPwxA=;
 b=eBW7+P2yeamZM119vX3C4EmxZjuMTLp786kJ9pettVd88XVhmI/PusloaXfO515H0m
 q18ScaP3k0H+7v2qLOjNoBjOoM16h2nRlSsuJxyNSrcUX07HnaPfaLWZRoqHwNjVjKE+
 7/1jiGlx1WrkIiyhiyD8ZtAUqDaUMrgxlsigoTX/fW37Q1EpL6hZrtCJWj6BMJyLbEnN
 ns6hpISz1AN+AJXu3+DZy6lGxd+6ZnLCAjE8SkFguIyIXyd2Kq2+zi9GVcJWa/1JJhoi
 g3k1SSnXtujNmdo4Hnsf6fveQahy7LJsp6zIL00GpAxVTDcfW7OrFAFmHo66ZrU4bqzF
 Jsrw==
X-Gm-Message-State: AOAM531QYYpeHhICcPkYyzEPuGyjPdx8MEbWzulSdoUB0EqPtbCC8lBD
 To/OTrAD6MRMef6wQ8Klq7g=
X-Google-Smtp-Source: ABdhPJxPjf3j4NOTZTKN7+m2Ge5Q8PyhAP4ehXG3+bqo+/mKFXK3tgSNTAu2St975lUDEbsL4a403w==
X-Received: by 2002:a05:6a00:225c:b029:163:916f:bbf0 with SMTP id
 i28-20020a056a00225cb0290163916fbbf0mr7482694pfu.46.1604033687218; 
 Thu, 29 Oct 2020 21:54:47 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id d10sm4193004pgk.74.2020.10.29.21.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 21:54:46 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 30 Oct 2020 12:54:21 +0800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20201030045421.si3r5zsbeeyhkwns@Rk>
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
>On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
>> > On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> >> On 10/26/20 11:54 PM, Coiby Xu wrote:
>> >>> Hi Hans and Linus,
>> >>>
>> >>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>> >>> Interrupt Connection Resource Descriptor as disabling debouncing
>> >>> filter?
>> >>>
>> >>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>> >>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>> >>>
>> >>> I'm not sure if Windows' implementation is the de facto standard like
>> >>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>> >>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>> >>> can fix this touchpad issue and potentially some related issues by
>> >>> implementing the feature of supporting configuring debounce timeout in
>> >>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>> >>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>> >>> What do you think?
>> >>>
>> >>> A favorable evidence is I've collected five DSDT tables when
>> >>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>> >>> an non-zero debounce timeout value for the edge type irq and for all
>> >>> the level type irq, the debounce timeout is set to 0x0000.
>> >>
>> >> That is a very interesting observation and this matches with my
>> >> instincts which say that we should just disable the debounce filter
>> >> for level triggered interrupts in pinctrl-amd.c
>> >>
>> >> Yes that is a bit of a shortcut vs reading the valie from the ACPI
>> >> table, but I'm not sure that 0 always means disabled.
>> >>
>> >> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
>> >> and the docs on "PinConfig()"  say:
>> >>
>> >> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
>> >> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
>> >> property is specified by multiple descriptors for the same pins, the order in which these properties
>> >> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
>> >> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
>> >> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
>> >> timeout, 0 should be used for GpioIo/GpioInt.*
>> >>
>> >> So that suggests that a value of 0 does not necessarily mean "disabled" but
>> >> it means use a default, or possibly get the value from somewhere else such
>> >> as from a ACPI PinConfig description (if present).
>> >
>> > Nope, it was added to get rid of disambiguation when both Gpio*() and
>> > PinConfig() are given.
>> > So, 0 means default *if and only if* PinConfig() is present.
>> >
>> > I.o.w. the OS layers should do this:
>> >
>> >  - if Gpio*() provides Debounce != 0, we use it, otherwise
>> >  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
>> >  - debounce is disabled.
>> >
>> > Now we missed a midentry implementation in the Linux kernel, hence go
>> > to last, i.e. disable debounce.
>> > But it should be rather done in gpiolib-acpi.c.
>> >
>> > Hope this helps.
>> >
>> > I Cc'ed this to Mika as co-author of that part of specification, he
>> > may correct me if I'm wrong.
>>
>> I see, so then the right thing to do for the bug which we are seeing
>> on some AMD platforms would be to honor the debounce setting I guess ?
>>
>> Can you and/or Mika write a patch(set) for this ?
>
>I will look at it, but meanwhile I would postpone until having a
>Mika's Ack on the action that my understanding and course of actions
>is correct.
>
If you don't mind, let me write this patch(set) instead:) I feel itchy
to fix this touchpad issue by myself after spending about a month of
my internship at Linux Foundation investigating this touchpad issue.
There are many enthusiastic Linux users waiting to get their touchpads
fixed and I could prioritize this task since I don't have other
obligations. I have provided a fallback solution [1] to save their
touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
reach mainline kernel much earlier.

[1] https://lore.kernel.org/patchwork/patch/1323245/
>> > P.S. Does RedHat have a representative in ASWG?
>>
>> I think so yes, but mainly focussed on server related things I guess...
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
