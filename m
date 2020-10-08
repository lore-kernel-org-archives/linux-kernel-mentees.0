Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9E3C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:33:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF40D21D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqqhxeqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF40D21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 651BD86C41;
	Thu,  8 Oct 2020 16:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFlNjXEM8AIi; Thu,  8 Oct 2020 16:33:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA18386C34;
	Thu,  8 Oct 2020 16:33:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CF0DC07FF;
	Thu,  8 Oct 2020 16:33:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB964C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CA45686FA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1DgPak9ds7f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:33:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A7DFC86F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:33:06 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g9so4748630pgh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KeC71O7Qbn7oSKZHAJyTnl7duHatYRAQ9MwGq49WJyQ=;
 b=oqqhxeqTAz1oOuI2TMq02kXN2DDBJUWO3nA4GGcZKZvWAMjQoVD7Mp8isEhae7uH3K
 eormaN2k7p+hXqycA+nxXgLHgbLob8So2Rf0869trQmsL9CN8/Nv9y2dmq1HxJhH16cx
 3pJ9713OG+rex5fIwgJxIwiVn7thMiQdo/DxAgm+rNKP9AwSRU3TIQDO/pVV++JPsy6d
 qKDpgnZV/wapuFNVsbrzfnnzFWZjjL5nPQ0khhno7sFO5um2dx6arJbOOzr3N7izCcEg
 3r/E1JPXZQFxSRRDf/HIoLw+2xSL8AUlXOBtwgNFQlAr6a/+fGg0EenS0gRYngcfDJdS
 o2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KeC71O7Qbn7oSKZHAJyTnl7duHatYRAQ9MwGq49WJyQ=;
 b=mK0QBONKNT3TwUH8BCQh+g3d++45/qISIyo9HlIIWnC9R5LXd8l1S6MFj3kX+yVz7p
 GzxSd1mXBmYzADuzNjVqEmP3wQYroBQyHcgF4BqtzMWgeZtvb4C1nqb9Uuov+VYboq+P
 qFR6dRGY7dyQck9UQw2o2AQXjx+g1lFdkFK0qAN8uqREiGlHNrUW4pn8CMF82KnUM0B2
 LU4zoCNs0xiqUmjdr2FBMYGo8EozlMPLCTlm+aoHyrQPR/qD9IpXB8o3jmcAVo6ZNEBU
 o6lbnNwdMA14ELTOcdC6ky2OVygv8HUbO73nMxxRigHbFvfohadE47UcBWkB/SMPBGGe
 jS/Q==
X-Gm-Message-State: AOAM533i8ZfIxPUz7/UuiqEP6WALEYennfB3yl7uuPxZ2QhbOMtTyYHO
 gODNUoTOZ6l4Gx+JVBsttrQ=
X-Google-Smtp-Source: ABdhPJynxI+clkNB6AJx76UrbEaWC/8f1Jm+2LN/9IX7s3SdycBXvw5IS9ZLn/BJNVhRyVs6cTgQ0Q==
X-Received: by 2002:a62:7895:0:b029:152:2640:644f with SMTP id
 t143-20020a6278950000b02901522640644fmr8071544pfc.67.1602174786194; 
 Thu, 08 Oct 2020 09:33:06 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id s24sm7565097pjp.53.2020.10.08.09.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:33:05 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 9 Oct 2020 00:32:58 +0800
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20201008163258.x5nytf574yjb3sop@Rk>
References: <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 06, 2020 at 11:29:40AM +0200, Hans de Goede wrote:
>
>
>On 10/6/20 11:28 AM, Hans de Goede wrote:
>>Hi,
>>
>>On 10/6/20 10:55 AM, Hans de Goede wrote:
>>>Hi,
>>>
>>>On 10/6/20 10:31 AM, Coiby Xu wrote:
>>>>On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>>>Hi,
>>>>>
>>>>>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>>>Hi Hans and Linus,
>>>>>>
>>>>>>I've found the direct evidence proving the GPIO interrupt controller =
is
>>>>>>malfunctioning.
>>>>>>
>>>>>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>>>when playing with the GPIO sysfs interface,
>>>>>>
>>>>>>=A0- export pin130 which is used by the touchad
>>>>>>=A0- set the direction to be "out"
>>>>>>=A0- `echo 0 > value` will trigger the GPIO controller's parent irq a=
nd
>>>>>>=A0=A0 "echo 1 > value" will make it stop firing
>>>>>>
>>>>>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I c=
an
>>>>>>manually trigger an interrupt now.)
>>>>>>
>>>>>>I wrote a C program is to let GPIO controller quickly generate some
>>>>>>interrupts then disable the firing of interrupts by toggling pin#130's
>>>>>>value with an specified time interval, i.e., set the value to 0 first
>>>>>>and then after some time, re-set the value to 1. There is no interrupt
>>>>>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>>>only see 7 interrupts for the GPIO controller's parent irq.
>>>>>
>>>>>That is a great find, well done.
>>>>>
>>>>>>My hypothesis is the GPIO doesn't have proper power setting so it sta=
ys
>>>>>>in an idle state or its clock frequency is too low by default thus not
>>>>>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>>>code to configure the chip and I need a hardware reference manual of =
this
>>>>>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>>>since I couldn't find a copy of reference manual online? What would y=
ou
>>>>>>suggest?
>>>>>
>>>>>This sounds like it might have something to do with the glitch filter.
>>>>>The code in pinctrl-amd.c to setup the trigger-type also configures
>>>>>the glitch filter, you could try changing that code to disable the
>>>>>glitch-filter. The defines for setting the glitch-filter bits to
>>>>>disabled are already there.
>>>>>
>>>>
>>>>Disabling the glitch filter works like a charm! Other enthusiastic
>>>>Linux users who have been troubled by this issue for months would
>>>>also feel great to know this small tweaking could bring their
>>>>touchpad back to life:) Thank you!
>>>
>>>That is good to hear, I'm glad that we have finally found a solution.
>>>
>>>>$ git diff
>>>>diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-am=
d.c
>>>>index 9a760f5cd7ed..e786d779d6c8 100644
>>>>--- a/drivers/pinctrl/pinctrl-amd.c
>>>>+++ b/drivers/pinctrl/pinctrl-amd.c
>>>>@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d=
, unsigned int type)
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg &=3D ~(ACTIVE_=
LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg |=3D ACTIVE_LO=
W << ACTIVE_LEVEL_OFF;
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg &=3D ~(DB_CNTR=
l_MASK << DB_CNTRL_OFF);
>>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg |=3D DB_TYPE_PRESER=
VE_HIGH_GLITCH << DB_CNTRL_OFF;
>>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /** pin_reg |=3D DB_TYPE_PR=
ESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 irq_set_handler_locked=
(d, handle_level_irq);
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>>
>>>>I will learn more about the glitch filter and the implementation of
>>>>pinctrl and see if I can disable glitch filter only for this touchpad.
>>>
>>>The glitch filter likely also has settings for how long a glitch
>>>lasts, which apparently goes all the way up to 120ms. If it would
>>>only delay reporting by say 0.1ms and consider any pulse longer
>>>then 0.1s not a glitch, then having it enabled would be fine.
>>>
>>>I don't think we want some sort of quirk here to only disable the
>>>glitch filter for some touchpads. One approach might be to simply
>>>disable it completely for level type irqs.
>>>
>>>What we really need here is some input from AMD engineers with how
>>>this is all supposed to work.
>>>
>>>E.g. maybe the glitch-filter is setup by the BIOS and we should not
>>>touch it all ?
>>>
>>>Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>>>should use DB_TYPE_PRESERVE_LOW_GLITCH ?=A0=A0 Some docs for the hw
>>>would really help here ...
>>
>>So I've been digging through the history of the pinctrl-amd.c driver
>>and once upon a time it used to set a default debounce time of
>>2.75 ms.
>>
>>See the patch generated by doing:
>>
>>git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a41=
6e6856a6856ac6eaa31ad883126
>>
>>In a linux kernel checkout.
>>
>>So it would be interesting to add a debugging printk to see
>>what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
>>GPIO.
>>
>>I guess that it might be all 1s (0xfffffffff) or some such which
>>might be a way to check that we should disable the glitch-filter
>>for this pin?
>
>p.s.
>
>Or maybe we should simply stop touching all the glitch-filter
>related bits, in the same way as that old commit has already
>removed the code setting the timing of the filter ?
>
>At least is seems that forcing the filter to be on without
>sanitizing the de-bounce time is not a good idea.
>

One evidence I find that supports this is I can only find "debounce"
in ACPI Spec 6.1 and searching for "glitch" return nothing. Debounce
could be used to configure pin for interrupt,

GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, Resour=
ceSource,
          ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData)
          {PinList}

>Regards,
>
>Hans
>

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
