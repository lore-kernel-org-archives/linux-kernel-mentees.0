Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAE0C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:59:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965C220708
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfEiUFUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 965C220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3A2D1274B0;
	Fri,  2 Oct 2020 10:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJ5eoRTjSxBU; Fri,  2 Oct 2020 10:59:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CA250204CA;
	Fri,  2 Oct 2020 10:59:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8C25C016F;
	Fri,  2 Oct 2020 10:59:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79BB9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7553486352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhD8kuP6VwEi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:59:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BC77286329
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:59:27 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q4so582242pjh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TMaRVRmNtxyG8nwPY0bS73whq3LcZ7pPS5P5niBlou4=;
 b=AfEiUFUNAsST5n3MSSnXwZmcsJ/oYOQuhYgfWIYbzKeSfako0BPkXSSp+BzEQ2iRiB
 5mTjF0tvsoXtRaolzNQKmTipex4ucrUF1u2/CrzWfNFtcEPb72movUYZ7bY9/rkSab+h
 lH+hgiOSYlrZh5FxWLt9xGz9N7spMn1QrHKiVupW85eHMW0fKC7TQcjdBNi3dNjOzNve
 MmO1pEeVrzl40qJ1ZSvgtOLnJ1LZNHiMK2YOg+ybIvLUtJvccmt1ZpRvm+kwAOWRinDH
 8d0GrbItgGkk4Bl2RUtVW6F4VITQqercDhDdooImVymtZAFiHQTbZcCEEdbqMBFnOFmw
 efpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TMaRVRmNtxyG8nwPY0bS73whq3LcZ7pPS5P5niBlou4=;
 b=qwOtlupyWQ9r+TOtvvSiqh5EH2rl/xZb6umoaRns9EIP2WY4aC1J48fT6CuGUiqUmP
 BKZF93f2l7E4gTvUjPfsm88LVriD5js86oYMuKQwuFFQj4SrqejMCJPpo+K485eFRtbd
 0tIvgFflZqK3xaWR6w9wPBE8mNvJG6kivfOIOv5d5lPe2uzgB9VlNp64dPxo0/SNlFdz
 7PrDTnilmsTyj9wX0oyNx3CWW1JCrvWqkhRcqwyhQky+6k/avdYsCc4NSvM7l4cWRLML
 Gmt1LE3F9CjdBwYS8LVF5/T5Xe9gRDO4XJ1G0vwh8wyThLNfSYa8o+xAfCBHlHTkqock
 KKOQ==
X-Gm-Message-State: AOAM533pj4KkVjyTL6pyNlpKG3ayOQPxspvevFy53JuEpjerTEfHKZ/P
 zrbTstWHid6dpiHIPC567UA=
X-Google-Smtp-Source: ABdhPJybd8ge4Lt5JOzC1CxQvOuziH0Fw6rY+VI0bKFdJUsk+I6LX+DR2I3KjaQQZW9tJEzBqHgzUw==
X-Received: by 2002:a17:90a:55c8:: with SMTP id
 o8mr2111721pjm.215.1601636367279; 
 Fri, 02 Oct 2020 03:59:27 -0700 (PDT)
Received: from localhost ([160.16.113.140])
 by smtp.gmail.com with ESMTPSA id q5sm1499023pfn.172.2020.10.02.03.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 03:59:26 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 2 Oct 2020 18:59:06 +0800
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20201002105906.r5yjih2o3oomlcy6@Rk>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

On Thu, Oct 01, 2020 at 10:57:40PM +0200, Linus Walleij wrote:
>Sorry for top posting, but I want to page some people.
>
>I do not know anything about ACPI, but Hans de Goede is really
>good with this kind of things and could possibly provide some
>insight.

Thank you for introducing Hans de Goede to me!

>
>Yours,
>Linus Walleij
>
>On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi,
>>
>> I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
>> 15ARH05 which is shipped with two different touchpads, i.e., ElAN and
>> Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
>> be informed of new data from the touchpad. For the Synaptics touchpad,
>> only 7 interrupts are received per second which makes the touchpad
>> completely unusable. Based on current observations, pinctrl-amd seems to
>> be the most suspicious cause.
>>
>>
>> Why do I think pinctrl-amd smells the most suspicious?
>> ======================================================
>>
>> This laptop model has the following hardware configurations specified
>> via ACPI,
>>   - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>>     chip
>>
>>          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>>                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>>                          )
>>                          {   // Pin list
>>                              0x0082
>>                          }
>>
>>   - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>>     common interrupt output line connected to one IO-APIC's pin#7
>>
>>          Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>>          {
>>              0x00000007,
>>          }
>>
>> I add some code to kernel to poll the status of the GPIO chip's pin#130
>> and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
>> the Synaptics touchpad continuously for about 1s. During the process of I
>> move my finger, most of the time,
>>   - GPIO chip's pin#130: low input, interrupt unmasked
>>   - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>>     have never been called by the IRQ follow controller handle_fasteoi_irq)
>>
>> So the touchpad has been generating interrupts most of the time while
>> IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
>> But somehow the kernel could only get ~7 interrupts each second while
>> the touchpad could generate 140 interrupts (time resolution of 7.2ms)
>> per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
>> then there's something wrong with the GPIO interrupt controller which
>> works fine for the touchpad under Windows. Besides if I poll the touchpad
>> data based on pin#130's status, the touchpad could also work under
>> Windows.
>>
>> Ways to debug pinctrl-amd
>> =========================
>>
>> I can't find any documentation about the AMDI0030 GPIO chip except for
>> the commit logs of drivers/pinctrl/pinctrl-amd. One commit
>> ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
>> inspired me to bring back chained interrupt to see if "an interrupt storm"
>> would happen. The only change I noticed is that the interrupts arrive in
>> pairs. The time internal between two interrupts in a pair is ~0.0016s
>> but the time internal between interrupt pairs is still ~0.12s (~8Hz).
>> Unfortunately, I don't get any insight about the GPIO interrupt
>> controller from this tweaking. I wonder if there are any other ways
>> to debug drivers/pinctrl/pinctrl-amd?
>>
>> Thank you!
>>
>>
>> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>>
>> --
>> Best regards,
>> Coiby
>>

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
