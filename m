Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA10C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:12:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 905092075D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ialw/PlE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 905092075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 40D8A26284;
	Mon, 13 Jul 2020 18:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nho9FXDALyu4; Mon, 13 Jul 2020 18:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F3CA323730;
	Mon, 13 Jul 2020 18:12:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5D7FC088E;
	Mon, 13 Jul 2020 18:12:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A1DAC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7662C87513
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMJ6UEfi7eVZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:12:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EEEF186FB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:12:44 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id lx13so18355620ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wX50ijN1MvREDIsGS5xeUvOvHwSnksvK2NAsbuf3LdM=;
 b=ialw/PlEbuLKxjnilT/9gcUOn1JvXuhjogH2KPopW+8zGMTyzC4cccPQ2FhBzMhUA6
 SNwjeU+EIfxwY/PQbyIFoyIJ9DrYSuGnVOG46YUkzjEVGP10RxniYxGtbY7KAyPLh8np
 3ks1NrAHC9p2laTyrUpynDLUQ4C4srYgNq4XxjIbJAa+fCZN4Wv1ABG2lIMOdRae6RxN
 6PynVm1ZogXPdCp2QG3tT+fIpL3Ev/0RATDhAdeszNZ4Qq4Vztyizti8cBNIONgkDW34
 4l7YLA2wE1qvnxOe6QCLxDJ9gfiLdQa8XUjHs3zkY+qiN6g2AZSgKbJt32PMLYH5bhK0
 1mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wX50ijN1MvREDIsGS5xeUvOvHwSnksvK2NAsbuf3LdM=;
 b=eYYT20CpIonNIs9Q7As/qOFFLAU1n5ept521QqI6gn4/XKqpeXKZQt/xRy3Iu/PPzn
 ZOCCpsz90WJSM2nJ9otYN6rUeyQYmj1BK3EaSqKRgGY3Urfr8PwQ+Jtp5ie+GkEMIdcX
 pMpxzP42+cph061zHYP2FrUj+fPeqAU6Z9QHlsUd1XifGOGGllW7J2hIspogt3ez0Lld
 V4/FAMnXMEpq8xOhlQ3Gyw3bM6RRGsEWMPFYr7LhqsYMf/1P48TVAUePFH/jD0SxjFtE
 I232SbgeFNFKnABBNvMZky+ZMsp6iISQ9EQVHF41QxN6F4pEW6qP2Ctn1bhLU7tSSBjE
 +VYw==
X-Gm-Message-State: AOAM530/WIqC5pykrJvOOkfO8UqMRHF6b7JervcNyJcA/+bHgMoy4qRE
 lBb2JoKsaebTBuBU9zJaD4I=
X-Google-Smtp-Source: ABdhPJz/75L97OnteHurSRENk3PzKuEuZsidiUh+ImYU1G4fo56ylorIqQZv+42Mr706DdN0J+VEIA==
X-Received: by 2002:a17:906:57c6:: with SMTP id
 u6mr945004ejr.194.1594663963454; 
 Mon, 13 Jul 2020 11:12:43 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id z5sm7364786ejw.114.2020.07.13.11.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 11:12:42 -0700 (PDT)
To: Larry Finger <Larry.Finger@lwfinger.net>, helgaas@kernel.org,
 Michael Buesch <m@bues.ch>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-3-refactormyself@gmail.com>
 <70e57af0-6a8c-a893-67c9-0181af16ae2b@lwfinger.net>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <78b52ad5-015f-4452-0cd0-dbb2c8597672@gmail.com>
Date: Mon, 13 Jul 2020 21:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <70e57af0-6a8c-a893-67c9-0181af16ae2b@lwfinger.net>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 02/35] ssb: Change
	PCIBIOS_SUCCESSFUL to 0
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

Hello Larry,

On 7/13/20 7:16 PM, Larry Finger wrote:
> On 7/13/20 7:22 AM, Saheed O. Bolarinwa wrote:
>> In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
>> Their scope should be limited within arch/x86.
>>
>> Change all PCIBIOS_SUCCESSFUL to 0
>>
>> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
>
> Could you please tell me what difference this makes? It looks like 
> source churn rather than a substantive change. The symbol is defined 
> in pci.h and is used in many architures. Certainly, PCIBIOS_SUCCESSFUL 
> indicates success even more clearly than 0 does.
>
It is a trivial first step towards a probably significant task. I 
explained in the Cover Letter, I can see it didn't get through but I Cc 
linux-wireless (properly this time). Probably, too many addresses.

I have resent it. It is here 
https://lore.kernel.org/linux-wireless/20200713185559.31967-1-refactormyself@gmail.com/T/#u

> Why is your name inside quotes in your s-o-b?
>
To keep me company before I get to know my way within the kernel.

I saw people with >2 names do it, so I did! Please let me know if it is odd.

Thank you.

- Saheed

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
