Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE834EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Aug 2023 01:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B0281393;
	Wed,  2 Aug 2023 01:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19B0281393
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hOIn8791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4epIuJAQEx1W; Wed,  2 Aug 2023 01:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D6D3581F38;
	Wed,  2 Aug 2023 01:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D3581F38
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4A09C0072;
	Wed,  2 Aug 2023 01:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFAE6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 01:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B771E81F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 01:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B771E81F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAEAqxpAGNDe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 01:07:43 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2736E81393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 01:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2736E81393
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-34932982295so5168455ab.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690938462; x=1691543262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/fwGGoY0CBXI3KqyyOIfAkFvSeZq3jl3v4eWbf/W0A=;
 b=hOIn8791S8Fsb1QPvRMOH4bEHLp3uqg3ydip8wm3qcDcki+qK1qFZO9THgJ6j6cVwn
 hBZiRTF96vZzW3BOTF2mgWIpSSpy0IQwvmle4K+4BOvlIZlBioMYf0380l8qUxaReBKq
 yuBCN/pAFIzNTC6T+4M+cDcegWJgZR0lbX6QmXVt2S0cEuRjHNoEt7PSDSlgUIlL5a0R
 01kEkXG5JijTDsytX5Y7ewqpzucYh3NI06h3wfGl6ni2NiVkDdTabQvBte0LjNEbBNJI
 SvrIr1fbHGkfcvqJQOZrPWjXw97gyXQjTPpRkjdlMDPBtj2Ep5H8yg4wGoVn0HQNyu8i
 gyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690938462; x=1691543262;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/fwGGoY0CBXI3KqyyOIfAkFvSeZq3jl3v4eWbf/W0A=;
 b=G6Hzfz4EJwy2vo5zCwzl8IAuyLhS438qxl9xaU1b13gKdaCN+dVDNjr/joD6RiP3nr
 zkvHRgO4H+CeomGbDjVSfFLrRKqZoyyIssV2sfeu+Vl9WN93VglL6YjQSzEfCE4ZXuTZ
 /qmYanHdBKl4w4mby/juVsOgzzYKjl/S6zs9c/xthB7TglXh29jgOgTBo2JQD/bxjiRW
 wLUF3tYDfQQas+jQl2LHyMFl0DycrECfjelmjoJ7Njc7uL+pf6oSSfLMDdRnJjo2ehIs
 Tbmi8wIyGFsE4Qg/RqXj5cQhhkhhcTln8mUXz2Gtwd5YgMkBYxleo+Mo5+8z56+XElsP
 ggbg==
X-Gm-Message-State: ABy/qLaqknkOY+pE9TJbe36KtBUgS+EI8/FRobLN0ezlXIn2rixFZgPO
 4YBXCd0wzbtCZGxcpAiACOo=
X-Google-Smtp-Source: APBJJlHzcsws0HnhCWDSlqL8LQbx4JfHTGvaLjmVda6PJ0CL8Pz4baGK1PtFu7//xFpUWiQtQeLxPw==
X-Received: by 2002:a05:6e02:f51:b0:346:5bd7:4a17 with SMTP id
 y17-20020a056e020f5100b003465bd74a17mr12677625ilj.17.1690938461267; 
 Tue, 01 Aug 2023 18:07:41 -0700 (PDT)
Received: from ?IPV6:2601:282:800:7ed0:211e:b7c4:92fe:76f4?
 ([2601:282:800:7ed0:211e:b7c4:92fe:76f4])
 by smtp.googlemail.com with ESMTPSA id
 a14-20020a92d58e000000b00348d41ffd13sm4164159iln.85.2023.08.01.18.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 18:07:40 -0700 (PDT)
Message-ID: <3fa4d25d-7fea-d25b-fa83-4ada2c550725@gmail.com>
Date: Tue, 1 Aug 2023 19:07:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jasowang@redhat.com, netdev@vger.kernel.org, brouer@redhat.com,
 jbrouer@redhat.com, john.fastabend@gmail.com, linux-kernel@vger.kernel.org
References: <20230801220710.464-1-andrew.kanner@gmail.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <20230801220710.464-1-andrew.kanner@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/1/23 4:07 PM, Andrew Kanner wrote:
> @@ -1594,7 +1597,13 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
>  	if (zerocopy)
>  		return false;
>  
> -	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
> +	rcu_read_lock();
> +	xdp_prog = rcu_dereference(tun->xdp_prog);
> +	if (xdp_prog)
> +		pad += XDP_PACKET_HEADROOM;
> +	rcu_read_unlock();


since you do not care about the actual xdp_prog (only that one is set) I
believe you can use rcu_access_pointer here.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
