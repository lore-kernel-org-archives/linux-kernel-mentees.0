Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DECC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:26:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 189C721D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9z6wa6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 189C721D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6625020378;
	Thu,  8 Oct 2020 16:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1tjsnsTZQ9N; Thu,  8 Oct 2020 16:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD6892014B;
	Thu,  8 Oct 2020 16:26:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96FF1C07FF;
	Thu,  8 Oct 2020 16:26:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A8B5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 53CC920378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4A8t8c9sszr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:26:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 953792014B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:26:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u24so4759291pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 09:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ueT925UaJXn+7sGQL/x68wHdFqIAG4KZ0mQr0NcLerw=;
 b=I9z6wa6wi5nclaMGTR+b95xPCBcUplbGljQ2OLTehQLtsd+gD+46O1GPrFCTRgWijs
 8Tj4PL+fFNgeJrV7BhpjIUi2m0GKiuxfpsuy74eDvCTFQCZnkhle+sI9/rtRkeNffX5P
 TcVbORxnczeLUHmNLNcqMQJvBmZ5Ig0d1VZZG+iQyRG8SvgkVNOjreXpmNFC1Ap9mSwg
 mPehQnbSbijfvkGjtxmxyYmnz5wlyEZINQcU9GchiqARw+EiTYjI9xsE0BvvgVSk4X+n
 TdncvOpeyQ5q0Ww5J4wZRPThrhXSsG8ZbO9QBq68gsPr+9dPXrBbl/q/UwmUL0xSm18o
 /1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ueT925UaJXn+7sGQL/x68wHdFqIAG4KZ0mQr0NcLerw=;
 b=OlpAJJjk03ucQTQWCw7yUlQQVyfO91pjiz2R79ZHvJdRvHxHTI8YZ9lkUXn8M7f6Ca
 CqSWvMM2wIAoMod+E/VXK/x3CkO6mRp5Z+mLPk8goeqKEUUS8u2eIt2KzItAe7ljZR4U
 9bEEF/HGbIGbxNuMYbpuXbETB2avjdi/fd4uDxsOHWhbYXzf0fIkTFBNgPsqHA3i2p/c
 WLAUvxNeTZtHt2lJ/vB+1ilJv4e1A9GMCYCQazKdbTOWUo2ACLRNeBYEhIcyT1tFvzAj
 X6WLSGOWK45XkHqX2gTgHTHIy4bmuzp7jTo9xT+x8eMYo5PhkGsdV+o3svAnG0mbjWgO
 qpPg==
X-Gm-Message-State: AOAM532w8rPVixGwoBf6+iwfQloXpSQj7fsjUrLEnEFUabjedHOdoqPj
 0b+BHOoYCn5tCvrWS4lzrrk=
X-Google-Smtp-Source: ABdhPJwNJ5/zbFCF47cAlIDH+xsXFS/ZGrttCdYPbxfExX02BVAFyOWW0ud1HN/JVgmrZrhH2umg5Q==
X-Received: by 2002:a17:90b:4a8b:: with SMTP id
 lp11mr9086312pjb.53.1602174383001; 
 Thu, 08 Oct 2020 09:26:23 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id q65sm7893018pfq.219.2020.10.08.09.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:26:22 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 9 Oct 2020 00:26:14 +0800
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20201008162614.md4sw6ciodn7m5iw@Rk>
References: <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
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

On Tue, Oct 06, 2020 at 11:28:06AM +0200, Hans de Goede wrote:
>Hi,
>
>On 10/6/20 10:55 AM, Hans de Goede wrote:
>>Hi,
>>
>>On 10/6/20 10:31 AM, Coiby Xu wrote:
>>>On Tue, Oct 06, 2020 at 08:28:40AM +0200, Hans de Goede wrote:
>>>>Hi,
>>>>
>>>>On 10/6/20 6:49 AM, Coiby Xu wrote:
>>>>>Hi Hans and Linus,
>>>>>
>>>>>I've found the direct evidence proving the GPIO interrupt controller is
>>>>>malfunctioning.
>>>>>
>>>>>I've found a way to let the GPIO chip trigger an interrupt by accident
>>>>>when playing with the GPIO sysfs interface,
>>>>>
>>>>>=A0- export pin130 which is used by the touchad
>>>>>=A0- set the direction to be "out"
>>>>>=A0- `echo 0 > value` will trigger the GPIO controller's parent irq and
>>>>>=A0=A0 "echo 1 > value" will make it stop firing
>>>>>
>>>>>(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
>>>>>manually trigger an interrupt now.)
>>>>>
>>>>>I wrote a C program is to let GPIO controller quickly generate some
>>>>>interrupts then disable the firing of interrupts by toggling pin#130's
>>>>>value with an specified time interval, i.e., set the value to 0 first
>>>>>and then after some time, re-set the value to 1. There is no interrupt
>>>>>firing unless time internal > 120ms (~7Hz). This explains why we can
>>>>>only see 7 interrupts for the GPIO controller's parent irq.
>>>>
>>>>That is a great find, well done.
>>>>
>>>>>My hypothesis is the GPIO doesn't have proper power setting so it stays
>>>>>in an idle state or its clock frequency is too low by default thus not
>>>>>quick enough to read interrupt input. Then pinctrl-amd must miss some
>>>>>code to configure the chip and I need a hardware reference manual of t=
his
>>>>>GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
>>>>>since I couldn't find a copy of reference manual online? What would you
>>>>>suggest?
>>>>
>>>>This sounds like it might have something to do with the glitch filter.
>>>>The code in pinctrl-amd.c to setup the trigger-type also configures
>>>>the glitch filter, you could try changing that code to disable the
>>>>glitch-filter. The defines for setting the glitch-filter bits to
>>>>disabled are already there.
>>>>
>>>
>>>Disabling the glitch filter works like a charm! Other enthusiastic
>>>Linux users who have been troubled by this issue for months would
>>>also feel great to know this small tweaking could bring their
>>>touchpad back to life:) Thank you!
>>
>>That is good to hear, I'm glad that we have finally found a solution.
>>
>>>$ git diff
>>>diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd=
.c
>>>index 9a760f5cd7ed..e786d779d6c8 100644
>>>--- a/drivers/pinctrl/pinctrl-amd.c
>>>+++ b/drivers/pinctrl/pinctrl-amd.c
>>>@@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d,=
 unsigned int type)
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg &=3D ~(ACTIVE_L=
EVEL_MASK << ACTIVE_LEVEL_OFF);
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg |=3D ACTIVE_LOW=
 << ACTIVE_LEVEL_OFF;
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg &=3D ~(DB_CNTRl=
_MASK << DB_CNTRL_OFF);
>>>-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pin_reg |=3D DB_TYPE_PRESERV=
E_HIGH_GLITCH << DB_CNTRL_OFF;
>>>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /** pin_reg |=3D DB_TYPE_PRE=
SERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 irq_set_handler_locked(=
d, handle_level_irq);
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>
>>>I will learn more about the glitch filter and the implementation of
>>>pinctrl and see if I can disable glitch filter only for this touchpad.
>>
>>The glitch filter likely also has settings for how long a glitch
>>lasts, which apparently goes all the way up to 120ms. If it would
>>only delay reporting by say 0.1ms and consider any pulse longer
>>then 0.1s not a glitch, then having it enabled would be fine.
>>
>>I don't think we want some sort of quirk here to only disable the
>>glitch filter for some touchpads. One approach might be to simply
>>disable it completely for level type irqs.
>>
>>What we really need here is some input from AMD engineers with how
>>this is all supposed to work.
>>
>>E.g. maybe the glitch-filter is setup by the BIOS and we should not
>>touch it all ?
>>
>>Or maybe instead of DB_TYPE_PRESERVE_HIGH_GLITCH low level interrupts
>>should use DB_TYPE_PRESERVE_LOW_GLITCH ?=A0=A0 Some docs for the hw
>>would really help here ...
>
>So I've been digging through the history of the pinctrl-amd.c driver
>and once upon a time it used to set a default debounce time of
>2.75 ms.
>
>See the patch generated by doing:
>
>git format-patch 8cf4345575a416e6856a6856ac6eaa31ad883126~..8cf4345575a416=
e6856a6856ac6eaa31ad883126
>
>In a linux kernel checkout.
>
>So it would be interesting to add a debugging printk to see
>what the value of pin_reg & DB_TMR_OUT_MASK is for the troublesome
>GPIO.
>
>I guess that it might be all 1s (0xfffffffff) or some such which
>might be a way to check that we should disable the glitch-filter
>for this pin?
>

I guess you mean the value of "pin_reg" (not
"pin_reg & DB_TMR_OUT_MASK"), then the value is 0x500e8. So it means
BIOS or Bootloader has set the debounce for us.

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
