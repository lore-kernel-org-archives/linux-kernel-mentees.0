Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C289C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:48:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB472074B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA5sIO77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB472074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 713D820402;
	Sat, 12 Sep 2020 11:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m+8Do8EBMwwk; Sat, 12 Sep 2020 11:48:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C17F2036C;
	Sat, 12 Sep 2020 11:48:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D392C0052;
	Sat, 12 Sep 2020 11:48:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C490FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B982187689
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtpDm2wwRJlo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF08A87685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:48:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id j7so2177580plk.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OwPAo2M2FAyOyFS44kKh1uQYLeqMtF+CgK4zd9SKZZk=;
 b=TA5sIO77dMM1HlM9R2NJ7aU/mLolusBkfyIkPUOaDnQpx9OPZ1kKMqfVhzbUkgcy4U
 77XLB9aA6clbivxm3KSeeg5pomJmOtGaWkbGEtLdlVf3fEmfG11KqLZOZGL4sUdMT8x/
 MtKxCadrAlfi7gey0OLUa/ORzJ5dLnLeMIYmVH8Kp9dcTwC1n6niK1cYdal/BDuZ2c0u
 K92l00YgAG4HpiSG70nPfe3lnMJ4/9jd9WuGfozguTyaMDTHK44+qPclOpfhKQdPsgIu
 5V2phiR8mdUUjB+gxypxAst0xAyDEeb9ifS+VZcvOQNTev7eSVa1ceYid89A2nldtr9c
 0s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OwPAo2M2FAyOyFS44kKh1uQYLeqMtF+CgK4zd9SKZZk=;
 b=XtmfTAJVESsz/AxE2lWVsDVPmE/TZ6Zp6QSIYtE+qjwBPD3Vjc/ag64SdYXk/KV/7z
 vYFQqcFUBfjbfE3+DHlPzUl/d2buch/HbERMtQXGC/CyvhBG5rGfXp5Qilvlkig8a2fS
 SEYtd2u26wvvh5sn6Td533mz8QMQKTqklx9OekDSoAvkvrXL2qdrtYYiU1qWr7jcKz83
 V7fGS/npXVA3P0BHCC95ElLjRDaLWKiSTpYtGN8GYwefHJCVR7FviMZH7JV4U6Vseskx
 PxdXH2PAnlXh49W7HwUUgB6qFhmcX6/VXun38CEmduvwSf9J+Baroayjac78xWLvOwS4
 0Apw==
X-Gm-Message-State: AOAM531awruz/+4/ImLvHzebsmV3ciOIELbs2x+0NlejFXZTLQknxbDs
 FWnmbQo1JjH2Ewrkz+aQBx9csf+nguYJFg==
X-Google-Smtp-Source: ABdhPJz1qw6vdB1lh9ksuFrh7nPAbGSg92bp/fbzHzwUXoR8GYD004fsRAWn6AXyGIZgx1ktI5+r3w==
X-Received: by 2002:a17:902:c192:: with SMTP id
 d18mr6363774pld.36.1599911290090; 
 Sat, 12 Sep 2020 04:48:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:20c9:9c65:b4f8:be85:95bb])
 by smtp.gmail.com with ESMTPSA id c3sm5194349pfo.120.2020.09.12.04.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 04:48:09 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <6a2bdeea-265b-5cd0-78c2-aa865b0d5bb7@gmail.com>
 <alpine.DEB.2.21.2009121343290.13082@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <23226f28-dcc4-dba3-dac9-636464d37b03@gmail.com>
Date: Sat, 12 Sep 2020 17:18:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009121343290.13082@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: tasks
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

On 12/09/20 5:14 pm, Lukas Bulwahn wrote:
> 
> 
> On Sat, 12 Sep 2020, Ujjwal Kumar wrote:
> 
>> Hello Lukas,
>>
>> I attempted the tasks.
>>
>> Below is the link of GitHub repository containing my write-up and findings.
>> https://github.com/Ujjwal0501/lkmp-checkpatch
>>
> 
> Thanks, it shows 404. Good luck next time.

I'm really sorry for the noise. The link is active now.
> 
> Lukas
> 

Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
