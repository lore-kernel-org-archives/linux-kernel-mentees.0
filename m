Return-Path: <SRS0=VDQn=3C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B93BC33CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 18:23:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4456C2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 18:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3m860U9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4456C2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 10A842046D;
	Mon, 13 Jan 2020 18:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ol+DZuX9E7ut; Mon, 13 Jan 2020 18:23:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 77B68203CE;
	Mon, 13 Jan 2020 18:23:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D5EEC18DD;
	Mon, 13 Jan 2020 18:23:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2E6DC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AE6632046D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IEuGe5ag5eQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:23:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id E6E8B203CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:23:08 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 21so9437850qky.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YmmSvyn5Ka4mUit6kvopVG0e++A9vopcwQJc+Ac8cPw=;
 b=g3m860U9KBcklp4Vfp3dHNeOazKl1B5xu7fRIlJZWuhUQz0Cx4K17MuU1Fz+04I6GK
 f2gKden77W05LeVTFtP/oKlhs+VjKw+BPwbC0lMAKVp5l9VPICVLujTcx7KqtAWxIm5r
 jpJSMfnCwUdE7zfsmhrLwQI1sF27RKuKhMgVnERPMI9ASwcqNJ8FmfGeGPQk/Ioh4Vas
 Ju+b9MohiFDL6WYYs3tECijiFTJbJc9MS/F3mMveT9fzC5k966lxdZ/V5/7/6wG3vr8w
 4SKGcNOfRDCDnAlL75BhVkUi6eH9pX82JMfZkget/d5O/qFBYPs1G9bs2lwnNgjnaPwl
 xClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YmmSvyn5Ka4mUit6kvopVG0e++A9vopcwQJc+Ac8cPw=;
 b=b1hfy+BHfS+Rl8ZOiCTu/4/8NsSvEJ/DTWt91nMuafuY+jNM6xj2nGh2K9G51zSAfh
 zRX3L9vG20MyZAa/kIkbF79ncAF0p7pKUsdllNFxdHuiihrajZyuFkofICGxwR0F7Xu5
 yMjJiBq170dYT2ZpjwVvmDezcsihiBedVc6/5wXyGmxTGiCXfOhibOPZ+7rrSm67U3FV
 ZsBpIpRbDOmJtCEaoJUmueikdpum2WWFfvtaOhiVXYJhq1TiicMnodtO5i6YPd+Sb2TT
 5hLqKLgVoOLCd/7Ldedq7jnaSakP3rai6rMLfTpAOUtCc9+PuvQtIAtPCT67ZOphNcKr
 9TAA==
X-Gm-Message-State: APjAAAX1nBoUhoX37LND5SRndhi4Ehn/RqdLLYrJg0Kex+7vemnIhbSj
 05Jbx2ilRH6k7hz2AWd5xVZ8QI0Mqzc=
X-Google-Smtp-Source: APXvYqzpHpCANvGcMQtO+BCaZNdbqhnWjfbggggFs7EUVOZ3FcLytDzEYS3jnGLSYEpcYWgZynigQg==
X-Received: by 2002:a37:e210:: with SMTP id g16mr17483419qki.413.1578939787671; 
 Mon, 13 Jan 2020 10:23:07 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w25sm6098136qts.91.2020.01.13.10.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 10:23:07 -0800 (PST)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
 <20200110073024.GA156006@kroah.com>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
Date: Mon, 13 Jan 2020 15:23:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200110073024.GA156006@kroah.com>
Content-Language: en-US
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media: dvb_dummy_tuner:
	implement driver skeleton
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

Hi Greg,

I am working on v3. Would you mind clarifying this?


>> + *
>> + * The virtual DVB test driver serves as a reference DVB driver and helps
>> + * validate the existing APIs in the media subsystem. It can also aid developers
>> + * working on userspace applications.
>> + *
>> + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
>> + * ISDB-T and ATSC when completed.
>> + *
>> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> Normally this is the first comment line above in this block.
>

Just so we're clear, do you mean this? e.g.:

+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid developers
+ * working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
+ * ISDB-T and ATSC when completed.
+ *


> Not the same license as your .c file?  Odd :(

Oops! :(


> If you keep this file, same comments as above for the comment block, but
> really, you don't need this .h file at all, just drop it.

OK.


- Daniel


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
