Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EE3C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 22:56:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1CF20870
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 22:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrvleR9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1CF20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 995AA86432;
	Mon,  2 Nov 2020 22:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdHRwspxjijj; Mon,  2 Nov 2020 22:56:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C34A863E1;
	Mon,  2 Nov 2020 22:56:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02F88C088B;
	Mon,  2 Nov 2020 22:56:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40E47C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 22:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28596863E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 22:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HV4OsaChT44w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 22:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 90FA6863E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 22:56:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so7590634plq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 14:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mqtRZlps0AFmnBWQDARp0gqOgumZWJt5mfGSNnjHUrY=;
 b=UrvleR9G1FY4b/8at7PjPV2ZzEJuvq7ugpvcb5Kx/n+ex3K8ZZbcMZUGPPe1nJqv3E
 Y2C8ChnGcnXiq63maAq0LSfpwmPtwB1i4hhVma1u1d37pExYBg0Zbhz3AHtK4+gca5YE
 fyFJh6metsiqVPmB65FXXP5n0Pc+/hyxYUHnE5YaydaHdWwksZMX48C5bhKNCJv3opPF
 dG5k7FQUKPXdfksVOZC2VtzqfibPNZKhksoyChHBgcc1/MrMIsQoSf7cDH0H5w7ZeUNA
 HGal4P4Ymgo//O9UocQ6jHSFh6BIT/UrAtbxKastAx3DQqqT4kMLt3aw9asfX1APdnop
 JEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mqtRZlps0AFmnBWQDARp0gqOgumZWJt5mfGSNnjHUrY=;
 b=N+lermAP2IT/96tBJYLOaHelw4/2hF75uzBBQD3ULMuAJXiba7ci5iQFZgUVoosNOk
 9e6kZJL+4lL49k4WkGQn5F9lBukCL05J/UUDAcn0BuQCTRMmZLxkeG8jbLTd78ij5tgA
 fBRx7KTye/V6UVxsec/TO9H11A6eU5CC5vKBUGLnMTgl2nYfwI9K+2Q3BLaSApWY4pEd
 2aw30IaOmyfsjNoe2TPEfV6spuRvB/9LcQvUH+d+FTFTTRv/JYs3y041qlpBauYrUwvE
 +dJmyxUC+vMpBi2sN50UtuwUygyh+teRLLC/O50mJQPd0Y2vwOjYlvN9VocrslRN+ZCN
 d4RA==
X-Gm-Message-State: AOAM530y3n24c2zbh3jTI176fJuSfq9qFRp5kWZXMWChBwb55ToPL2gE
 Qvmb/aMzv6b08huZl7I7SVw=
X-Google-Smtp-Source: ABdhPJy3aEn2fLicGiYGq5ghWFgSjIBAh5KBg2aQ7vFtXuy1V0ZG09hkx6Xap9q85jCM0WQkmD7Vvw==
X-Received: by 2002:a17:902:8605:b029:d5:a6dc:ad0a with SMTP id
 f5-20020a1709028605b02900d5a6dcad0amr23267313plo.56.1604357785123; 
 Mon, 02 Nov 2020 14:56:25 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id q125sm15292114pfq.120.2020.11.02.14.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 14:56:24 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 3 Nov 2020 06:56:00 +0800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20201102225600.nngn7lahtonni3sk@Rk>
References: <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
 <86963e59-3661-c43c-4e08-a0f9b9e7ed07@redhat.com>
 <CAHp75VcEr0AcdM2+ig5neMQn+5cfuttpFuAak7CkSO-qVjPeCw@mail.gmail.com>
 <20201030045421.si3r5zsbeeyhkwns@Rk>
 <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vej=LT06MEmoAvAxrHY7zzvPKEJLe03C3BN5X4EZos_JA@mail.gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
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

On Mon, Nov 02, 2020 at 09:06:23PM +0200, Andy Shevchenko wrote:
>On Fri, Oct 30, 2020 at 6:54 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>> On Tue, Oct 27, 2020 at 06:09:49PM +0200, Andy Shevchenko wrote:
>> >On Tue, Oct 27, 2020 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> >> On 10/27/20 4:13 PM, Andy Shevchenko wrote:
>
>...
>
>> >> I see, so then the right thing to do for the bug which we are seeing
>> >> on some AMD platforms would be to honor the debounce setting I guess ?
>> >>
>> >> Can you and/or Mika write a patch(set) for this ?
>> >
>> >I will look at it, but meanwhile I would postpone until having a
>> >Mika's Ack on the action that my understanding and course of actions
>> >is correct.
>
>I will soon send a support patch against ACPI GPIO library code.
>
>> If you don't mind, let me write this patch(set) instead:)
>
>I leave to you whatever AMD code. It will suit our both interests :-)

Excellent! Thank you!
>
>> I feel itchy
>> to fix this touchpad issue by myself after spending about a month of
>> my internship at Linux Foundation investigating this touchpad issue.
>> There are many enthusiastic Linux users waiting to get their touchpads
>> fixed and I could prioritize this task since I don't have other
>> obligations. I have provided a fallback solution [1] to save their
>> touchpads but it seems patches on gpiolib-acpi.c and pinctrl-amd could
>> reach mainline kernel much earlier.
>>
>> [1] https://lore.kernel.org/patchwork/patch/1323245/
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
