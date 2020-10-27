Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DDBC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:01:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C1520657
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBTkpN2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C1520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0036286877;
	Tue, 27 Oct 2020 16:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amuCKowOfAtx; Tue, 27 Oct 2020 16:01:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D057867D1;
	Tue, 27 Oct 2020 16:01:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D1CBC0859;
	Tue, 27 Oct 2020 16:01:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE115C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8D02C2048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZy3Xovq3HrZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:01:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 298052048F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603814464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHc5FAeh+073yepAD+LL4ORq6sSueZ+RhB/WrI1rhbo=;
 b=ZBTkpN2cc8aTSmO1JPbLllRFOUCVMCXhrctGcsvcjEUlh8Eny7HXIGeQYliX/MytTy2sff
 IGnKmjZ5JJ7MJ4JY27vIAQ7lKgxkerSVK3wtoBM4ufmV63QVZ5GbeZ54S41Y8IJVBNd8+g
 qxX7gtM3/89vZ4/X3LpXObFbDmltjp0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Sx7RKYavOjCy-hK-BBhmZQ-1; Tue, 27 Oct 2020 12:01:03 -0400
X-MC-Unique: Sx7RKYavOjCy-hK-BBhmZQ-1
Received: by mail-ed1-f69.google.com with SMTP id be19so840274edb.22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cHc5FAeh+073yepAD+LL4ORq6sSueZ+RhB/WrI1rhbo=;
 b=ctTI8Yv98QKiC6Cd8KfcLp7c1hvXWWX3GBHMQtZ+Ooqh8YI+vbCnNUt1l8gAWmeGY7
 iTvqQZs44bZ8fzbPdQPp01RYJU8h2Lyxu/yRAvDfINGu12+mt6RRO4Okv0hMFT8UApLy
 jybgA6ebNH4mmGU2nV2U91ieM+hrVB2prIa+W6b4m5JcixsQSLXR1UFLrkx1/6IK6D3N
 4KGWDO707de7TmUdTZP1/IH0ZBNa/8/x0jAst+Zrpg0wvclvveK4USuPx9sabffmHMdm
 390qFnAw+uAC7EJNYyHBR19YawYGN1XsycsffXsNuhF9Ts0vIcdxzQmSBOwJJjoTXPXo
 DNgQ==
X-Gm-Message-State: AOAM5310/K9LJYl+KcXGODO6lWRBrwwhH3hrb4Uw4iyPmOJEwrIbmp2f
 6CWCoN5ldow+TB9ejGX36BZf6GdsPn1G1SlY+bg/RhIrRw3DKPGh3MSefPCpokyZSctpdeWUSue
 tHeiLeWOYjN43vm3qiqNDxDD6xjlfwmthK2Y88OnsmjwEsuYh
X-Received: by 2002:a17:906:5d9:: with SMTP id
 t25mr3028429ejt.443.1603814460100; 
 Tue, 27 Oct 2020 09:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHZmd8jgZO6VIdKFwH/LXUa/TBSu5jcuLYbtrIBjoIESESqorzDNJEwz2XyTnTLLKNSTauiw==
X-Received: by 2002:a17:906:5d9:: with SMTP id
 t25mr3028382ejt.443.1603814459294; 
 Tue, 27 Oct 2020 09:00:59 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b8sm1204977edv.20.2020.10.27.09.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 09:00:58 -0700 (PDT)
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
Date: Tue, 27 Oct 2020 17:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 wang jun <availa@outlook.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

Hi,

On 10/27/20 4:13 PM, Andy Shevchenko wrote:
> On Tue, Oct 27, 2020 at 4:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/26/20 11:54 PM, Coiby Xu wrote:
>>> Hi Hans and Linus,
>>>
>>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>>> Interrupt Connection Resource Descriptor as disabling debouncing
>>> filter?
>>>
>>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>>>
>>> I'm not sure if Windows' implementation is the de facto standard like
>>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>>> can fix this touchpad issue and potentially some related issues by
>>> implementing the feature of supporting configuring debounce timeout in
>>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>>> What do you think?
>>>
>>> A favorable evidence is I've collected five DSDT tables when
>>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>>> an non-zero debounce timeout value for the edge type irq and for all
>>> the level type irq, the debounce timeout is set to 0x0000.
>>
>> That is a very interesting observation and this matches with my
>> instincts which say that we should just disable the debounce filter
>> for level triggered interrupts in pinctrl-amd.c
>>
>> Yes that is a bit of a shortcut vs reading the valie from the ACPI
>> table, but I'm not sure that 0 always means disabled.
>>
>> Specifically the ACPI 6.2 spec also has a notion of pinconf settings
>> and the docs on "PinConfig()"  say:
>>
>> Note: There is some overlap between the properties set by GpioIo/GpioInt/ PinFunction and
>> PinConfig descriptors. For example, both are setting properties such as pull-ups. If the same
>> property is specified by multiple descriptors for the same pins, the order in which these properties
>> are applied is undetermined. To avoid any conflicts, GpioInt/GpioIo/PinFunction should provide a
>> default value for these properties when PinConfig is used. If PinConfig is used to set pin bias,
>> PullDefault should be used for GpioIo/GpioInt/ PinFunction. *If PinConfig is used to set debounce
>> timeout, 0 should be used for GpioIo/GpioInt.*
>>
>> So that suggests that a value of 0 does not necessarily mean "disabled" but
>> it means use a default, or possibly get the value from somewhere else such
>> as from a ACPI PinConfig description (if present).
> 
> Nope, it was added to get rid of disambiguation when both Gpio*() and
> PinConfig() are given.
> So, 0 means default *if and only if* PinConfig() is present.
> 
> I.o.w. the OS layers should do this:
> 
>  - if Gpio*() provides Debounce != 0, we use it, otherwise
>  - if PinConfig() is present for this pin with a debounce set, use it, otherwise
>  - debounce is disabled.
> 
> Now we missed a midentry implementation in the Linux kernel, hence go
> to last, i.e. disable debounce.
> But it should be rather done in gpiolib-acpi.c.
> 
> Hope this helps.
> 
> I Cc'ed this to Mika as co-author of that part of specification, he
> may correct me if I'm wrong.

I see, so then the right thing to do for the bug which we are seeing
on some AMD platforms would be to honor the debounce setting I guess ?

Can you and/or Mika write a patch(set) for this ?

> P.S. Does RedHat have a representative in ASWG?

I think so yes, but mainly focussed on server related things I guess...

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
