Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E94C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 20:58:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7453D20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 20:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3JSbbiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7453D20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4DAB120459;
	Thu,  1 Oct 2020 20:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzE9opZrO3X7; Thu,  1 Oct 2020 20:58:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8E9CF2035D;
	Thu,  1 Oct 2020 20:58:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 720DCC0889;
	Thu,  1 Oct 2020 20:58:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3A32C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 20:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9CA8787302
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8wWhe19Bfa3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 20:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8F4C88731B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 20:57:54 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q8so288882lfb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yJpxvYn1IrtmCi0NVGi17cbaBYZa6Ea+eC4qwV9pROE=;
 b=N3JSbbiWBYA3ciB7pXH8DzIrSgsk6SxtanyGwVCJxGhIJJDG0xOMEs/YgrlucdOMER
 xse64H7PwRCg7yscuPhXLvqM6RNcqE+tCMPuJW3iCMZH0fXysWHVrc3SoLB9UCjvhzy8
 6h00ttaiFCrUoJqVqD7X3CbcpFAmB5gHSl8+XmlgUGHv0zRmbA13jvzP4vOeydQwcEck
 mKMHpBpwTmde5De0BPo++tU2QEZQqTXXyjo0u3cfLQN/nEPrnKN4gdx73OdojtleSEdW
 Ys6RTdtRMNECoNu0Js41FPAOhexQn5yFxOcbdVXzKDk3Zqy/4uW17zanyoSnOQfcFvRW
 ABqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yJpxvYn1IrtmCi0NVGi17cbaBYZa6Ea+eC4qwV9pROE=;
 b=cMIB/Ako/3GQM9ZvwjUoRSfHk0VZ4n3DLAmPmndnkJqPFvTtrnN5AqRUduGdVhfk1a
 RUKkX7e5zKFwjKhPlnrJ4vNAYv9ds4jZmgoj8pFOV/nA/6i+KlzA43VY1WUpLNbH6ka+
 NndEQ9Ay74h9iMDllmuzmE92gq3qZZfpXBYns8KpaNvYuBelurVW+WpQMfZ5xaEYTwnl
 jawgcaOoS4hd3uwQWdsB399AMSR8HKPJ0kb+AVD4sG+8nVAFaETj0tZuLIzkl3Meelyg
 ZuHCL1g6wwIig1LsIS71X1n7m71pgylA0gt3wisT7f6lRAzB5XiOLwF+mAJB2nnJLIQt
 pQrg==
X-Gm-Message-State: AOAM531jSiI3hDTsZTAKw1vQP+xn6lqlBM9Q5XIQXAoPU+lnYqlEY7uh
 UDei7G8Lvvk5u6/VcHZnHX0eEaY7RZ2dlDRjZlD1oQ==
X-Google-Smtp-Source: ABdhPJySA1o73ty3X+zuWJhNuGrt5ymHqSEkGbgQV6agFl/KAS6qzyCLKZdzl62L/zDnrErHfaG7dXyaLRpBpHzp/jQ=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr3057711lfg.441.1601585872623; 
 Thu, 01 Oct 2020 13:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201001132258.6yzosj2w7k4eod42@Rk>
In-Reply-To: <20201001132258.6yzosj2w7k4eod42@Rk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Oct 2020 22:57:40 +0200
Message-ID: <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
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

Sorry for top posting, but I want to page some people.

I do not know anything about ACPI, but Hans de Goede is really
good with this kind of things and could possibly provide some
insight.

Yours,
Linus Walleij

On Thu, Oct 1, 2020 at 3:23 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi,
>
> I'm trying to fix broken touchpads [1] for a new laptop model Legion-5
> 15ARH05 which is shipped with two different touchpads, i.e., ElAN and
> Synaptics. For the ELAN touchpad, the kernel receives no interrupts to
> be informed of new data from the touchpad. For the Synaptics touchpad,
> only 7 interrupts are received per second which makes the touchpad
> completely unusable. Based on current observations, pinctrl-amd seems to
> be the most suspicious cause.
>
>
> Why do I think pinctrl-amd smells the most suspicious?
> ======================================================
>
> This laptop model has the following hardware configurations specified
> via ACPI,
>   - The touchpad's data interrupt line is connected to pin#130 of a GPIO
>     chip
>
>          GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>                          "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>                          )
>                          {   // Pin list
>                              0x0082
>                          }
>
>   - This GPIO chip (HID: AMDI0030) which is assigned with IRQ#7 has its
>     common interrupt output line connected to one IO-APIC's pin#7
>
>          Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>          {
>              0x00000007,
>          }
>
> I add some code to kernel to poll the status of the GPIO chip's pin#130
> and IO-APIc's pin#7 every 1ms when I move my finger on the surface of
> the Synaptics touchpad continuously for about 1s. During the process of I
> move my finger, most of the time,
>   - GPIO chip's pin#130: low input, interrupt unmasked
>   - IO-APIC's pin#7: IRR=0, interrupt unmasked (in fact mask/unmask_ioapic_irq
>     have never been called by the IRQ follow controller handle_fasteoi_irq)
>
> So the touchpad has been generating interrupts most of the time while
> IO-APIC controller hasn't been masking the interrupt from the GPIO chip.
> But somehow the kernel could only get ~7 interrupts each second while
> the touchpad could generate 140 interrupts (time resolution of 7.2ms)
> per second. Assuming IO-APIC (arch/x86/kernel/apic/io_apic.c) is fine,
> then there's something wrong with the GPIO interrupt controller which
> works fine for the touchpad under Windows. Besides if I poll the touchpad
> data based on pin#130's status, the touchpad could also work under
> Windows.
>
> Ways to debug pinctrl-amd
> =========================
>
> I can't find any documentation about the AMDI0030 GPIO chip except for
> the commit logs of drivers/pinctrl/pinctrl-amd. One commit
> ba714a9c1dea85e0bf2899d02dfeb9c70040427c ("pinctrl/amd: Use regular interrupt instead of chained")
> inspired me to bring back chained interrupt to see if "an interrupt storm"
> would happen. The only change I noticed is that the interrupts arrive in
> pairs. The time internal between two interrupts in a pair is ~0.0016s
> but the time internal between interrupt pairs is still ~0.12s (~8Hz).
> Unfortunately, I don't get any insight about the GPIO interrupt
> controller from this tweaking. I wonder if there are any other ways
> to debug drivers/pinctrl/pinctrl-amd?
>
> Thank you!
>
>
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>
> --
> Best regards,
> Coiby
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
