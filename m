Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018A1C2D0DC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 18:14:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7CEE206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 18:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYsxEFmS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7CEE206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9B57120456;
	Tue, 31 Dec 2019 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIkFgoyInf2M; Tue, 31 Dec 2019 18:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC20B20440;
	Tue, 31 Dec 2019 18:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D058FC1D81;
	Tue, 31 Dec 2019 18:14:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00250C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EAA0C849FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aa4Y9HTpVYbO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:14:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 568DD84806
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:14:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z124so19783746pgb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=g813j+cV+hC6rv01dsrq/G6Qcx07y9VOTfu785zP8Fc=;
 b=iYsxEFmSqc1vjKd/72A/TEAF+x9KGTV/n50r8Z1HiaUyincVLa+AmNTIMLV7pBDjjG
 a96zUvolCc1bqlBL6Om1OCT7vFPojSUrMgqcfNUTGt09SKke214YkB8l3q8SIFhUy+Ui
 Z7C/3DQF0EVQ0OCJXZG6y9/Qh/yVi+KoRNocZ/cH/IZ6XbQ0t7KwDifvLr/4+dwhUTVw
 1zORcRE/J+ZtNNG1F6rtJIeZALTHa/PuA5o3rd5DOz4Q0sSo0oGGVXaHkungyAK+GsR7
 oR0p7ZEMoxV71Jp0dE+NwUVqwwFNdfq10zJ/QXDKtJn2RP/2KZ/yrK7hIaULy+Kr5dye
 kT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g813j+cV+hC6rv01dsrq/G6Qcx07y9VOTfu785zP8Fc=;
 b=kiP/5ItRwB3aMWnUHaI5USjyFsY+kfFyoPmcq+j9SFzBv6lPhVpNoNUxrAoBxUMmKH
 Qn2jCWQC1tj1nM11QjzrDJX3mbhhTxEJHF5/t+KKMDUSZKyKHLT/fSRrZ6wa7Ss+Ot7Z
 dQGCHxef8EQKAqhzrMH082ITkuaTkptQWpfxU9KaB3Z5TAsvX38QhZK8slXpwwfiz9cj
 8wihZGeL0WInpbOTc+wLFYOGWgq9BZoAySuCf5ybNe9pFLqrofB24XEk9JBl+g4fuGck
 1rVgo3aKNhEFYJnGMfZ6NJkqScf6zFnbrMa3SfMXr7MKtt6k73Uar85b2WHF5256lSMJ
 3xlw==
X-Gm-Message-State: APjAAAXWePKp9+6jYGhkwGyr/6Yf1iu+0UQAen0K6bwRtqVCg3kDMZB9
 GRRyc8YKbbRoIMQehHSfreg=
X-Google-Smtp-Source: APXvYqxsE1BoB3cWWMLU3TaQas/JRabldExcmeLzt+Wy+EafQ+1UWtq3EfvJ7C2BsBTe/DCnTS+32A==
X-Received: by 2002:aa7:9af1:: with SMTP id y17mr78663987pfp.21.1577816049919; 
 Tue, 31 Dec 2019 10:14:09 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id b65sm54420669pgc.18.2019.12.31.10.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2019 10:14:09 -0800 (PST)
To: Sean Young <sean@mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
 <20191231100802.GE24469@gofer.mess.org>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
Date: Tue, 31 Dec 2019 15:14:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191231100802.GE24469@gofer.mess.org>
Content-Language: en-US
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/6] media: dvb_dummy_fe: Fix
	ERROR: POINTER_LOCATION
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

Hi Sean, thanks for reviewing this!


> The comments from Mauro in the previous version of this patch have not been
> addressed:
>
> https://patchwork.linuxtv.org/patch/60048/#114016
>
> Thanks,
>
> Sean

As you've also noted, I have these as separate patches, i.e.

https://patchwork.linuxtv.org/patch/60430/

https://patchwork.linuxtv.org/patch/60432/


I will squash them with this one and send v2. I will also drop this from 
the series:

https://patchwork.linuxtv.org/patch/60428/


Is this OK with you?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
