Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A28C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:49:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2771020782
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:49:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5JDjnND"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2771020782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACE5E864D4;
	Tue,  6 Oct 2020 04:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZcKPPXXPuqS; Tue,  6 Oct 2020 04:49:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 619EC84AF9;
	Tue,  6 Oct 2020 04:49:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DCACC016F;
	Tue,  6 Oct 2020 04:49:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82F7BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D82886FC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wntzCFvJvD8t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79CA386FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:49:48 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id a17so967914pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v8UV7zXODIWoAuTyZlujcVrxAU2nyBbK4m1+uEqrtMw=;
 b=E5JDjnNDlahl1gTVApUMkMzZJNeugRdnnMduuieNRYHNZe+3xLWtpNjj21hrAA9UNP
 CTBv4RWjq3Xak31qvdPTMenNGOeM7Bh/oS7IMMRdZ7h+LGCEMuZ3avIN01+9bhQ56TkZ
 KIozjwqMeel/Y67M5/eBPjTwqd90m066P7l3nMMD2sbodrA45G6Pm9Gl8DOi00ZNbDlm
 cZSJKW98932i/OuCE4wh98eeUjTMqcLbxXdQCvLgvosMG1eGYRWaOTCJqNpWxlAfpBmd
 V/4fAo2W0AXMUHFdVJupUdQytyqs4yOp5J9IDWdmMM2260iCGoQo3rAUuNpfgZV/2lgu
 vmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v8UV7zXODIWoAuTyZlujcVrxAU2nyBbK4m1+uEqrtMw=;
 b=oRAhvSjzNzVHQNKjl/cOSmGbwcIzUP5UeFlRRVDgDd6//F/wvHeTvkcMy58KH7b7sf
 gUnYSfspPFceU3Qzq6EWOswPBhHBjy31C7FYp/AJ32W1XHZqtNlgMeZGE7a6lHwduBGc
 r9r/ZpPeiXtNBT/MZydf2IB8vv5lrIgjM6znEeiANs7CWB1/AKKfVdrfHDO6wUZ/dixV
 6dhov7xxJ2d/BVwTbXd23HSrtif4izhpLc97oOsUHihJ7w6pYNT7R/M1IaHhfz6r//uK
 KzoD22hJs70eVcWjuIJcW6nSt+3hxFlCiAlX3fvkOyowSX1wksQnVQV34h3c9AxHRBVD
 uEtA==
X-Gm-Message-State: AOAM533rR24SPOzeJ/ciD9d/S4DGaS6VGW6TNqH6rj+ZVmK5wCTAKi/B
 Ewgtj0EMD4gM3CNZH+i70p8=
X-Google-Smtp-Source: ABdhPJxm0yyrcc/S/c2Sx0vFr6pBgsfcr7v0e/sJA4/zblou4y6DwgXkn0mhQtM/OXLyY7LtO2Jqhg==
X-Received: by 2002:a17:902:eacc:b029:d3:b362:72c0 with SMTP id
 p12-20020a170902eaccb02900d3b36272c0mr1626520pld.23.1601959787947; 
 Mon, 05 Oct 2020 21:49:47 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id q5sm1716702pfb.184.2020.10.05.21.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 21:49:47 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 6 Oct 2020 12:49:41 +0800
To: Hans de Goede <hdegoede@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20201006044941.fdjsp346kc5thyzy@Rk>
References: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201004051644.f3fg2oavbobrwhf6@Rk>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Hans and Linus,

I've found the direct evidence proving the GPIO interrupt controller is
malfunctioning.

I've found a way to let the GPIO chip trigger an interrupt by accident
when playing with the GPIO sysfs interface,

  - export pin130 which is used by the touchad
  - set the direction to be "out"
  - `echo 0 > value` will trigger the GPIO controller's parent irq and
    "echo 1 > value" will make it stop firing

(I'm not sure if this is yet another bug of the GPIO chip. Anyway I can
manually trigger an interrupt now.)

I wrote a C program is to let GPIO controller quickly generate some
interrupts then disable the firing of interrupts by toggling pin#130's
value with an specified time interval, i.e., set the value to 0 first
and then after some time, re-set the value to 1. There is no interrupt
firing unless time internal > 120ms (~7Hz). This explains why we can
only see 7 interrupts for the GPIO controller's parent irq.

My hypothesis is the GPIO doesn't have proper power setting so it stays
in an idle state or its clock frequency is too low by default thus not
quick enough to read interrupt input. Then pinctrl-amd must miss some
code to configure the chip and I need a hardware reference manual of this
GPIO chip (HID: AMDI0030) or reverse-engineer the driver for Windows
since I couldn't find a copy of reference manual online? What would you
suggest?

Thank you!

On Sun, Oct 04, 2020 at 01:16:44PM +0800, Coiby Xu wrote:
>On Sun, Oct 04, 2020 at 07:03:40AM +0800, Coiby Xu wrote:
>>On Sat, Oct 03, 2020 at 03:22:46PM +0200, Hans de Goede wrote:
>>>Hi,
>>>
>>>On 10/3/20 12:45 AM, Coiby Xu wrote:
>>>>On Fri, Oct 02, 2020 at 09:44:54PM +0200, Hans de Goede wrote:
>>>>>Hi,
>>>>>
>>>>>On 10/2/20 4:51 PM, Coiby Xu wrote:
>>>>>>On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:
>>>>>
>>>>><snip>
>>>>>
>>>>>>>>>So are you seeing these 7 interrupts / second for the touchpad irq=
 or for
>>>>>>>>>the GPIO controllers parent irq ?
>>>>>>>>>
>>>>>>>>>Also to these 7 interrupts/sec stop happening when you do not touc=
h the
>>>>>>>>>touchpad ?
>>>>>>>>>
>>>>>>>>I see these 7 interrupts / second for the GPIO controller's parent =
irq.
>>>>>>>>And they stop happening when I don't touch the touchpad.
>>>>>>>
>>>>>>>Only from the parent irq, or also on the touchpad irq itself ?
>>>>>>>
>>>>>>>If this only happens on the parent irq, then I would start looking a=
t the
>>>>>>>amd-pinctrl code which determines which of its "child" irqs to fire.
>>>>>>
>>>>>>This only happens on the parent irq. The input's pin#130 of the GIPO
>>>>>>chip is low most of the time and pin#130.
>>>>>
>>>>>Right, but it is a low-level triggered IRQ, so when it is low it should
>>>>>be executing the i2c-hid interrupt-handler. If it is not executing that
>>>>>then it is time to look at amd-pinctrl's irq-handler and figure out why
>>>>>that is not triggering the child irq handler for the touchpad.
>>>>>
>>>>I'm not sure if I have some incorrect understandings about GPIO
>>>>interrupt controller because I don't quite follow your reasoning.
>>>>What I actually suspect is there's something wrong with amd-pinctrl
>>>>which makes the GPIO chip fail to assert its common interrupt output
>>>>line connected to one IO-APIC's pin#7 thus IRQ#7 fails to fire. What
>>>>I learn about this low-level triggered IRQ is that the i2c-hid
>>>>interrupt-handler will be woken up by amd-pinctrl's irq-handler which
>>>>is executed when the parent IRQ#7 fires. The code path is as follows,
>>>>
>>>>=A0=A0=A0 <IRQ>
>>>>=A0=A0=A0 dump_stack+0x64/0x88
>>>>=A0=A0=A0 __irq_wake_thread.cold+0x9/0x12
>>>>=A0=A0=A0 __handle_irq_event_percpu+0x80/0x1c0
>>>>=A0=A0=A0 handle_irq_event+0x58/0xb0
>>>>=A0=A0=A0 handle_level_irq+0xb7/0x1a0
>>>>=A0=A0=A0 generic_handle_irq+0x4a/0x60
>>>>=A0=A0=A0 amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
>>>>=A0=A0=A0 __handle_irq_event_percpu+0x45/0x1c0
>>>>=A0=A0=A0 handle_irq_event+0x58/0xb0
>>>>=A0=A0=A0 handle_fasteoi_irq+0xa2/0x210
>>>>=A0=A0=A0 do_IRQ+0x70/0x120
>>>>=A0=A0=A0 common_interrupt+0xf/0xf
>>>>=A0=A0=A0 </IRQ>
>>>>
>>>>But the problem is somehow IRQ#7 doesn't even fire when the input's
>>>>pin#130 of the GIPO is low. Without IRQ#7 firing, amd-pinctrl's
>>>>irq-handler wouldn't be executed in the first place, let alonet
>>>>triggering the child irq handler. Btw, amd-pinctrl's irq-handler
>>>>simply iterate over all pins. If there is mapped irq found for this
>>>>hwirq (yes, it won't even check if this pin triggers the interrupt),
>>>>then it will call generic_handle_irq. So there's nothing wrong about
>>>>this part of code.
>>>
>>>Ok, so the i2c-hid irq does fire, but only 7 times a second just
>>>like the GPIO controller's parent irq.
>>>
>>I'm not sure if it's correct to say if hi2c-hid irq fires or not and how
>>frequently it fires since the i2c-hid irq is mapped to pin#130 of the
>>GPIO interrupt controller and the touchpad has another interrupt line
>>connected to pin#130 which fires to indicate new data. All we know is
>>pin#130 of the GPIO chip has low input most of the time when the finger
>>is on the touchpad so we can infer the touchpad has been trying to
>>notify the kernel of new data but somehow GPIO's parent irq only fires 7
>>times / second.
>>
>>>The only thing I can think of then is to add printk-s to check how
>>>long the i2c-hid interrupt handler takes to complete. It could be
>>>there is a subtle bug somewhere causing the i2c transfers to take
>>>longer when run from a (threaded) irq handler. That would be weird
>>>though, so I don't expect this to result in any useful findings.
>>>
>>
>>I also doubted if it takes too much time for the i2c-hid handler to
>>finish reading i2c transfer, processing data and delivering to the input
>>system. After measuring the time internal between the starting of the
>>GPIO irq's parent handler and when pin#130 is unmasked, we can exclude
>>this possibility.
>>
>>I have been wondering if we let make pin#130 have low input thus to
>>trigger a interrupt firing or assert the GPIO's common interrupt output
>>line manually thus we can measure how long does it take for the kernel
>>to receive the signal. But once GPIO's pin is programmed to be a
>>interrupt line we can't write anything to it and it seems other
>>interrupts can only be generated by the hardware. So this idea is not
>>plausible
>>
>
>Btw, there are other users who have the same laptop model but with a
>different touchpad (ELAN). Their touchpads would show in
>/proc/bus/input/devices but are completely dead. hid-recorder which
>will read HID reports from /dev/hidraw gets nothing if they put there
>fingers on the touchpad but the polling mode could also save their
>touchpads. It seems GPIO controller's parent irq for the ELAN touchpad
>doesn't even fire once. And unlike GPIO, IO-APIC has also be used by
>other devices like the keyboard. So maybe it's safe to assert the root
>cause is from the GPIO controller.
>
>>>Other then that I'm all out of ideas I'm afraid.
>>>
>>Thank you for taking time to investigate this issue anyway! Have a nice
>>weekend:)
>>>Regards,
>>>
>>>Hans
>>>
>>
>>--
>>Best regards,
>>Coiby
>
>--
>Best regards,
>Coiby

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
