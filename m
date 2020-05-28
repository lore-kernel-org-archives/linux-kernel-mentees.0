Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7081CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 21:39:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 531BA2088E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 21:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hIVO7Owd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 531BA2088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27F4B88F8C;
	Thu, 28 May 2020 21:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwGVcsST2mOr; Thu, 28 May 2020 21:39:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BEEF388C67;
	Thu, 28 May 2020 21:39:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9A8EC07FF;
	Thu, 28 May 2020 21:39:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 330E4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 21:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E84E88F86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 21:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnh-jZX6RuW5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 21:39:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8848388C67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 21:39:51 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id x202so158464oix.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfpLvfnX8lVDByHQBLU++09A6lqwgIjSdFJ0GhgD8hk=;
 b=hIVO7OwdAzZtChKnv8phSDuayJ+63ecs/81LzyUetJxvJGcNQl0EKlode3KULfZYA0
 WbFCk1e0mN5ekoaToQEaKxEZGUTfEMc2KOLVZVyXU8zETrxdHowGewLMsHqjyA90DtP5
 g16TOAaa0Kr64Dyept/QTpXdV0rmAAYO+aw9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfpLvfnX8lVDByHQBLU++09A6lqwgIjSdFJ0GhgD8hk=;
 b=r1q2CxoBulSiKy7/NcXj+9tQIoATPFu+RjWxFq2DooDn2isgBQ+ErEFQzpTEZjmcYC
 3u5RYjr4oYyZImLscsUpphs7vaier0+HXm7ta+oeaKAhZoHslts3wQQScUpKaUjIvURR
 EGaJ+5XlHOUNg2JY11kgFLBYq5Qq1G0G07qaqxZXQsx7FbXgAIA93c8AZiKhvurWqfpY
 C/tOqY/FBWnKSX7414r2XHNyJKKwxgCSnd3HDt+gE74OXtCrvb64ZYv5TLSP4BEVU4RA
 8yW4fRcXjzbl9YhvLoZJ5j+cYsU/oJgAklCh1nwK8LUqDxhrhs2zka5E4Dl4emTLeBU1
 hGwA==
X-Gm-Message-State: AOAM531QmQnHkjAeyZ0RNTHRmJckzEGllKIwnfXXLv98x/H0VkqFRiII
 fVIZBxw1KMPXKegNp0IIHBOuA2yC
X-Google-Smtp-Source: ABdhPJx1Ja1TbtJq4hRHGE828SF8s6kg5n3Pc0HsFwOSf1AlxMilKtg9NShPCTujKWJmEAj2a/LTkg==
X-Received: by 2002:aca:53ca:: with SMTP id h193mr3676158oib.12.1590701990596; 
 Thu, 28 May 2020 14:39:50 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id g10sm1251573otn.34.2020.05.28.14.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 14:39:49 -0700 (PDT)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4df08eaa-7a96-c769-d3ef-9cf4bae77454@linuxfoundation.org>
Date: Thu, 28 May 2020 15:39:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v6 00/10] media: vidtv: implement a virtual DVB driver
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

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series is work in progress. It represents the current work done on a
> virtual DVB driver for the Linux media subsystem. I am new to the media
> subsystem and to kernel development in general.
> 
> This driver aims to:
> 	- Serve as template for new DVB driver writers
> 	- Help userspace application writers in general
> 	- Push fake audio/video to userspace for testing
> 		purposes
> 	- Push debug information to userspace via debugfs
> 
> This should currently be able to feed PSI and PCM audio data to
> userspace.
> 
> I appreciate any feedback!
> 

Run checkpatch --strict on these. There are several warns and an error
which could improve the code as well as the improving Kconfig entry
as suggested below.

WARNING: please write a paragraph that describes the config symbol fully
#108: FILE: drivers/media/test-drivers/Kconfig:7:
+menuconfig DVB_TEST_DRIVERS

I will send review comments on individual patches.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
