Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85E7C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 10:09:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEAC21D24
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 10:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="biUrUQfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEAC21D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 724C585C56;
	Tue, 27 Oct 2020 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xe8X2LpH5rjH; Tue, 27 Oct 2020 10:09:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 821E185BBD;
	Tue, 27 Oct 2020 10:09:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 675D7C088B;
	Tue, 27 Oct 2020 10:09:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCCD1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C2A0F8349B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wt2nliVY5Puq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:09:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0476584BBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603793356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xMFEL5l8qWQjfzBJoFlYHiuXf7nJEtoo8X1gM79n9U=;
 b=biUrUQfO1c/Z/7naFj0qvXN2uDjN++V7Kv8bu+gdikMm9lXYb9APdW1zZ6GabuYMpG5drq
 mzTBP4Ir4ym7mMVIhEvZCFW5SeTLdirp4PNNhslVYSsa/ooyV4EcA6Fnf1PI9hgAS7gJpq
 Mzz7t3pkWo5y4lpPaLn5cMbctxH8ORI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-hoF6mF2FM-OzxblyCrNTDA-1; Tue, 27 Oct 2020 06:09:14 -0400
X-MC-Unique: hoF6mF2FM-OzxblyCrNTDA-1
Received: by mail-ej1-f71.google.com with SMTP id z25so726865ejd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 03:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xMFEL5l8qWQjfzBJoFlYHiuXf7nJEtoo8X1gM79n9U=;
 b=X3wkVNQ2vDzG59wlqDANIZXZndoWm99EAAqe+SWvBPo44Ed1I3opKwIqXJ7Yz9weOz
 i7oK/2aENS7HCwiRKf1J7zFtUKR+fjyGR58GV6EH8O/kdbtMAVjggSZCTVJiqGcsCVl2
 /VpBcJP+HqJsRkeMguJX18uGrK2gGlMPKfhIRKigVZ+L100MrY4RGJJSrivjQXmxpimm
 RFBbDvIXM0LUdsAgzFdrJ/RdARtuYgTSyajh504pL8nU82tahboVHkUB0XfjN+qAM0XU
 iwk8flIvgHYNq1NTK6IhIW3yBfFsqJoHmpTEQ0P8xIXXqjY1nxbfcrwZ7FerlywQQp0h
 kLsg==
X-Gm-Message-State: AOAM532k3fg27CxHBd3R34G94eVMwBWiDQzw68sBTCQlX9eP6DoD/OrY
 QrQFKTV6O1J8oYW/q6dUC8Dio7c+fHdSRT0Cb/I63aOe4xDubhjb9mPgQQlcUxuEcBcEmRmNA1U
 xl3y0ACn/6kzicQ1Rt3X5rG03vMxXYPNLTJ/hK7knae9GYjBa
X-Received: by 2002:aa7:ce18:: with SMTP id d24mr1432208edv.9.1603793352722;
 Tue, 27 Oct 2020 03:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS8z+oH2D/VE0FuS6Z10aO24uUGqVEAJBgkvHzLOfz2K+8Ui2Yli+nXDkH4oh162wHg3Eiag==
X-Received: by 2002:aa7:ce18:: with SMTP id d24mr1432176edv.9.1603793352431;
 Tue, 27 Oct 2020 03:09:12 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y1sm649975edj.76.2020.10.27.03.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:09:11 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
References: <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk> <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
Date: Tue, 27 Oct 2020 11:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026225400.37almqey2wxyazkn@Rk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi,

On 10/26/20 11:54 PM, Coiby Xu wrote:
> Hi Hans and Linus,
> 
> Will you interpret the 0x0000 value for debounce timeout in GPIO
> Interrupt Connection Resource Descriptor as disabling debouncing
> filter?
> 
> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
> 
> I'm not sure if Windows' implementation is the de facto standard like
> i2c-hid. But if we are going to conform to the ACPI specs and we would
> regard 0x0000 debounce timeout as disabling debouncing filter, then we
> can fix this touchpad issue and potentially some related issues by
> implementing the feature of supporting configuring debounce timeout in
> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
> What do you think?
> 
> A favorable evidence is I've collected five DSDT tables when
> investigating this issue. All 5 DSDT tables have an GpioInt specifying
> an non-zero debounce timeout value for the edge type irq and for all
> the level type irq, the debounce timeout is set to 0x0000.

That is a very interesting observation and this matches with my
instincts which say that we should just disable the debounce filter
for level triggered interrupts in pinctrl-amd.c

Yes that is a bit of a shortcut vs reading the valie from the ACPI
table, but I'm not sure that 0 always means disabled.

Specifically the ACPI 6.2 spec also has a notion of pinconf settings
and the docs on "PinConfig()"  say:

Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
property is specified by multiple descriptors for the same pins, the order in which these properties
are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
timeout, 0 should be used for GpioIo/GpioInt.*

So that suggests that a value of 0 does not necessarily mean "disabled" but
it means use a default, or possibly get the value from somewhere else such
as from a ACPI PinConfig description (if present).

So I see 2 ways to move forward with his:

1. Just disable the debounce filter for level type IRQs; or
2. Add a helper to sanitize the debounce pulse-duration setting and
   call that when setting the IRQ type.
   This helper would read the setting check it is not crazy long for
   an IRQ-line (lets say anything above 1 ms is crazy long) and if it
   is crazy long then overwrite it with a saner value.

2. is a bit tricky, because if the IRQ line comes from a chip then
obviously max 1ms debouncing to catch eletrical interference should be
fine. But sometimes cheap buttons for things like volume up/down on tablets
are directly connected to GPIOs and then we may want longer debouncing...

So if we do 2. we may want to limit it to only level type IRQs too.

Note I have contacted AMD about this and asked them for some input on this,
ideally they can tell us how exactly we should program the debounce filter
and based on which data we should do that.

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
