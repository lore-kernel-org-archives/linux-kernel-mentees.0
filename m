Return-Path: <SRS0=5ZcB=4D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C46DC7114D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 15 Feb 2020 15:15:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D522084E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 15 Feb 2020 15:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ob1M+dVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D522084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1CB5288266;
	Sat, 15 Feb 2020 15:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZJ+vHPGeR9t; Sat, 15 Feb 2020 15:15:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48C2A88265;
	Sat, 15 Feb 2020 15:15:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E628C0881;
	Sat, 15 Feb 2020 15:15:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA4CAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C8FC085065
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 15:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTQlnVyrMbuO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 15:15:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3707185039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 15:15:14 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u124so11635206qkh.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uWzLjbBp8aRsVSLKA91aPxd7wXiz/npdTaFsiixqRhM=;
 b=ob1M+dVQyL97DzvdG6/rS1nbpt+LYfpjmAUF7JHhdbEl9u6fZrcYi8ZKLRxYs10wm+
 hbURUmByVSIB8x+5qdjbXtXCOgb+lKBqJwd+iyfL/Z+NhKrCm7ZD4H/5pTsS+R34P4Df
 CcMLOB0B0Tg7vQFawFdDQk1GlYgSWAF8lsGvMdJpQ7E+M1P3gFvJyvm6aMkpTHV5y1v2
 0hW9uDFk6pOIKTy5AN7tDMjhNwJpVcaU3dc5E/mefQCz+s89pVzmyt0LY/4WFnjstOYy
 a6aubSK0jx/Oj7sKE0Qbog7f84HUDCiCKKcS3HhaBnUeb1KmcMzMRJLBt+y6LoInnpil
 oVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uWzLjbBp8aRsVSLKA91aPxd7wXiz/npdTaFsiixqRhM=;
 b=bV4SCUPeAMf4iKwLtpGjUqTpKxPGpbrB5NnKlB+ah5mzDGQ2Ur+sl9w/pq7S0ZeJ40
 qy6S742rSt+7UR/EAe7KJrQaeDUox2sBaEyZP0R5zEYVZxwMZIs6oQkKnvvgta0Mf91y
 FKJ3IykjNzUMraUPl1xwfoMBT1FZIu1FmbJuWwWIzNgumWzHCyihJWbM5xs0w8Ozmuq0
 KG8hcWSTsIzDvGqByLHQhGesxIo821JJEEh9B1bB5IkiwZcfWwhKdm/8/SY1zcZGNhuH
 ecHiPp7CY4KMCjdZwc+tEopKfJRMng5TZP6RrJeBQBZl8aC9hQmqIJPhzw+7mCNj3z1t
 LTRg==
X-Gm-Message-State: APjAAAVNRe9skSrHMTrWA1tU7yiJjdfPsxp3aT3Es+hNXty7OhWPUpjm
 Gb4C9GvSfL8jXlJWCySnHg4GedKB8kyyZg==
X-Google-Smtp-Source: APXvYqxpvAHSD/naM2yaCHrG1MA+Xkos4kcUo2nI3mT+HBKkPxDMv80TmBa+NMdsC9D3tFlp12ooAQ==
X-Received: by 2002:a37:47c4:: with SMTP id u187mr7502718qka.165.1581779712998; 
 Sat, 15 Feb 2020 07:15:12 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id d16sm1487549qkc.132.2020.02.15.07.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 07:15:12 -0800 (PST)
To: Nathan Chancellor <natechancellor@gmail.com>
References: <20200210154102.118166-1-dwlsalmeida@gmail.com>
 <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <886c816b-65a4-9cd9-4c94-f8025b63de4c@gmail.com>
Date: Sat, 15 Feb 2020 12:15:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214050813.GA37036@ubuntu-m2-xlarge-x86>
Content-Language: en-US
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] media: dvb_dummy_tuner:
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

Hi Nathan,

> This patch and another one that you have [1] cause a ton of build
> warnings with clang, as reported by the 0day bot, because of the
> implicit conversions from floating points to integer. Is this
> intentional? Would you mind taking a look at them and addressing them if
> you do another revision?

Sorry I did not catch that back then. I'll fix it in a future revision.

Thank you for letting me know.


- Daniel.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
