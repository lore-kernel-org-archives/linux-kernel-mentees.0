Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991E5C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 23:51:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CB02077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 23:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tb+WHFX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CB02077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1524E86E49;
	Thu,  9 Jan 2020 23:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRb81wjU-MLY; Thu,  9 Jan 2020 23:51:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8584B86DF3;
	Thu,  9 Jan 2020 23:51:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C0DEC1796;
	Thu,  9 Jan 2020 23:51:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07AC9C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 23:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EAE2186DF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 23:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45SUgUk7ySBh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 23:51:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2EF7786E1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 23:51:02 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id v3so82071ioj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XmSLE2UFRfRMrqOUD2/xcSkD1bd36np80kHR612bvjA=;
 b=Tb+WHFX8eVVfPBC61iOxKAVASqGYU9JQWNVjQrlKLC+NAZ0qiXroclVl84ojhXiFVq
 z0D/fXSrR06QaET9gf62ySqcq2NGTVRTlyzYZ+Kwhb1CbYyYmIAoczVX8P/rIOhtSSe+
 9Vp8kh/Kw1Ujt3pz8MG6SMP+kwtFqpkD9LlLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmSLE2UFRfRMrqOUD2/xcSkD1bd36np80kHR612bvjA=;
 b=JVCbWXYqZxvP7yycdXw86ow82qMdiNFgvzS2MX29MBgXX2EhLVkj+FzpW43LGH2PKK
 TIUQOMbYj5FEqtrGWooROfxPW8eIksDq/nqUVJSYMgnZOin4rKrJvGh43HA2dNFGyqgU
 l5WvIad23a7ierK+Vl2gEKpWevjqnE/1SwPsxqt8NyS0G+ZvTXACQoqjTDuL2NMM971z
 pKUTGtGaCcKmYQVjk08zKQHwA9IiLIiQkRTBfscb9FWE6c4nT1wfy5Aq7TVBRmoLPd2R
 8dYWcbNxJ79ociIl1lzjIA99NKziYRgRa15uqYXSzYHxdB55YKL7RXkk51xXjzplDaMj
 +v9w==
X-Gm-Message-State: APjAAAUmeypiHa9AAYigjwy8W/QwK07AzOeMXWlT/O9bZb9l7UgSUUIg
 20NGQv6uiqJYF6s12sXhL+QvIrIM
X-Google-Smtp-Source: APXvYqwQgkVIojpGrUKkXmQA4w8X/Zv+cpiI22CrfDWtEkvUmq5+SH0J8qNsc8FDqyGlkG6ReZ13cQ==
X-Received: by 2002:a6b:7117:: with SMTP id q23mr62004iog.153.1578613861421;
 Thu, 09 Jan 2020 15:51:01 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id u10sm130038ilq.1.2020.01.09.15.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 15:51:00 -0800 (PST)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org,
 sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <74d3acbc-fa3c-7d5b-4132-42c47909c4b9@linuxfoundation.org>
Date: Thu, 9 Jan 2020 16:50:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109233757.734008-1-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

On 1/9/20 4:37 PM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 

> Implement a dummy DVB tuner as part of ongoing work
> on a virtual DVB test driver under the 2020 Spring Linux
> Kernel Mentorship Program.
> 

Get rid of the above. Not relevant for the patch. No need to spin
v3 just for this change and you can make the with other changes
as you get comments from others.

> The virtual DVB test driver serves as a reference DVB driver and helps
> validate the existing APIs in the media subsystem. It can also aid developers
>   working on userspace applications.
> 
> This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> ISDB-T and ATSC when completed.
> 
> For now, only a basic skeleton is available, most functions do nothing
> whatsoever.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
