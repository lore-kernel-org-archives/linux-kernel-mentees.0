Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MALFORMED_FREEMAIL,MISSING_HEADERS,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F82AC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 08:14:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07252074B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 08:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdeY9ESV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07252074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 70D3420420;
	Mon, 14 Sep 2020 08:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hmz5Wwto2Tps; Mon, 14 Sep 2020 08:14:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 17582203DD;
	Mon, 14 Sep 2020 08:14:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC01DC0864;
	Mon, 14 Sep 2020 08:14:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70EB3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 66E2E86816
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hr0PjsxN5TB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:14:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BF792867C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:14:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f18so11958475pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=bfli47mnxZDlXaGAUiz/B4BePF6dibgax6S36KEh7f4=;
 b=kdeY9ESVzVF3+Q6NsEEiLky675RJZcJrgdbApwJCmCHBtL7313VB4m9S5+i0VzTw88
 bZ0kMDArw06QERzUQsSi0r1vl1cU+woa+Q9BRtv8/SZx5BEJB8BGWRABc5K1dM30Hs4W
 zC9iiuZAaBQsnSzyl7MfPCZjqo1evsYA3NaDIqgKnVFyN3PzuC3ADX+FlwnJQyYeVCkU
 tTIF+aoR0ZYofD/SybDOFNK8T2C2rjQAJpkTRbni7lHynXleLjYXo5uK7tsvBLE4ZYAK
 7D4735Eu/et6kLghLJLCBKHECP9Y2/jC1CR4XlN8m9oIyS1nLv7cVr1iS5YFaCg+t8Tp
 ZsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bfli47mnxZDlXaGAUiz/B4BePF6dibgax6S36KEh7f4=;
 b=eHjHdjQxvmBpnL1HkXDBfnVcJtIRrGI7KWwIDlLKgLmtDCy7YEYLG7NYgW24OrmETB
 31keITo4Ht4n74zFPs6JBPjKuHTNDRWm5jr2BhIaRecLJ2x9B9Q2bOef7sTLdwyE9WLy
 hYFXgiXDcfOjPx5/4n9ZBRinFXYpQSpznjLT5TmuZWzSMyFIBkqnqaJqJ9JYaB1JZsLD
 tF6ywheDSmIIh3RHRYyijcPooGIXdbSGOA/TC8Mxkc4jIAMY0NcXO/5O0E+f7M3l1LCg
 9gL2WZk/coHcrNh6IMzK8A7pa3EmyijLapH4OqLsk3PHzez1QnnuCFm4e3Dg/FX3NqLR
 dgDA==
X-Gm-Message-State: AOAM531nyyKHy8Xmc1aYXwcL6tFsNwvk1/4orqjaQYOF4SaVIvqlC0oR
 FAtVZuyq+IMfG2em63z8SUo=
X-Google-Smtp-Source: ABdhPJzHNbDE2odrsmXsPmIzt3RbJsasIL/ZT1Zm5k9b+IkFKJBzCceoAXBYaAN1lNntaO0Y4OaFcg==
X-Received: by 2002:a17:902:ec03:: with SMTP id
 l3mr13677394pld.56.1600071282105; 
 Mon, 14 Sep 2020 01:14:42 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.209.61])
 by smtp.gmail.com with ESMTPSA id m25sm9286567pfa.32.2020.09.14.01.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 01:14:41 -0700 (PDT)
References: <20200913110313.4239-1-anant.thazhemadam@gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <6adeef07-7dcb-3d05-df26-204a9d43301c@gmail.com>
Date: Mon, 14 Sep 2020 13:44:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200913110313.4239-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: fix uninit value error
	in __sys_sendmmsg
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


On 13/09/20 4:33 pm, Anant Thazhemadam wrote:
> The crash report indicated that there was a local variable;
> ----iovstack.i@__sys_sendmmsg created at:
>  ___sys_sendmsg net/socket.c:2388 [inline]
>  __sys_sendmmsg+0x6db/0xc90 net/socket.c:2480
>
>  that was left uninitialized.
>
> Initializing this stack to 0s prevents this bug from happening.
> Since the memory pointed to by *iov is freed at the end of the function
> call, memory leaks are not likely to be an issue.
>
> syzbot seems to have triggered this error by passing an array of 0's as
> a parameter while making the system call.
>
> Reported-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
> Tested-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> Changes from v1:
> 	* Fixed the build warning that v1 had introduced
>  net/socket.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/socket.c b/net/socket.c
> index 0c0144604f81..1e6f9b54982c 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -2398,6 +2398,7 @@ static int ___sys_sendmsg(struct socket *sock, struct user_msghdr __user *msg,
>  	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
>  	ssize_t err;
>  
> +	memset(iov, 0, UIO_FASTIOV);
>  	msg_sys->msg_name = &address;
>  
>  	err = sendmsg_copy_msghdr(msg_sys, msg, flags, &iov);
It has since been determined that this patch is incorrect, and even if it were correct,
provides a huge performance overhead, that is not welcome. Kindly ignore this patch.
Sorry.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
