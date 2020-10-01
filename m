Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FE3C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:23:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B6A20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 13:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcvmfdFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B6A20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 682D186A58;
	Thu,  1 Oct 2020 13:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlusJxZdFnQb; Thu,  1 Oct 2020 13:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D43F786A31;
	Thu,  1 Oct 2020 13:23:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE168C016F;
	Thu,  1 Oct 2020 13:23:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 551BAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4048F8730D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZtKjvw1NUye
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8DD60872B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 13:23:14 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l126so4481258pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
 bh=QMvUWwpCbcRQWQ/67lZpDcdES3Tgoo1hAu0TKVA+3CU=;
 b=JcvmfdFU26r00kIq3l8tb+NbqO9R1ZBiVqfDQRV1DUXwOUnLXISFCCwGwYekcaYFeE
 Ampei1bHnEoGp4ESwceDSp9hUzwT1OyGtecn39CfrSvHxteavnq0GVhxh9VWmR47txY9
 AGlGrtTf287uB1Zk+8MbmO+CHko+d3AzEKz3I7OjkVC6M1qRoCqfBoA5YE0JdptBes5a
 GXljDHpPLJc4gQlW1NC+jO1Z/M+Yp3EkjOWOtGhsUWvqT/pQdjZ7ThEE5UTh6tpBec8X
 5NmV/9FBdwOnko5QEpsm3xUXscYQsXHlSgT0Yrm2qD4nV25XqftScXxJ43xZcrrFHHm0
 fE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=QMvUWwpCbcRQWQ/67lZpDcdES3Tgoo1hAu0TKVA+3CU=;
 b=Bicbgw8sJuv+EcT8DGIWvYlFwSrPKXgp7FyGvph94M7Ol051ALFPt7/i43tqmLJAuM
 1t3s7wYmDcJvHCFEVMcA399MsAs72gLOPREMdqrbt4FpjmfZ+xW7xDp2RjhQnOdGVctZ
 iGd11TjaZdSBMm3YA7rnNDqa+U5cH8CGeP4CU0BVoho6U9b1agtO/VBn41Y55dvAJOwH
 099IX9jo3vMxnrHob+S4Dy9cdNizA+1AjX/2UE+EomHFL8oKiamHs+7iDTQvPOwidrr5
 IhbbApWNfhvZya2RLxq4+njjLK8mZ11xvMyg0i2BFWz7/ic4QmJt6dEc98KxY6UaVmvJ
 1xjw==
X-Gm-Message-State: AOAM531lv+qwPhC7PXTsQEXH8jJ7qMsZ9Vj8eCWPQEC4E5umhdIyMBln
 FwONBWcEoARYmhJyB7gNbco=
X-Google-Smtp-Source: ABdhPJyErk+l+mmIOPOASjYGAmYk5IF/PxLoEMqf52PS+fba8x+lCgnMI1Ygz6OXRdGG20eh8oDwtQ==
X-Received: by 2002:a62:7f0e:0:b029:152:197b:e2bd with SMTP id
 a14-20020a627f0e0000b0290152197be2bdmr1175738pfd.7.1601558594102; 
 Thu, 01 Oct 2020 06:23:14 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id y4sm6824494pfr.46.2020.10.01.06.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 06:23:12 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 1 Oct 2020 21:22:58 +0800
To: linux-gpio@vger.kernel.org
Message-ID: <20201001132258.6yzosj2w7k4eod42@Rk>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
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

Hi,

I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
15ARH05 which is shipped with two different touchpads, i.e., ElAN and
Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
be informed of new data from the touchpad. For the Synaptics touchpad,
only 7 interrupts are received per second which makes the touchpad
completely unusable. Based on current observations, pinctrl-amd seems to
be the most suspicious cause.


Why do I think pinctrl-amd smells the most suspicious?
======================================================

This laptop model has the following hardware configurations specified
via ACPI,
  - The touchpad's data interrupt line is connected to pin#130 of a GPIO
    chip

         GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0082
                         }

  - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
    common interrupt output line connected to one IO-APIC's pin#7

         Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
         {
             0x00000007,
         }

I add some code to kernel to poll the status of the GPIO chip's pin#130
and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
the Synaptics touchpad continuously for about 1s. During the process of I
move my finger, most of the time,
  - GPIO chip's pin#130: low input, interrupt unmasked
  - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
    have never been called by the IRQ follow controller handle_fasteoi_irq)

So the touchpad has been generating interrupts most of the time while
IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
But somehow the kernel could only get ~7 interrupts each second while
the touchpad could generate 140 interrupts (time resolution of 7.2ms)
per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
then there's something wrong with the GPIO interrupt controller which
works fine for the touchpad under Windows. Besides if I poll the touchpad
data based on pin#130's status, the touchpad could also work under
Windows.

Ways to debug pinctrl-amd
=========================

I can't find any documentation about the AMDI0030 GPIO chip except for
the commit logs of drivers/pinctrl/pinctrl-amd. One commit
ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
inspired me to bring back chained interrupt to see if "an interrupt storm"
would happen. The only change I noticed is that the interrupts arrive in
pairs. The time internal between two interrupts in a pair is ~0.0016s
but the time internal between interrupt pairs is still ~0.12s (~8Hz).
Unfortunately, I don't get any insight about the GPIO interrupt
controller from this tweaking. I wonder if there are any other ways
to debug drivers/pinctrl/pinctrl-amd?

Thank you!


[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190

--
Best regards,
Coiby

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
