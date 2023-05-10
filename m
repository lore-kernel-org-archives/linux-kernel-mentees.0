Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E2FC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 07:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207A760F76;
	Wed, 10 May 2023 07:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207A760F76
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=a3T9bDod
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IlVLKajnkCO; Wed, 10 May 2023 07:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0840060F14;
	Wed, 10 May 2023 07:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0840060F14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4883C0036;
	Wed, 10 May 2023 07:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 266D9C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6AFE41E0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6AFE41E0F
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=a3T9bDod
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaR0--g2TFqN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AA941DD9
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04AA941DD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:55:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f9cd65b1aso174972066b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683705321; x=1686297321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIJKyRBEjdyUl/MVV9x2JqKCqHZQzxhquAJ+JI/f5XA=;
 b=a3T9bDodW1/k5HN5DT6PH4X9lv2Dbf5kR59lnt3ABrgC+Kle9jBuRgvo8pYQuSXECQ
 npw2L4nGfhgTq/XJKcDxDMFFwxE6PmiTf4k34cjdmZgiYC8ola/kc4pTRb8NuxGYht58
 qSclKzvYvMKJ8da54yy5Jhn3LL0ITzet4+nykowvYW6vW0OtqD/KbezsfgO/zlonoIGn
 HjQpf3m2oHdydnewz5Ofg3xmhwForC/o69EppfOEMvMRoZqaa91REZHoBVV6eNiZEXA9
 DX1OWn9Lpc7fKvsMPh7dG4M8CTWtv16zMcTBYN3ssm2XxJQAxD3qHwmiO4zvLB/iK01X
 KMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683705321; x=1686297321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GIJKyRBEjdyUl/MVV9x2JqKCqHZQzxhquAJ+JI/f5XA=;
 b=TLPh7Pm+AFNBrephAk+dsmn9qRSrIB5spKDD9TG/ym/P7i40/rnJmrg+4xMU1sqmXg
 /AUQu/iyYj5WInE/YziiboxsjkvUFKcpKoGV70czvrFwdS7VLGdl5d0lFjoygaQKhpc6
 kQtvwWdMYsi9zUzW9aFBv2EXrVj0XujFF7Lqzj2ZCqE48xIBA7Vt0BlP1K6tQCSFC1XG
 SG5IfOBlbN7BVXnE+MGW8gTPBftL2B1KRZo6A90o6+XN1hwJxupYbTb4qjSE3sl7VkRA
 pO4T63aBWfYd/vufMdlAvVolksEbvfcYHxDJ2j7Y2Pd5KTi943AJuY1MSUO4vUfdKpqt
 o3aQ==
X-Gm-Message-State: AC+VfDxDgh+apgIamOTHAp9vED7qb24YeEekrJMljAV3BiXm89DtjMPj
 T5qRl7XSRxyzCQwz5A1hvEQ=
X-Google-Smtp-Source: ACHHUZ4Etamrv/XEITbdotEx2ui0eic7/8Gzjz6mioeFp38Zuvsrbto00bt1j4JEIfAzxCT4KgGXCQ==
X-Received: by 2002:a17:906:7794:b0:965:9db5:3823 with SMTP id
 s20-20020a170906779400b009659db53823mr13650720ejm.3.1683705320717; 
 Wed, 10 May 2023 00:55:20 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
 by smtp.gmail.com with ESMTPSA id
 tk13-20020a170907c28d00b0094f185d82dcsm2313239ejc.21.2023.05.10.00.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:55:20 -0700 (PDT)
Message-ID: <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
Date: Wed, 10 May 2023 11:55:18 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Content-Language: en-US
To: ivan.orlov0322@gmail.com
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023051052-recoil-headache-1594@gregkh>
Cc: axboe@kernel.dk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, 42.hyeyoo@gmail.com, oswald.buddenhagen@gmx.de,
 surenb@google.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/10/23 11:48, Greg KH wrote:
> - Your patch did many different things all at once, making it difficult
>    to review.  All Linux kernel patches need to only do one thing at a
>    time.  If you need to do multiple things (such as clean up all coding
>    style issues in a file/driver), do it in a sequence of patches, each
>    one doing only one thing.  This will make it easier to review the
>    patches to ensure that they are correct, and to help alleviate any
>    merge issues that larger patches can cause.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

Greg's Bot is right, it will be better as a sequence of patches. Sorry 
for bothering!

Kind regards,
Ivan Orlov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
