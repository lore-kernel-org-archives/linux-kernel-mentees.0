Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D190CDB47C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC95D40291;
	Wed, 11 Oct 2023 19:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC95D40291
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SAAK+79l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOSBBQF0U1aS; Wed, 11 Oct 2023 19:08:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87F5E40004;
	Wed, 11 Oct 2023 19:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F5E40004
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74C76C0071;
	Wed, 11 Oct 2023 19:08:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B69A5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9285D40291
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9285D40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQHaMKvN4RgR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:08:50 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCD2740004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 19:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD2740004
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a2874d2820so3195839f.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697051330; x=1697656130;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOAHf3xPVNAj31p9ZuVv8f99VDpjedw2IWf54wQ2koM=;
 b=SAAK+79lYBkzT4off2gZ9TBE0i1J50mNPOOIe9uNVRLpsMFZ7m+rZVem4TLwTfuP2R
 zIrzqZ5AKxjB9kQqBU+6YMPbr+lbEQy45OHuThnNW/rkUiYIzFHcnztrzZ4h+xpxBuzE
 5u5MzlYwxho3y165mOHhSetqr3xAICzrABiNqDrso7TyIDEgEndx5DPXW4LKgjHJa1w/
 gZ+QvbAHUdEySUjk5ccoGLGF5SR49/gFH6B2ygqngF4k2I+tFNbM0P21fyYQXUCk0ozy
 3STlQYDS57/sUNUO6mE9xVtJE2G/gDRAP4QWP7FuBpoM6ahNp8OVAIa3OZy530Ggfr0X
 xNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697051330; x=1697656130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOAHf3xPVNAj31p9ZuVv8f99VDpjedw2IWf54wQ2koM=;
 b=H9QuLXoCmRZ/op3q24GVYstASLxlRGbU/WdsIlHW6HTf1O7SoGJL2+XGBtc9MfdMnH
 gGtUm2nHFvRWUzv4Lz/wYtA7COB4w8X7j7kQJrOkYjjucsgeSVOUoR3x5TbD7WeMZ/70
 rwrmRxYGX73xbBhoR3+McjXHE0fF4u+p+MNMPJa7IcsbQnrgae4bpo1kS7flVWnWAB+g
 WlG8VAgIjCJfkVk2ctsHXKR2TmmnKUJDbe2FHLaM9RnqEYr6FtAlT8yUnm5oOx1ZHXYa
 wEbjZv0zezpXI0HY5AA+gZDjBQxs+iOCJ0rDr1tiW5QglszbB6SyJjEs20mPfrlsYAKD
 AImw==
X-Gm-Message-State: AOJu0YxRBjj7Gs4CGYHldPsoG/RzeMAIM6U56T1UfjT1oMZbIALqnAzq
 cLHXzs/SWtsw95v/lHU7T+0=
X-Google-Smtp-Source: AGHT+IEvyVcmyoResAsmvkfmIStWlRecPzJs24Pekw51sgdB1+vZgz26xmObGIfV15Y7nuH+4KXd1Q==
X-Received: by 2002:a6b:5a0a:0:b0:790:958e:a667 with SMTP id
 o10-20020a6b5a0a000000b00790958ea667mr21122819iob.2.1697051329738; 
 Wed, 11 Oct 2023 12:08:49 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5e8c03000000b0079ab2787139sm3852955ioj.7.2023.10.11.12.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 12:08:10 -0700 (PDT)
Message-ID: <b34b4e95-2d0c-4cb0-97b0-2613857d2c35@gmail.com>
Date: Thu, 12 Oct 2023 00:37:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove extra unlock for the mutex
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
References: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
 <2023101136-irritate-shrine-cde6@gregkh>
 <3073e9a6-9f10-4326-9734-7e203d509888@gmail.com>
 <CANn89i+hMbhLqXKCF2P=HVeeRSCxvgH_xY1b=T=udLFJjG3ZwA@mail.gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <CANn89i+hMbhLqXKCF2P=HVeeRSCxvgH_xY1b=T=udLFJjG3ZwA@mail.gmail.com>
Cc: dsahern@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On 10/11/23 23:13, Eric Dumazet wrote:
> 
> There is no undefined behavior, only sparse that might be confused a little.
> 
> I do not think we can express in sparse the fact that
> inet_csk_find_open_port() acquires head->lock
> 
> (head being the return value of this function...)
> 
> The following does not help.
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index aeebe881668996057d1495c84eee0f0b644b7ad0..ed7b3993316cd1ba0b2859b0bd3f447e066bd3b5
> 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -323,6 +323,7 @@ static struct inet_bind_hashbucket *
>   inet_csk_find_open_port(const struct sock *sk, struct
> inet_bind_bucket **tb_ret,
>                          struct inet_bind2_bucket **tb2_ret,
>                          struct inet_bind_hashbucket **head2_ret, int *port_ret)
> +       __acquires(head->lock)
>   {
>          struct inet_hashinfo *hinfo = tcp_or_dccp_get_hashinfo(sk);
>          int i, low, high, attempt_half, port, l3mdev;

Okay got it. Thank you for your time maintainers.And apologizes for not 
thoroughly checking before sending the patch. I have a question, there 
were some type checking warning as well from sparse tool. Can a create 
patch for fixing those type checking warning?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
