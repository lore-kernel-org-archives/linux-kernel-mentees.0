Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C5FC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 04:59:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54ECA221F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 04:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7qNnGev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54ECA221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2AAC863E0;
	Fri, 30 Oct 2020 04:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_dAX--NvvOn; Fri, 30 Oct 2020 04:59:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9186285A37;
	Fri, 30 Oct 2020 04:59:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 812D2C0859;
	Fri, 30 Oct 2020 04:59:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93E86C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E27F20396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGncQ5eaRa-e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:59:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by silver.osuosl.org (Postfix) with ESMTPS id 861772037B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:59:03 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id h6so4203561pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 21:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OT/E1UmEcZKYphJk5pz+xdil9P/tggfLbV4uIxXmL3g=;
 b=K7qNnGev0ev1hlrMJD+dBlHuS31+Qll13RHDCMS/5ZwYWTLuLfnxxDrv00KVRDnpqK
 z76cEkzqPWYrD0fjIZsl8rwhxMQ3vwl9tpyFdUiQ3ZD4sY2xaQmzuw7lLEBiH4Zg6KMH
 KE0tV1aud6r0ISrUccs7DdT9OM154HPoqTk/BvfESpvcnU9Kc02T7op90fdQAElFO4y/
 XnanwZAPsk4SvOLmlertQKLgtiah8W4rDFG+kOXiaUVryxA+NwKz4KEtTsbsboPs/Wq9
 BKR7Yigqt+tG8kJRvJSz78gnuW6v8z3QKVW+I9J3dNUuUy51XIzKYCeTItsCqyjkGa2X
 ukQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OT/E1UmEcZKYphJk5pz+xdil9P/tggfLbV4uIxXmL3g=;
 b=sOI6X5e+Dnp0xh72Bwa8zZisRkipH4X38Gc6Tc5UGI3YleQtFQfOQQqV+0OevceEuT
 eqlKwQrYuPXGhllGigkHfx+XHEaVuyP66J37x+5HFPgF3DRH+wPQTwr6vz9BP2bhSk/0
 jeNbb3FfsKy7BteH/YAroUMCLC1R0xX5QcCzfsvMSWs7aHPb8KKEliKlHSjVnuRggs5v
 Oy122b17tubgz55i+Qp+QRo1Ez8mMCTlDzJmGqHa6hqBA/K5z3yQqJeeqiF2YeZv0luN
 VDk/avYwRTU7+h31776p039o1xf3J1jMIcbDv30Iku+LULTF95tKaDu9SVp60zIQk+e7
 FMsw==
X-Gm-Message-State: AOAM530Z/3G+uxmQwIqAq5ln9t0y77so945HAFqlwxk2DV5vR8sQyJRK
 kcdsetD7maTWAyvI2VovgXk=
X-Google-Smtp-Source: ABdhPJxpkOUXta4+RBSDn1XAflnQtyhivdOK+wEhrWE1UkWCTK05PfqyE44KWJJwO8ks8R1VI0zz3w==
X-Received: by 2002:a62:168a:0:b029:160:193d:b278 with SMTP id
 132-20020a62168a0000b0290160193db278mr7693656pfw.48.1604033943184; 
 Thu, 29 Oct 2020 21:59:03 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id y13sm4440450pfl.166.2020.10.29.21.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 21:59:02 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 30 Oct 2020 12:58:39 +0800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20201030045839.odjzwlh46zpmqtng@Rk>
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <CAHp75VeGs6v7EKfQ30YPf8gUE+fftUP3V8HRif7P9xs1wkXcKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VeGs6v7EKfQ30YPf8gUE+fftUP3V8HRif7P9xs1wkXcKg@mail.gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, wang jun <availa@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
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

On Tue, Oct 27, 2020 at 11:52:14AM +0200, Andy Shevchenko wrote:
>On Tue, Oct 27, 2020 at 2:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi Hans and Linus,
>>
>> Will you interpret the 0x0000 value for debounce timeout in GPIO
>> Interrupt Connection Resource Descriptor as disabling debouncing
>> filter?
>>
>> GpioInt (EdgeLevel, ActiveLevel, Shared, PinConfig, DebounceTimeout, ResourceSource,
>> ResourceSourceIndex, ResourceUsage, DescriptorName, VendorData) {PinList}
>
>According to the spec
>
>DebounceTimeout is an optional argument specifying the debounce wait
>time, in hundredths of
>milliseconds. The bit field name _DBT is automatically created to
>refer to this portion of the resource
>descriptor.
>
>I interpret this as 0 == no debounce (or a minimum that hardware has
>if there is no possibility to disable).

Thanks for the explanation!
>
>> I'm not sure if Windows' implementation is the de facto standard like
>> i2c-hid. But if we are going to conform to the ACPI specs and we would
>> regard 0x0000 debounce timeout as disabling debouncing filter, then we
>> can fix this touchpad issue and potentially some related issues by
>> implementing the feature of supporting configuring debounce timeout in
>> drivers/gpio/gpiolib-acpi.c and removing all debounce filter
>> configuration in amd_gpio_irq_set_type of drivers/pinctrl/pinctrl-amd.c.
>> What do you think?
>>
>> A favorable evidence is I've collected five DSDT tables when
>> investigating this issue. All 5 DSDT tables have an GpioInt specifying
>> an non-zero debounce timeout value for the edge type irq and for all
>> the level type irq, the debounce timeout is set to 0x0000.
>
>To the future mails: please, do not top-post.
>And please remove a huge amount of unrelated lines in the reply.
>
Thank you for the suggestion!
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
