Return-Path: <SRS0=3RFK=ZW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE1C43215
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 05:05:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EAF207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 05:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOidwmBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EAF207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9F9486C8D;
	Sat, 30 Nov 2019 05:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VsBLSnhcj29U; Sat, 30 Nov 2019 05:05:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62A5686AFB;
	Sat, 30 Nov 2019 05:05:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EC66C1DD5;
	Sat, 30 Nov 2019 05:05:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FB00C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8636886C8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjimdx-bbBeH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:05:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F17E486AFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:05:54 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id d124so12228148qke.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 21:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Do2B9jmWha/bcrRzWjITtxu2d5yYxoA4WCpoK6RtSa8=;
 b=IOidwmBSl2SbB0Szc6pVQ1hRHfq5gYJXQCUbmKsJCmgg/F710XP8IxQdEl/NazxUlS
 r2TUjQHmjFNaME7rCTN0DPdvp1oQ8rPppICbHAg3WGC6CX8t/AtYMQYzwvjhSvH3R4jR
 uZo+n8vMuXn/1JPGywxw5kciB74Q9JtePfYxz+YqtikuYdA35qh08GWlMNh1r/yb91GH
 Uya/+/usS+jP2KRWJZVAmqel32lzZs9FyZP/Iwe2qt9XAcx53gMx/0ejl725kqykbF/u
 vjSSAyZAIzQJ6hrTDMJOcGehdNjhixEPOUTtTrHK3LJPySxJdGXblBz4itDqB3AqCZoS
 AeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Do2B9jmWha/bcrRzWjITtxu2d5yYxoA4WCpoK6RtSa8=;
 b=Ys0F6LI9xYQ8WJ5Tbj5wY0+yuVk3hneUg1L06cJ/nYcEqUzuQwXd51oBx9iQ42kPBu
 ZfUsFdsNWmonDaN2wdIiZtFAkRe1bhPKzicHjdys41KY6/W0JPwUnkh8flzQbtUPGxs0
 RNPWGSNML2hJWKZn55ZJqzxzrYU9jjkdwezN5ipTfG6IK/dIkgMIv49y50UQ3tycc+C0
 qsL38aPwqnWSpWfpXpjXSBf5F0VHnuv3iYtwo22zNhJDCWpf86hi/xxv3YuBIJTX7kT7
 ztEBI9HL/Xl5r5fRkpZ9tWTyQB66G5xKnczLZZlc8qpXsQiRB4gkLmDGOxyeGW9h9YHo
 vBiw==
X-Gm-Message-State: APjAAAUyutUz32Uo/JHNYy0ENUpr2Inm3CqAfxMX6O1FI2ZlwvA8HRjZ
 WWB/NVOGBogutc9MnRPGdxI=
X-Google-Smtp-Source: APXvYqx82AHLwYTgOhEPpRdIU8/HQVpv/h+gzSO42GuNeCO5QGFqXtZZlHYAUxRHkYh0yc+G/qg0bQ==
X-Received: by 2002:a37:4841:: with SMTP id v62mr19841347qka.444.1575090353773; 
 Fri, 29 Nov 2019 21:05:53 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 62sm4814617qkm.121.2019.11.29.21.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 21:05:53 -0800 (PST)
To: Miklos Szeredi <miklos@szeredi.hu>
References: <20191120192655.33709-1-dwlsalmeida@gmail.com>
 <CAJfpegsxXJN1Z5fGzcv=+sid6gSzyD=KtA2omF2Xsx8dy00tRw@mail.gmail.com>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <d7bc2ab8-c1b5-85fb-6de3-c9c939d2e678@gmail.com>
Date: Sat, 30 Nov 2019 01:58:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJfpegsxXJN1Z5fGzcv=+sid6gSzyD=KtA2omF2Xsx8dy00tRw@mail.gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert fuse to RST
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

Hey Miklos, thank you for taking the time to review my work!


I can send v3 and put the doc back where it was. How about the 
conversion itself, is it OK to you?


Thanks,

Daniel.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
