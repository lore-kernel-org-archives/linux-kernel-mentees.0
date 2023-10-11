Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B050CD6E7F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 15:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A050F40761;
	Wed, 11 Oct 2023 15:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A050F40761
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JW/kPHiq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kaomECb0lP4; Wed, 11 Oct 2023 15:50:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 98865402F8;
	Wed, 11 Oct 2023 15:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98865402F8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8412BC0039;
	Wed, 11 Oct 2023 15:50:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3592C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA45402F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA45402F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OhIPVA7LqnN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:50:02 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41EE8402D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 15:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41EE8402D5
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so784704a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697039401; x=1697644201;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sDYBKIS55V1uI8CU7rsbxpgMy6trEjU+BP4wxaqMQ+0=;
 b=JW/kPHiqOTPzTTU6IOJc+gr58R08exly4BSmH29/e0I2M6/hB05zWJ6+jZMMLIK12X
 /WB6Kb7Dh1WJlhahfG9uC2ePfMhXDoQh1PESVyG0iTd+IRcZGhoDz26N6czQ5pKafjS8
 nD0LYfei99mUBkZc6gWtxkSQzl1s8R/e/yMDhkmxnc2NqZ5likmySsOgyzqJyp0wFdaa
 Dqf5rTp2XLalzmQuhMUTCPYdiiuB92e9ODhLg3F/YB9DsVc3cbVDqTwCMh5jkjUt4Y8j
 Vx+dcP1B46AH8jkVte6avWzYyHT6Tm8t1qrdThrb7ykVsAhYYvjCkVGIElF7751cVd31
 5S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697039401; x=1697644201;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sDYBKIS55V1uI8CU7rsbxpgMy6trEjU+BP4wxaqMQ+0=;
 b=wGYq/M/gD/Z098vEoxuc0Ey/XQEna0EiNMVCyobR6fVcUP4s9Q9jMNz2+J6dFGYFr+
 dQlpcK0ID3P3NrfeOIv+6/b9xifQFj7uaG1bH8WF1HDsX/oM+eBJYTKGbld/lkC+QGku
 2n+l5CJCQkRytS71WRzXDT/bAWor+jgsnIwPktJvrcfgTPqvbU1b2PuaAthrhE0A6gPv
 iTJtJor6JCpp8j8OwTwy1q48ww5qqvzHOHYBL6Myi1ywM6Rx+g9d1UC2ljDuQKDYAbzm
 pDF/nrxJgJeBp0+4FljEfxQOdpY83936qtxew9x6+xiP0AWaiNb3wY3xIDxRgrv+CW7t
 m0yw==
X-Gm-Message-State: AOJu0Yyv+p5KoLpAUPLNfDzm2awLEvfUkaXuzGCsTHgTJxTp4nxxFBgH
 6/rYMV86XeZSJDD4knPe43w=
X-Google-Smtp-Source: AGHT+IHEXzo3nG4oHvAYaUxMtuOcdqDQ+lFQZSBrGVmbjQPPHV2ObamtR1Pq50KuZb10ox7FWz/T5A==
X-Received: by 2002:a17:90b:1496:b0:27c:f88f:11a5 with SMTP id
 js22-20020a17090b149600b0027cf88f11a5mr3826613pjb.2.1697039401382; 
 Wed, 11 Oct 2023 08:50:01 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 mz14-20020a17090b378e00b0027722832498sm59877pjb.52.2023.10.11.08.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 08:50:00 -0700 (PDT)
Message-ID: <3073e9a6-9f10-4326-9734-7e203d509888@gmail.com>
Date: Wed, 11 Oct 2023 21:19:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove extra unlock for the mutex
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231010224630.238254-1-singhabhinav9051571833@gmail.com>
 <2023101136-irritate-shrine-cde6@gregkh>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <2023101136-irritate-shrine-cde6@gregkh>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
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

On 10/11/23 12:00, Greg KH wrote:
> On Wed, Oct 11, 2023 at 04:16:30AM +0530, Abhinav Singh wrote:
>> There is a double unlock on mutex. This can cause undefined behaviour.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   net/ipv4/inet_connection_sock.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
>> index aeebe8816689..f11fe8c727a4 100644
>> --- a/net/ipv4/inet_connection_sock.c
>> +++ b/net/ipv4/inet_connection_sock.c
>> @@ -597,7 +597,6 @@ int inet_csk_get_port(struct sock *sk, unsigned short snum)
>>   	}
>>   	if (head2_lock_acquired)
>>   		spin_unlock(&head2->lock);
>> -	spin_unlock_bh(&head->lock);
> 
> How was this tested?
> 
> And where is the now-needed unlock of the head->lock?
> 
> How was this change found?
> 
> And your subject line needs a lot of work...
> 
> thanks,
> 
> greg k-h
Hello, I used sparse tool and got it this warning message "warning: 
context imbalance in 'inet_csk_get_port' - unexpected unlock"
Due to my over excitement of sending a good patch to kernel I didnt see 
correctly and misread `head` as `head2` and thought it was double 
unlocking the mutex. I m very sorry. But on a different note think we 
should do a check for `head->lock` as well before unlocking. Unlocking a 
non locked mutex can also trigger a undefined behaviour.

Thank you,
Abhinav Singh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
