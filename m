Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839D0C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 20:51:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6F72067D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 20:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw4ugtVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6F72067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1852F865AB;
	Thu,  9 Jan 2020 20:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yU6F2m9qNGJ3; Thu,  9 Jan 2020 20:51:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C03D3868A8;
	Thu,  9 Jan 2020 20:51:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF481C18DC;
	Thu,  9 Jan 2020 20:51:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3437C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD4CC20336
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jQI9BiDjCjg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:51:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id EC6302002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 20:51:25 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t3so7042643qtr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 09 Jan 2020 12:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r8+PNHuHVYhO/9L0NgizQ0DPv9kkAS8uxlfxmczMuUs=;
 b=qw4ugtVaC6xnbnftjvIJFcCrXVrzd9ZuL6nubS64+2uc1FK5WtpHD8Y2NRCrKtv5td
 djdGWXbyqaDsGAtasuUyc6QDk06/XjfT104M+RVhFCPaZ7qSy7UT1FoFPqECaPbFjfGy
 LCqzkqjOdSA2V9FDFm/s69Q3pGSHKgQWw4E9QbJ7S82IamCX/hcdH9lGuCgwh+cZbLhE
 TNxhXFYpMOMiOQMq97/JxjDIgrG8ELLGnM5BTQNFXiE6KqCwv5uZPidQqrgE/e6BX46h
 5GbOguWylANbfu0iwzBlydzg79iWAuySiFY3SktZaUOXE+kaaEumPNRSeEpWsDp+NTF2
 oeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r8+PNHuHVYhO/9L0NgizQ0DPv9kkAS8uxlfxmczMuUs=;
 b=JxTtfPliWIYxCBd7EtJUx8dgTahJxDTzvBukAOE9Kt6Op2quP5FnnFZu7DnckEaq8J
 p1HoUudByHMyXeSicy5rmbu7Xu72bS4DqjPmeNg7QXx8o1tSsr4zREyV5MtpyqyGEnWo
 SE8p+VZcvycEtKycMG2a95zceMF51dFyP2gw/Xw3+2roXW93fv686sAMXowiuzMmL1UE
 52mPLcq1bEl9i/n6EtdYsVeVk2imvJ9+NAQBsEVueEZ2V3g+RQhpLT+ObQr3E+fb5/LR
 g2yj+b3vWYkEGomKWX0jcw+n4QgN2X/lKBaUc8e75pUtOHR5n+XESPxbSKh/NqPUKrho
 iWAw==
X-Gm-Message-State: APjAAAUcp1aoPCPWWjRdebEAkp99eAAU/BgmTnMU10h28WfF6DUputLW
 QUhGQjR7K4pC6eAUvQoXA9aJp17jglQ=
X-Google-Smtp-Source: APXvYqxuq+Jd+nWt/TrkJDmldrGG25HleKXAUbyKuI0EseL0XUXFC3Xq9Wq6SD6HMQ8/qorIQEuDng==
X-Received: by 2002:ac8:4657:: with SMTP id f23mr8387874qto.378.1578603084671; 
 Thu, 09 Jan 2020 12:51:24 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id s91sm3846706qtd.50.2020.01.09.12.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 12:51:24 -0800 (PST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109170750.12746fcc@kernel.org>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <aedc52d8-db98-eeac-c519-a4eeb21fa9dd@gmail.com>
Date: Thu, 9 Jan 2020 17:51:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109170750.12746fcc@kernel.org>
Content-Language: en-US
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/1] Implement a DVB Dummy Tuner
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

Hi Mauro!


> No need for a patch 0/1. If you want to send just one patch, just sent it
> directly as:
>
> 	[PATCH] foo

I planned on adding more commits to this series in v2, v3 and so forth 
so they would be applied in order, since they would be touching the same 
file. Likewise, the changes could be reviewed in a piecemeal fashion 
making it easier for reviewers. Is this not advisable?

Anyway, thanks for the heads up.


- Daniel.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
