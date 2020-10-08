Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF8C04EBE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:40:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F843221FC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 16:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoddpZF+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F843221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C79D486C3A;
	Thu,  8 Oct 2020 16:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ue3H6eQwaGcQ; Thu,  8 Oct 2020 16:40:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D0F7386B47;
	Thu,  8 Oct 2020 16:40:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2BDAC07FF;
	Thu,  8 Oct 2020 16:40:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77C14C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F10486FA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0LCACYSye9T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C157786E4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 16:40:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g9so4767745pgh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V9TRh62h9HdQNNSNYLmhb1iwaCtZPdrpFvSLIPnpgFw=;
 b=IoddpZF+Q0v3oM/wI9Y5nlRoM3cRCP4LzVs8LMws6td7xCM/bmGl6HW0vQoTuPYVUV
 5pS4cbjlfLDHMsiXG1AjB1/z8J1P6UNoPtoSJjHYtJXAi/4ict91aNhethEJoOGvELYw
 IJX5+ESbuPDMl978xqLF85TQh/n7WS2s3dmeL+ruHVnCFxEN6tfIYgY//SZJjUaHBpBM
 ZG25HB8cvVk0iQZCbEkmO0UCmZI7Fut06LC69JYedpetx6SWqBw72zoIv1zRMMokOzoY
 WeoKd/0SpB8iPibcsP6PUrObMDWc7d16+XXrpevfAIW5FcYzO1R7EYZkbkK0hNpyjSth
 K+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V9TRh62h9HdQNNSNYLmhb1iwaCtZPdrpFvSLIPnpgFw=;
 b=c0rAciCygbLoR2YpO3iOike3glLB5zrbzS0a5Vhu9yXbaKFwNAnC6hFn1SID3n/wn1
 gG+2ndNa2ZE23WeJKPou2y4CavIgpXwIvBFLJOiOiZRxnYkN83TVIZlgUzi+8QnzAroa
 26RAwYB6aWJlC/3skvR7aA91IMBflK+jfqOsCe1MYxVNG7aZ0bbhGExJsj6qVDYzXcw+
 eg/cdhW41jxu7hNkCG7bt5Bo9i6YZcOCXNnF6A1GqeAUCA2xB4jQCrP+WK6ZhZiAwh4Y
 48ZAA4EaOrdtZfLXj35P2FB7NuWRs61Sj2YvZ2L0gcsOl73c3dSTrFBsZcw0Ktr2Zif2
 Cm9A==
X-Gm-Message-State: AOAM532sqCgASIBiXhxJiL1NOeG92XothRsLu1p0P10GPX0o7lNpGBgx
 E2JJSJmV0BoLRpeyeE9be5Y=
X-Google-Smtp-Source: ABdhPJw9/0x/HeWz/GXCP3piILInsg/8yRIxMsaiiwccSlixm+/51iy0TeVixCWYUGJv953oLfFC8w==
X-Received: by 2002:a17:90b:490:: with SMTP id
 bh16mr8898736pjb.214.1602175249409; 
 Thu, 08 Oct 2020 09:40:49 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id g129sm7952703pfb.9.2020.10.08.09.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:40:48 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 9 Oct 2020 00:40:41 +0800
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20201008164041.7nidwia2jzfgrcon@Rk>
References: <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk>
 <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 wang jun <availa@outlook.com>, Hans de Goede <hdegoede@redhat.com>,
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

On Tue, Oct 06, 2020 at 11:16:50AM +0200, Linus Walleij wrote:
>On Tue, Oct 6, 2020 at 10:32 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
>> Disabling the glitch filter works like a charm! Other enthusiastic
>> Linux users who have been troubled by this issue for months would
>> also feel great to know this small tweaking could bring their
>> touchpad back to life:) Thank you!
>
>Oh you found the bug :D
>

The credit should goes to Hans. Thanks to his expertise, only
one shot (disabling glitch filter) is needed. Thank you for
introducing him to me:)

>> $ git diff
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index 9a760f5cd7ed..e786d779d6c8 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>                  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>                  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>                  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>> +               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>>                  irq_set_handler_locked(d, handle_level_irq);
>>                  break;
>>
>> I will learn more about the glitch filter and the implementation of
>> pinctrl and see if I can disable glitch filter only for this touchpad.
>
>Yes we certainly need a quirk for this of some kind, examine the ACPI
>quirk infrastructure in drivers/gpio/gpiolib-acpi.c to see if you can use
>that to handle this.
>

Thank you for pointing out where I should look at! A quirk is the only
foolproof way before we confirm the other two suggestions given by Hans.

>Yours,
>Linus Walleij

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
