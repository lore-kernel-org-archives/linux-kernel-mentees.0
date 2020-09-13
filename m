Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DC1C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 06:21:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCE62098B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 06:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akCmZ/9N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCE62098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D0A020411;
	Sun, 13 Sep 2020 06:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIMMc9G+dcZu; Sun, 13 Sep 2020 06:20:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D519A203E2;
	Sun, 13 Sep 2020 06:20:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6772C0859;
	Sun, 13 Sep 2020 06:20:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C2FAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 06:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6123285F8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 06:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2diau9JBnxS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 06:20:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D66AB85F8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 06:20:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z17so1346084pgc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oSqDnSurul1SEUdPfy/k5oKwDRKz1lqnIF0nSiq8EfM=;
 b=akCmZ/9Nebui2eLyF0x28+sRrco8/cMSEJFnvpd+8P7Jz1k7z6uC+PTbvU+vCuMe/p
 G6TUewI7fu6WEuZS2dD5zB34ER4PvygORHE0PlhW7oPEYdYuGTE5lmJHQAq8bm/wKDB6
 q3BgXkqy1X/241LZFPFK0mhssBxffFSR6pTqPSmyoCSmbjRg7HWiem1rEEH32431q3aF
 X42a3cxV0QVNsh/10z7MgsxANGWQDnZlBpAcGIB2Mv4kk/Aekh2ro8Jvt2EAj7/YdDJ4
 8dGcn9pAMtLqfDeLco0SRuIJmwSbFe0ocspsyywjzttDfKISum7YwLGdqnt/f8K9rj6A
 43tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oSqDnSurul1SEUdPfy/k5oKwDRKz1lqnIF0nSiq8EfM=;
 b=i9bEC759RKxyd3EUNs6uFIi0X1eIq07fEZ7ZM8f7vdaoSxh7tskch7DWeRzxzcPLDT
 JZ9TTkF4+LoSjMTuURAjhnighPgvZx0lBZDrcV7AesvKOU8CDIIbuCp96jQRNGR9V69E
 zwPTVeYfNNF1gEZiPF7aMVl6IcpXPknNECaUY/5Vi8hFxtFktYlkkWdplkXkiUTxqnVi
 OiMNP6fbvkkmfJiAw2gbq1Jsl0gYcQ2H2t60RuVIuQ+AxJMCh7HFSQVtS9k8av/Zcl25
 5sQGMrIZNqeTeUWSlf8QrgxbGs2ENkBxR2I/FRuq0IsJtXMbVz2UEe1n1q7/My0sjbvj
 9CAA==
X-Gm-Message-State: AOAM530kkFOdwePdvyfnhM0qYQlBOuYn/SEXXrfIcdkOf9mBYaQ03AwK
 tf86AohVG2uLgBErmKR1WcB0njoyyI7tedyaP7g=
X-Google-Smtp-Source: ABdhPJwp5fFXpDXs+77u4RzzJOB/E/gElAzOw+O6qZWhP8oGIspsUZNfxr6ClFMkE+oplQc/U6Sj5w==
X-Received: by 2002:aa7:9892:: with SMTP id r18mr8741441pfl.107.1599978056909; 
 Sat, 12 Sep 2020 23:20:56 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.209.61])
 by smtp.gmail.com with ESMTPSA id x9sm7031293pfj.96.2020.09.12.23.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 23:20:56 -0700 (PDT)
To: Greg KH <greg@kroah.com>
References: <20200913055639.15639-1-anant.thazhemadam@gmail.com>
 <20200913061351.GA585618@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <89526337-9657-8f4d-3022-9f2ad830fbe9@gmail.com>
Date: Sun, 13 Sep 2020 11:50:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200913061351.GA585618@kroah.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: fix uninit value error in
 __sys_sendmmsg
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


On 13/09/20 11:43 am, Greg KH wrote:
> On Sun, Sep 13, 2020 at 11:26:39AM +0530, Anant Thazhemadam wrote:
>> The crash report showed that there was a local variable;
>>
>> ----iovstack.i@__sys_sendmmsg created at:
>>  ___sys_sendmsg net/socket.c:2388 [inline]
>>  __sys_sendmmsg+0x6db/0xc90 net/socket.c:2480
>>  
>>  that was left uninitialized.
>>
>> The contents of iovstack are of interest, since the respective pointer
>> is passed down as an argument to sendmsg_copy_msghdr as well.
>> Initializing this contents of this stack prevents this bug from happening.
>>
>> Since the memory that was initialized is freed at the end of the function
>> call, memory leaks are not likely to be an issue.
>>
>> syzbot seems to have triggered this error by passing an array of 0's as
>> a parameter while making the initial system call.
>>
>> Reported-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
>> Tested-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>>  net/socket.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/net/socket.c b/net/socket.c
>> index 0c0144604f81..d74443dfd73b 100644
>> --- a/net/socket.c
>> +++ b/net/socket.c
>> @@ -2396,6 +2396,7 @@ static int ___sys_sendmsg(struct socket *sock, struct user_msghdr __user *msg,
>>  {
>>  	struct sockaddr_storage address;
>>  	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
>> +	memset(iov, 0, UIO_FASTIOV);
>>  	ssize_t err;
>>  
>>  	msg_sys->msg_name = &address;
> I don't think you built this code change, otherwise you would have seen
> that it adds a build warning to the system, right?
>
> :(
My apologies. I think I ended up overlooking the build warning. Thank you for pointing that out.
If everything else looks good, I'd be happy to send in a v2 that fixes this build warning.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
