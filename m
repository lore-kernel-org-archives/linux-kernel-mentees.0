Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB0CC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Jul 2022 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6DF8409D3;
	Sun, 17 Jul 2022 16:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6DF8409D3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gedTpL2O
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXEGsPXmSD62; Sun, 17 Jul 2022 16:17:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CB23640002;
	Sun, 17 Jul 2022 16:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB23640002
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CE07C0033;
	Sun, 17 Jul 2022 16:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12128C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 16:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEF9E4013F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 16:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF9E4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P05MfRw1BDbI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 16:17:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16AB940002
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16AB940002
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 16:17:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e28so15701011lfj.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LVtaKxs7d9jWGW/ag4VeQH2lASOiSRK3darGXEw5b+U=;
 b=gedTpL2OT34yCe/KuASkLyO3C/L80JXn9+OEqfQ+pGkTpW9/Y2ACVLp6MQGZhEQxrN
 zK63Xc6ppPeUC42LbHqnVbKos2kVBh1pcE0c4t+FQFk+XL1dV9OP+SWPU586LraMUza5
 Yk72O6cuPD2WgMIh8NPsL3m8y6SLHufSB+f4UTQ4k1WXKJYV7QZp88lTFfnI0CKNDedv
 xPPFB13HySiOa0tOXAUfctc1UYtVGAVREHC/yzL6TmKxNiDcHect7/0oS58J5cWE0Q47
 bNNcNPz26nA4qkhXajcLIjYb7z3AUxjEC29HsImU5T8koNWEu5xq/rFzZaU2S2M135/7
 zB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LVtaKxs7d9jWGW/ag4VeQH2lASOiSRK3darGXEw5b+U=;
 b=18IcRo8nKPOzQtQtlq0j4U/5mP1FKvMaitl8CWZYmSe6KL8n3t+in2WyBGV/5i652v
 lFNy7On5X0V5a0XC8cYU1XmSJrKSxB0weSdV4S3F8NAfPFyb+IpdHBQudVG7PVLQJwwT
 QBtW7l5XYPB+PXQZ4WcEjPufT+YMJpfZPrfpYbkQav9kWeKZpWKIYKK1klNO+haEfkyI
 K/DyxyPatIgR2Iim6k9vtqHhQt46SsDdagJMJMUixJtgsRoc/29uKWlXbT2orpRDTk93
 mzG6WwmemSAx4YJI2jE21lX6rrVJKtQxxGA6F5ix9/mwrmQ3JwChZzbp3q/AcTrNK4jU
 +TjA==
X-Gm-Message-State: AJIora9iNADTEfj5QL+TKWkraoMpzaHOV09pv7q56KxlpJee9g5gRksl
 ZOi4gG+ZPeT7MeWwTYIc1og=
X-Google-Smtp-Source: AGRyM1usQ/hmPjYoBgRoc5730r0JGodxe2wwtcp8bDxVCiijxctBNh+Rbdu3DWbgJ+1LjgCBQ5w4Jw==
X-Received: by 2002:a05:6512:31cf:b0:489:da0d:df52 with SMTP id
 j15-20020a05651231cf00b00489da0ddf52mr12952240lfe.221.1658074655836; 
 Sun, 17 Jul 2022 09:17:35 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.63])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a056512071100b0048a29c923e4sm1246402lfs.7.2022.07.17.09.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 09:17:35 -0700 (PDT)
Message-ID: <3ea0ea90-48bf-ce19-e014-9443d732e831@gmail.com>
Date: Sun, 17 Jul 2022 19:17:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Bluetooth: hci_core: Use ERR_PTR instead of NULL
Content-Language: en-US
To: Khalid Masum <khalid.masum.92@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20220717133759.8479-1-khalid.masum.92@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220717133759.8479-1-khalid.masum.92@gmail.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, netdev@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
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

Hi Khalid,

Khalid Masum <khalid.masum.92@gmail.com> says:
> Failure of kzalloc to allocate memory is not reported. Return Error
> pointer to ENOMEM if memory allocation fails. This will increase
> readability and will make the function easier to use in future.
> 
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---

[snip]

> index a0f99baafd35..ea50767e02bf 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2419,7 +2419,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
>   
>   	hdev = kzalloc(alloc_size, GFP_KERNEL);
>   	if (!hdev)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   

This will break all callers of hci_alloc_dev(). All callers expect NULL 
in case of an error, so you will leave them with wrong pointer.

Also, allocation functionS return an error only in case of ENOMEM, so 
initial code is fine, IMO




Thanks,
--Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
