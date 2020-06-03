Return-Path: <SRS0=6U4U=7Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Jun 2020 17:19:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD54720674
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Jun 2020 17:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdX+JwtT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD54720674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9ED4D86C15;
	Wed,  3 Jun 2020 17:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvC29vmm-J4t; Wed,  3 Jun 2020 17:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 45D8A86A2B;
	Wed,  3 Jun 2020 17:19:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38AD9C0888;
	Wed,  3 Jun 2020 17:19:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCC77C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B05D6816D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 17:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrblxpW47+Vq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 17:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A0B68647A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jun 2020 17:19:19 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z1so2726303qtn.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Jun 2020 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=c3PA6afDzT37PULo8XPopHFW72TeaOHGUdh70JjkqiQ=;
 b=sdX+JwtTOcSHDVPHCkMe3RL2Avi5w5XjmGvJTDmBiuSiH/lVHfjf06rb/McSeB2f1y
 6n0wM9n93BczgqRcmt4tjBHKbNOJr/w6dU91qnY8TUo2+EJTzWlauPLMwCS3Q0fnq71u
 br5f7+wBAnq6Ry84pbxwpMKmrb0AatZQijY+yvLGQ0Bjj8YUmayw9mgsBiWwLYPgqE2C
 Rzh041ULMdM5eoEQCUW0xdslGONs74PEPTLu2BZG2GScWoaOuPffn8TZqxBF9yhG/R0W
 NJYaKHhG4gTs34oPNKj8GjMJPSJNoh8iSCc7zCn71dpURbCfLY0OhYQHXvVDEQgV0S9e
 I31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=c3PA6afDzT37PULo8XPopHFW72TeaOHGUdh70JjkqiQ=;
 b=TNWQEqeO97UKlNW7ndi5CIwkuT+lylOXPd18Xebozek9W2SE0fiRpiYaH39ZSuXi1m
 VR5pdlDI+i716c/UtSmlozB5kdc/pWCLkkXFnColQxhes46OEhyyx7F6ldoDZc3mT6zI
 dqaK9U5jku11ombVV7AlIWMrDc1OspdyiEArqoIhn9/rB8Ym0Gq+QBwElyVToVANG5mt
 hBJuV8QtNCjqZNBStn4yDHl2N9AhU0MgUnvrBwTEj6ohzhh4UByR8R6z3yT0kU3peC0D
 YFhSQmaN83K79hBdDltOEM2ZX7AU48FfllCYbFKN4MMX7fBf8OQlEZjGSTbzs0ZySpF7
 +o7w==
X-Gm-Message-State: AOAM532EjHdp2K5T3fduuxHRzcyC9nIDJ5SKklDIPm7Y6Sw3fD3IZiBU
 2iJHTMlp5ARc28Lcynqoc6k=
X-Google-Smtp-Source: ABdhPJx/268/0e/0dxYlk5ju8LFOP+rpnP7Zq32iFPqUjNzVKdGOt7cuVBFRIvNO0CVYSpgbyp8jFA==
X-Received: by 2002:ac8:450a:: with SMTP id q10mr358265qtn.328.1591204757842; 
 Wed, 03 Jun 2020 10:19:17 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u205sm2019632qka.81.2020.06.03.10.19.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 10:19:17 -0700 (PDT)
Date: Wed, 3 Jun 2020 14:19:12 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3273ABE6-71E6-4FCE-9901-E02A87B3F48F@getmailspring.com>
In-Reply-To: <deb6b49a-5f50-1d40-6577-84fe787150ec@linuxfoundation.org>
References: <deb6b49a-5f50-1d40-6577-84fe787150ec@linuxfoundation.org>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?kstewart=40linuxfoundation.org?="
 <kstewart@linuxfoundation.org>, "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
 "=?utf-8?Q?mchehab+huawei=40kernel.org?=" <mchehab+huawei@kernel.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v6 02/10] media: vidtv: implement a tuner driver
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

Hi Shuah, thanks for reviewing this!

>> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Are you using git send-email to send patches. Why do have this
> From line in here? Same comment on all other patches in this series.

I am using 'git format-patch --to=[...] --cc=[...]' and then 'git send-email'.

Git format-patch usually adds these two lines for every patch it generates:
  1 From f966b0ea574a36b96ddfb8a8a716b174bc150eba Mon Sep 17 00:00:00 2001
  2 From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

I have no idea whether these are necessary, so I just leave them there :)
The first line is specially weird.


As for this:

>> +	switch (c->delivery_system) {
> 
> Add indetation for the below:
> 
>> +	case SYS_DVBT:
>> +	case SYS_DVBT2:
>> +		valid_freqs = config.vidtv_valid_dvb_t_freqs;
>> +		array_sz    = ARRAY_SIZE(config.vidtv_valid_dvb_t_freqs);
>> +		break;

I am not sure I understand. Indenting the case statements leads to a
checkpatch complaint: 

>SWITCH_CASE_INDENT_LEVEL: switch and case should be at the
>same indent

And the actual statements under 'case' are already indented.

Thanks
- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
