Return-Path: <SRS0=X1C9=QG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1006AC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Nov 2021 11:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D691C61206
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Nov 2021 11:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D691C61206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A280B8194C;
	Fri, 19 Nov 2021 11:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V88AyvzLogJP; Fri, 19 Nov 2021 11:10:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E0AA381911;
	Fri, 19 Nov 2021 11:10:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAEF9C001E;
	Fri, 19 Nov 2021 11:10:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9424C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B319B401C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQIe1w0fbbhX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:10:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAEC8400D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 11:10:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so8507125pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Nov 2021 03:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6cWAmlDlAF59x4LqcOU/XShYfmYEgb4772Ge0zuawgQ=;
 b=ks3fFLzUFxnyfEU6VkMBuDy9Ur6tgo8k6gs9eRJyRE3XRvxt7oqPmCCzMczBDEwkJp
 Ob5J5llfw8vqiGruy+OC4KFtXmIY8MPOGGjHloaUXpgvry4nY3rWG1Hc90hPxMVbKPsw
 MRWEd+/O274lMNedkRjozFMLU1rYY8Nno+Zx+LIURGwVoqY/bkI1vHyayL2UQObs66CG
 rdrMebdPSoL1yHlMLmskAqoaZ4I4gz1UeibUqaP6wxlpzqqayzrBC7VZ0SzHE3hgHwbl
 4RQAaO59BcM8aJtyfSTD9DadiQQvikEkU3XfB6yW/Te3fbfxkYPO16dQ7cBk7+kF4mio
 J9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6cWAmlDlAF59x4LqcOU/XShYfmYEgb4772Ge0zuawgQ=;
 b=q+iSwMxr8Cfj0I2sFj7h9g9TWufNU7r1OJiK7kjVAm6nyCyeYFfwd94k/KSWblppl5
 6S44NFk1s+vTGyB1N1flcoPpWITvUCl1L5yWCCeHnijyWmnV0yY1oyHu+QUjfks171P0
 DmeHAxtX4BRoZOPW6NHo2f93pgLj86ZFVnA9lxhB9okE7EByNwOF3xL2RuV7IJ4NXf0a
 lLWTd5ViOUvqwHOe6j8JREXu5xIiZBy3KhpZyRQSzV2w1h6Nvt7vjH2LUp7TrE2OcoEF
 UwwTMt3DN3roltJTyk1F8NI3HLnVZgltSBL3o9yCj53FoidLSGZyy3pHDPmuZy2UmA3x
 dqXQ==
X-Gm-Message-State: AOAM5332Wpg7lQ0KaAtqh7EdHN35CHMMbpkTRFpC+qUiLZBdinGUrp9j
 VY0cV8PTamihEMd+bUFdOd0=
X-Google-Smtp-Source: ABdhPJxV+Pk1GPCfZmTWufJoVNVs22CQ7LdNAReT9GuuuFE4f7nR5BbG9XzKTJpNj27B+JUr9T7PzA==
X-Received: by 2002:a17:902:bd88:b0:143:d318:76e6 with SMTP id
 q8-20020a170902bd8800b00143d31876e6mr33099354pls.66.1637320218081; 
 Fri, 19 Nov 2021 03:10:18 -0800 (PST)
Received: from theprophet ([2406:7400:63:2c47:da89:58f9:fd04:7bf9])
 by smtp.gmail.com with ESMTPSA id z19sm2522822pfe.181.2021.11.19.03.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 03:10:17 -0800 (PST)
Date: Fri, 19 Nov 2021 16:40:07 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: Re: [PATCH v4 1/1] PCI: Add KUnit tests for __pci_read_base()
Message-ID: <20211119111007.ihxnziwbwo7u4wzx@theprophet>
References: <cover.1637319848.git.naveennaidu479@gmail.com>
 <a049a89cc673492d12415ebd5195a2b50c2b5626.1637319848.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a049a89cc673492d12415ebd5195a2b50c2b5626.1637319848.git.naveennaidu479@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

Greg, I added you to the CC list, because you left comments on the v3 [1]
of the patch. Apologies if that was not the case and sorry for the noise
^^'.

Thanks,
Naveen

[1]:
https://lore.kernel.org/linux-pci/cover.1637250854.git.naveennaidu479@gmail.com/T/#m0e0231f1dd9a70bc127736d436aefe79c9838115
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
