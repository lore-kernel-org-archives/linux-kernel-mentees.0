Return-Path: <SRS0=L/ns=LR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58B8C4743C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEAD61075
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEAD61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E145608BF;
	Wed, 23 Jun 2021 19:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQKiOZBZ-vS8; Wed, 23 Jun 2021 19:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4CA77607AB;
	Wed, 23 Jun 2021 19:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34D08C0010;
	Wed, 23 Jun 2021 19:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47276C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D9583224
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y73d4QIUcNRK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:23:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E438104B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:23:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a11so3822196wrt.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 12:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dq4bNmoezBnbnji3QvGAbb4dAnBkndoiAymK9jeUq04=;
 b=CXI/3Xn46DPHunYRKMemj/2lg5t37dPGcrxC3jgZ8wJ2Xt4NSh5BnW6ztXNkFQqpFG
 1Cr8LrePNp3O7IgldKcRLxV4LsGPfuX7pYwcwtf/+KuHpXQ4FJuVtPHydSQS/hzdJfqX
 61vbLpJ6/1H43UteLHFlJjVztyn2WSzGo0E8XSU6KS8kgxV6I1KuIvnT/HXYjV6u+W6e
 df77zCiRRWOgmmyOQyFsspvB+WaKv6E+jRUurODdeinnfEYibe5E05eF5Rjo11SK2Jlf
 oyFkzNRkbyou005ife0lSyBZYirff5jVaRB0tFxMQKQ6rLLwt0rRo7F/b9px68EwAo6i
 fHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dq4bNmoezBnbnji3QvGAbb4dAnBkndoiAymK9jeUq04=;
 b=KS2h/W9vOVUvL/pl8n6f5tBlSpBESSb2vW5ecQ7e24oFqGd/6/LWSfN+YvlqFAh6n6
 GepYgrwVpJj5cIhN7rO31IWHExm4rC9RYkjzRX//Pbicu/w7fGJ3sryNAkAgFS1FewjY
 GlSeG+4ZpSvDxTcMIN0Oa8EiBr+1ZglCI2gz6qr8CI6xoUVjT11tFcDMQa0H7Lgm8vad
 msFa01jgFpMaMdWJWeswRFB6rKN5ycrzu3pvtSlTYzqjdnkNbz3at2zRqZpd8kNHOX1z
 9iKHemOUScvJy/btcG2JU/Bn8ajE9vJf6YuD1wDGFJNN2x/923v5fz6EWdEHRyKqu6Ba
 YrvQ==
X-Gm-Message-State: AOAM533xrrGMAJpzlmd/nMia6lIvPe1iDGdghFizcW3ReXxZ5wdh4ny3
 h0oc46xS3C86m2VUNc+3Snn/ntzO/Uo=
X-Google-Smtp-Source: ABdhPJxVE30MVKLDbgompMmg6DCsBEGcqwOjveqUOXfXf4Yg4EnJ59pE44Lg0c84bsQbJrVeZGVd1Q==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr1906893wri.261.1624476210812; 
 Wed, 23 Jun 2021 12:23:30 -0700 (PDT)
Received: from debian64.daheim (pd9e29157.dip0.t-ipconnect.de.
 [217.226.145.87])
 by smtp.gmail.com with ESMTPSA id x7sm905871wre.8.2021.06.23.12.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:23:30 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94.2)
 (envelope-from <chunkeey@gmail.com>)
 id 1lw6ak-000BL4-DD; Wed, 23 Jun 2021 21:23:27 +0200
Subject: Re: [PATCH] net: ath10: add missing ret initialization
To: Pavel Skripkin <paskripkin@gmail.com>, kvalo@codeaurora.org,
 davem@davemloft.net, Yang Yingliang <yangyingliang@huawei.com>
References: <20210623191426.13648-1-paskripkin@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
Date: Wed, 23 Jun 2021 21:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623191426.13648-1-paskripkin@gmail.com>
Content-Language: de-DE
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 23/06/2021 21:14, Pavel Skripkin wrote:
> In case of not supported chip the code jump
> to the error handling path, but _ret_ will be set to 0.
> Returning 0 from probe means, that ->probe() succeeded, but
> it's not true when chip is not supported.
> 
> Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

I think this is already fixed by:

commit e2783e2f39ba99178dedfc1646d5cc0979d1bab3
Author: Yang Yingliang <yangyingliang@huawei.com>
Date:   Mon May 31 17:41:28 2021 +0300

     ath10k: add missing error return code in ath10k_pci_probe()


Cheers
Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
