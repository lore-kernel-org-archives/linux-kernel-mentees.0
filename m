Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B61C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 17:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B0CB401E1;
	Mon, 30 Oct 2023 17:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0CB401E1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZBPqrhOR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iyhQDLlyr9xf; Mon, 30 Oct 2023 17:36:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC719401CC;
	Mon, 30 Oct 2023 17:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC719401CC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDAE8C0071;
	Mon, 30 Oct 2023 17:36:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39531C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E6F660A6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E6F660A6B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZBPqrhOR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW9la8v7mbJ4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:36:46 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE0BB60812
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 17:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0BB60812
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc4d306fe9so2456005ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698687405; x=1699292205;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1r4Sk8mM752UlAqTKeehpaUyB9IeVemNOy9Th+/NVU=;
 b=ZBPqrhORwdrosYPeEuJaPV4vwSyA4x5TzX1oi4X2hvsKXL27i00GGAQ4A1jbFu1Q7X
 7hh95lmhHml46iIyEPRW3v01LcP+NITEp9odzNunPKl2k0NqEC/uTobxm3qTsMZpzTjP
 VblXJ3g3NQPKqru1TYDTNmMJEU1NzoiUY3SCgdpyNsvWd+ZVLI9ZN2wrdIJTKm0yJ0mZ
 zM0vjkiZ768xrLehHoPTpPHEPNtmPt9Z4MSsQA359Q15aCMr/T6NmaUEHzxkrJ30QIyx
 dsZySsfhZp8vZuURYWLTU0+9QfRGMxi5azFC/iDvAEXlMoBjruSehnNseIhouUn9x2zJ
 xtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687405; x=1699292205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+1r4Sk8mM752UlAqTKeehpaUyB9IeVemNOy9Th+/NVU=;
 b=Z5PEhGjpQ/TnjOvjBvLEkMY8K3Nglzc3BV3Ka73wR9glwMoR5DuSC4KylaAJccRvc+
 2m7h5YitFC7FeWBa8iR+vdbyXq1EPTpvwPIUXiTWWsFox3mOOeJEGyA2aXcYjIW/PPcw
 G9gSBt6KkdXrh68A5Q3gHoQWN3zEhYCGJIZlh4J+6iQM6EPb5HRL+fkJNl/QajDjW0xy
 xibJF6zKx88S5NVVbQF+FupF/Kwt4fbTiGnf8A4lGqmBp0SP5uY43+w0spdB8AKPoou1
 YJtgMQeOc+q+vEoLg88lil8Svwi5KcUVsm5VtlCxhxYhlJ0fJjwsM5OwKLWHUBNh+ZQ5
 yJrQ==
X-Gm-Message-State: AOJu0Yz9ttxT0DWZgGQOb4nMAnSwckjhOaxnvaE2raqxqUWnaVHsiers
 uFrL1e0vjicJepkOuaz1npo=
X-Google-Smtp-Source: AGHT+IGgyg6TaKLNhotuA5o8+cZQH5PdN52kp121cXodu0M9i82nk3BWuXxmRGOHgLC+Tm/RaDq2xw==
X-Received: by 2002:a17:902:d1c2:b0:1cc:277f:b4f6 with SMTP id
 g2-20020a170902d1c200b001cc277fb4f6mr8469796plb.6.1698687405251; 
 Mon, 30 Oct 2023 10:36:45 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.208])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a170902e88900b001c62d63b817sm2690271plg.179.2023.10.30.10.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:36:44 -0700 (PDT)
Message-ID: <e2598cb7-d02a-4520-99da-384886e9fc4c@gmail.com>
Date: Mon, 30 Oct 2023 23:06:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixing warning cast removes address space '__iomem' of
 expression
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 Nischala Yelchuri <Nischala.Yelchuri@microsoft.com>
References: <20231024112832.737832-1-singhabhinav9051571833@gmail.com>
 <SN6PR2101MB16937C421EA9CDF373835360D7A3A@SN6PR2101MB1693.namprd21.prod.outlook.com>
 <19cec6f0-e176-4bcc-95a0-9d6eb0261ed1@gmail.com>
 <BYAPR21MB16885EA9FFD1DFD60CF2F263D7A1A@BYAPR21MB1688.namprd21.prod.outlook.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <BYAPR21MB16885EA9FFD1DFD60CF2F263D7A1A@BYAPR21MB1688.namprd21.prod.outlook.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 10/30/23 22:08, Michael Kelley (LINUX) wrote:
> From: Abhinav Singh <singhabhinav9051571833@gmail.com> Sent: Saturday, October 28, 2023 2:26 PM
>>
>>> It turns out that Nischala Yelchuri at Microsoft is
>>> concurrently working on fixing this occurrence as well as the
>>> others we know about in Hyper-V specific code.
>>
>> So should I continue or not with this patch?
>>
> 
> I'll suggest deferring to Nischala's pending patch.  Her patch
> covers all 5 occurrences.  Also, I don't know if you were able
> to test your patch in a Hyper-V Confidential VM.  She did test
> in that configuration and confirmed that nothing broke.
> 
> Of course, feel free to correspond directly with Nischala
> on how best to move forward.  I'm an unnecessary intermediary
> who is just pointing out the overlap. :-)
> 
> Michael

Okay will ask her about the patch.
Thank you for your time to review and guide me :)


Abhinav
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
