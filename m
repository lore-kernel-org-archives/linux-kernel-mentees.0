Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACF5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 04:06:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE72221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 04:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8ITrY1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE72221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86D8B8838D;
	Thu, 15 Oct 2020 04:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siul0wAumTgW; Thu, 15 Oct 2020 04:06:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CEC188389;
	Thu, 15 Oct 2020 04:06:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC97FC0052;
	Thu, 15 Oct 2020 04:06:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BDB6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 04:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 065E02E1AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 04:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqNKAArjZzpU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 04:06:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by silver.osuosl.org (Postfix) with ESMTPS id 1845D2044A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 04:06:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id w21so1168974pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 21:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7VNUQ41VUTjGSF/lh9jbtGc0lbaxqihZJsvmjhNeqSM=;
 b=n8ITrY1npeUMBSZ8xEZNn4aOPk+lozBFXOu032qqRSP5pkdeT7PTnzcf+3reRoUerI
 FbiDQOEXWjT3DNiHNLTpw0R1QBfrc/AHuekAGTLgZtCVkqeSmiP0q7p1OAWxdhUoorCT
 bpNMTio7edgvJKAOan2+eGyxvJxPFEE46c96rpNaBBNnaRU5vpebNkzd16sD+vVTxavp
 aYV0ND2/UFb3BX3E6FmwCrVCG3y7rXlAhbZ3jb/6i0asOcKjdiMHpP1pkVRUGxLyHfd0
 Q22RRT6HP9YX18UU9s/27I37tFYIctvqSqdnt3asiy8+MiDc1Al5aoyRVHhn9inKh/6o
 JjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7VNUQ41VUTjGSF/lh9jbtGc0lbaxqihZJsvmjhNeqSM=;
 b=ZP7uetCtRnef+KCeK5DvAFZv9qKGH/Xs1doGeyyFwmyKeHIqa2gLKLOVdg6Qxrmryv
 94vBsBFbS87w0hMh290vKpK0p1TA5PQrfkaEOowU54GG9T3sPlDPN6OMXawMP1HZYpk/
 2yiGPeJgB+PrJABDedVIBZZKHoyoE7Y8gexa0P5iJ0g+GeMiVkzq1Z4emTGQL/7BLgE9
 2RahDd6qLGXKVdVwFpKmVjxEqK3qkvCmdhurOQmiwlpshqVDbBkGU81x2ySQQaxO0980
 F8q+NrAhII8FkfJNKCY02Bdy0eKsCmN+tgn/g7cS2r/Zg2fZpHtjAkDgtP6e6HqVVB20
 xo3Q==
X-Gm-Message-State: AOAM530ZhGE+v/LFxG48WKA++OXI4y/4/tmwTwbhCzxuvZNWmtshLw/9
 3O+FCDq40Wf23bJB5U/6cDI=
X-Google-Smtp-Source: ABdhPJwpKLJQs85MajhbI5E2rjujlgxt21EBrnSqJUiqNxmeWrawLZii+mg67Woj77obRqmtKqrBgw==
X-Received: by 2002:a63:140e:: with SMTP id u14mr1716301pgl.91.1602734813534; 
 Wed, 14 Oct 2020 21:06:53 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id s23sm1134880pgl.47.2020.10.14.21.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 21:06:52 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 15 Oct 2020 12:06:29 +0800
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20201015040629.ycv5nc7vit6wcynu@Rk>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Oct 14, 2020 at 01:46:14PM +0200, Hans de Goede wrote:
>Hi,
>
[...]
>
>I've never seen this kinda glitch/debounce filter where
>you can filter out only one type of level before, so
>I wonder if the code maybe simply got it wrong, also for
>a level type irq I really see no objection to just
>use DB_TYPE_REMOVE_GLITCH instead of the weird "half"
>filters.
>
>So I just ran a git blame and the DB_TYPE_PRESERVE_HIGH_GLITCH
>has been there from the very first commit of this driver,
>I wonder if it has been wrong all this time and should be
>inverted (so DB_TYPE_PRESERVE_LOW_GLITCH instead).
>
>I think we may want to just play it safe though and simply
>switch to DB_TYPE_REMOVE_GLITCH as we already do for all
>edge types and when amd_gpio_set_config() gets called!
>
>Linus, what do you think about just switching to
>DB_TYPE_REMOVE_GLITCH for level type irqs (unifying them
>with all the other modes) and not mucking with this weird,
>undocumented "half" filter modes ?
>
>>Or can you point to some references? I've gain some
>>experience about how to configure the GPIO controller by studying the
>>code of pinctrl-amd and pinctrl-baytrail (I can't find the hardware
>>reference manual for baytrail either). I also tweaked the configuration
>>in pinctrl-amd, for example, setting the debounce timeout to 976 usec
>>and 3.9 msec without disabling the glitch filter could also save the
>>touchpad. But I need some knowledge to understand why this touchpad [1]
>>which also uses the buggy pinctrl-amd isn't affected.
>>
>>[1] https://github.com/Syniurge/i2c-amd-mp2/issues/11#issuecomment-707427095
>
>My guess would be that it uses edge types interrupts instead ?
>I have seen that quite a few times, even though it is weird
>to do that for i2c devices.
>
Actually it uses the level type interrupt according to the shared
DSDT.dsl,

         Device (TPDA)
         {
             Name (_HID, "SYNA2B3F")  // _HID: Hardware ID
             Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
             Name (_UID, 0x08)  // _UID: Unique ID
             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
             {
                 Name (RBUF, ResourceTemplate ()
                 {
                     I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                         AddressingMode7Bit, "\\_SB.I2CD",
                         0x00, ResourceConsumer, , Exclusive,
                         )
                     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0003
                         }
                 })
                 Return (RBUF) /* \_SB_.I2CD.TPDA._CRS.RBUF */
             }

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
