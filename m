Return-Path: <SRS0=DPz5=KG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67B2C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 May 2021 17:04:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C0061159
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 May 2021 17:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C0061159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC2983C6C;
	Tue, 11 May 2021 17:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9yaXz6ulrGG; Tue, 11 May 2021 17:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E19A83C0E;
	Tue, 11 May 2021 17:04:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42B9FC000E;
	Tue, 11 May 2021 17:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05730C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 17:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFC56401F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 17:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJ-KVqrAgPyK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 17:04:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5302E4011A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 17:04:00 +0000 (UTC)
Received: from localhost (unknown
 [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7D7EF4BF;
 Tue, 11 May 2021 17:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D7EF4BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1620752639; bh=jhHj1OrFaSajf+GTqsAGMNP6qfJhYZW7T49Hk6PMTfI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=tiWuI7ZoTQf2NDCjVjX7gggToVewaeq5yTHC+YQPCecOg8rau6cEA2/wD/BkSl289
 wGwpp1zN+2ldrduwpB6WErhw7mYq+mW8mZnOlhWvuC0IOr5HaR3sHSVZ592zh5qHcf
 D0fSx/GgsE25H0DK75A4NyeP+6lHHwH/Z+CTGSIuDP+gLe3V7AxtSP6mjTDpbci79p
 2bh0sz6K1tQbusLhBiRbz37fPSOVIbfOy947zGKtG7ctUypVBPgAQQHQlBL883URHL
 kYZnN8PvdbNlJ7sJb8DDQgsvBLSkGR1+Dg062xF/QTeWUzAzUxEsRYXNAz4JGTY9K6
 zOPWTVPN5eZZw==
From: Jonathan Corbet <corbet@lwn.net>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Subject: Re: [PATCH] Remove link to nonexistent rocket driver docs
In-Reply-To: <20210511134937.2442291-1-desmondcheongzx@gmail.com>
References: <20210511134937.2442291-1-desmondcheongzx@gmail.com>
Date: Tue, 11 May 2021 11:03:58 -0600
Message-ID: <87bl9hdwxt.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> writes:

> Fixes: 3b00b6af7a5b ("tty: rocket, remove the driver")
> The rocket driver and documentation were removed in this commit, but
> the corresponding entry in index.rst was not removed.
>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Please note: the "Fixes" tag should be down at the end with your
signoff. 

>  Documentation/driver-api/serial/index.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/driver-api/serial/index.rst b/Documentation/driver-api/serial/index.rst
> index 21351b8c95a4..8f7d7af3b90b 100644
> --- a/Documentation/driver-api/serial/index.rst
> +++ b/Documentation/driver-api/serial/index.rst
> @@ -19,7 +19,6 @@ Serial drivers
>  
>      moxa-smartio
>      n_gsm
> -    rocket
>      serial-iso7816
>      serial-rs485

Otherwise this looks like a good fix.  I've applied it (with Fixes in
the right place), thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
