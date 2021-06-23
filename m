Return-Path: <SRS0=L/ns=LR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689B0C4743C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B77661185
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B77661185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C63EF40500;
	Wed, 23 Jun 2021 19:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhuBKA825t0x; Wed, 23 Jun 2021 19:26:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DAD6A4025E;
	Wed, 23 Jun 2021 19:26:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCA56C0010;
	Wed, 23 Jun 2021 19:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCB79C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DF6E607AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pq_IiX6_XLhY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:26:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9E8960769
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:26:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r5so6007115lfr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mws8JTsPd9+atb1/JRjdmcWQnXTwDM12m7T79JCDYI=;
 b=QKbruPrK8+r9Z6CHz8ZcBN91/61A8PbpooA0sGui9NBKFgMuuMLoyIVLMKCtsLHdeO
 O3otQ5Z8TPQ3mNDvuIah4gK6NE2M8mDny2i0V4zqrPkmEBomA/Q7hJUhNY5LSAfNWeyk
 YCakA62FspbPtZEMfcp4uNba1bU/SgJV8zIImpK/P61wRhP8ktrcdMoNxNzCdNm4skYf
 +PJ5wjDyv90wNzAAJe1kLHVXvj+bfKbj94AoZT2J5y2wMi78x/Otyg3O+4MFiv6cdEAh
 wnlBsPoAqJq+QtplRzV921rSgv7G2ohU7KVABXL9i5kisZGcI4U0MgFg/v98SChDv3Ry
 axWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mws8JTsPd9+atb1/JRjdmcWQnXTwDM12m7T79JCDYI=;
 b=Ju95reRBw7yzvMo/T1OHoDK5t0dNuZnuunOHBpM/WddmV/uuKqHZnafimaquW3VoY8
 URdkUtTUxiv7PX+u4L8sqUFSbF4NOxUlpuw4OTUFeCGfB+FdSNc3UD/BYXxo9Cpkg9eR
 28zXOKnmTi1mwL72gSZo9bXq6cfsQBH+Sr9u7FuYaewgg5nYN5n3GkPqkymS66eWFr4F
 O1O7cHqcPLYj6jXBBRyPv/4F9CwpV7sDwmDeugCV9W1oitzacfTIhH3F6B+3HWqA84br
 /TCNxRu/j2qtMI+FZfvkrIClY5eokGvnkv/RBh8S9sscAKSRDZQglUcoEUgcx7zdjoVA
 6fbw==
X-Gm-Message-State: AOAM532yVdPVBEFVTIpo1pGbtbM/qV5AXdFefioILG1vNwJfLNzb4tgG
 BWO6GvL1wBzKevzgMerp86I=
X-Google-Smtp-Source: ABdhPJx/y3z1NxEj0i19lW89L1QoDy9Hp6WsBpHJ7H8yUQyHKJpyoJlgX9mJBjXKMibgHc5AndiiIQ==
X-Received: by 2002:ac2:4c48:: with SMTP id o8mr876420lfk.332.1624476384620;
 Wed, 23 Jun 2021 12:26:24 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id p5sm50912ljn.109.2021.06.23.12.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:26:24 -0700 (PDT)
Date: Wed, 23 Jun 2021 22:26:20 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] net: ath10: add missing ret initialization
Message-ID: <20210623222620.06b6335a@gmail.com>
In-Reply-To: <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
References: <20210623191426.13648-1-paskripkin@gmail.com>
 <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 kvalo@codeaurora.org
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

On Wed, 23 Jun 2021 21:23:27 +0200
Christian Lamparter <chunkeey@gmail.com> wrote:

> On 23/06/2021 21:14, Pavel Skripkin wrote:
> > In case of not supported chip the code jump
> > to the error handling path, but _ret_ will be set to 0.
> > Returning 0 from probe means, that ->probe() succeeded, but
> > it's not true when chip is not supported.
> > 
> > Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> I think this is already fixed by:
> 
> commit e2783e2f39ba99178dedfc1646d5cc0979d1bab3
> Author: Yang Yingliang <yangyingliang@huawei.com>
> Date:   Mon May 31 17:41:28 2021 +0300
> 
>      ath10k: add missing error return code in ath10k_pci_probe()
> 
> 

Ah, i didn't check linux-next tree, my bad :(

Thanks for pointing it out



With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
