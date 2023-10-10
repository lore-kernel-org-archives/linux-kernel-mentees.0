Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E3CD98CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 22:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D21E60F9B;
	Tue, 10 Oct 2023 22:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D21E60F9B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CPlGWHIU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPH1lBGLrgaT; Tue, 10 Oct 2023 22:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EAC5760F8E;
	Tue, 10 Oct 2023 22:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAC5760F8E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3EC3C0039;
	Tue, 10 Oct 2023 22:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE264C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 758BC4044D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758BC4044D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CPlGWHIU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB5fTkqSP5VS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:51:17 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 423A140012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 22:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423A140012
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6c67060fdfaso4270597a34.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696978276; x=1697583076;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MAPx7emm+jvc2q+Bc3jRC8KUctxaIgAys23gkHTb/Ng=;
 b=CPlGWHIU8dMtbaNIfS4dRkhoRv5gvAbldgdsJy4NJ4gk2aE5LTY3fGN9S8BzOlx7To
 0ceUsGadYeDJbgQEFIAAwljCJ3XefEs73WMN5PE46FldiowuQfoT7cJINfwoJGZbJuY+
 /P+MZ62f+yEhXx7mGqGPgXMRvXWPrCVrWMt7ZbrhW8L2/vKaaPKC+vcjshsONzi0PJro
 nvbuOjoVuFMML+dgxmBCBJZgH8T2jBYRp1B1vZxafADRUmU3ZATs8KgMY1WQUpekJvn6
 NwV2/H2tlI7wM5pzHeA+ljX1Rq1fHfHnT6xmtaeR/iAQhG4dedaqwWIkA9/CPJjMdjXA
 djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696978276; x=1697583076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MAPx7emm+jvc2q+Bc3jRC8KUctxaIgAys23gkHTb/Ng=;
 b=LmBYqWA7tVbAUbz0OGULMXlchy1r+3/bTP0iXXGcov9uUp9eMEEeOH+x3eyWnsW6Xo
 DxGfTf1AqCFaeUQggo0HoiFIBZLtCd/SDj33wPbdMRiQ7fn/2qlVQ8atIgs57mTCBltb
 ZlxM1QopCtK6/+VM7VgmrrjsnIQ0ygxTXRgL+uvhl6NbgWEbfWzmdhR42NuHvbbs8w1W
 IEDrHUN88KJE+VXbhxGlesRRyolufyDFfXH6IHWZyLqVE4IMT0Ne3gWj+ar/PR7HRhdn
 7SBf62r2LWyJY7+DyFFEz4KKWV5irJkp1WXdx3xGtSE7ckXuJSVXizV9wnyQ/IAjVYow
 1thA==
X-Gm-Message-State: AOJu0Yx00saKbunYPtklcsVDB5J7kR6ZYQQY17adtqhxB7wTv2TqcMHQ
 Vj4EiXeoSzFWHClTgQY/1CM=
X-Google-Smtp-Source: AGHT+IH+5J16uc3L0kkDA8aO9xcwVg1Eq67MFvQMo7wRDvdT9c4px7qlZSXwP6e3Rp0AaG9N5LfKcg==
X-Received: by 2002:a05:6830:442:b0:6c6:42ca:ed52 with SMTP id
 d2-20020a056830044200b006c642caed52mr20713072otc.30.1696978276144; 
 Tue, 10 Oct 2023 15:51:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 s29-20020a63925d000000b0059a1c256bb2sm2545977pgn.60.2023.10.10.15.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 15:51:15 -0700 (PDT)
Message-ID: <ab48efc3-9f40-4eed-bdb1-4ce04d3c55cf@gmail.com>
Date: Tue, 10 Oct 2023 15:51:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove extra unlock for the mutex
Content-Language: en-US
To: Abhinav Singh <singhabhinav9051571833@gmail.com>, davem@davemloft.net,
 dsahern@kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
References: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/10/23 15:46, Abhinav Singh wrote:
> There is a double unlock on mutex. This can cause undefined behaviour.

Where is the double unlock of head->lock (which is a spinlock and not a 
mutex, btw)?

> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   net/ipv4/inet_connection_sock.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index aeebe8816689..f11fe8c727a4 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -597,7 +597,6 @@ int inet_csk_get_port(struct sock *sk, unsigned short snum)
>   	}
>   	if (head2_lock_acquired)
>   		spin_unlock(&head2->lock);
> -	spin_unlock_bh(&head->lock);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(inet_csk_get_port);

-- 
Florian

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
