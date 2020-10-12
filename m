Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14FFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 09:18:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211FC206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 09:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pxf91ZAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 211FC206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9537F204EC;
	Mon, 12 Oct 2020 09:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xm9x8Xqr2Peg; Mon, 12 Oct 2020 09:17:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C5CF20474;
	Mon, 12 Oct 2020 09:17:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81382C07FF;
	Mon, 12 Oct 2020 09:17:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40FBAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C07B872A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjLUVFwKPTgt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:17:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B172F87285
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:17:55 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j7so2894678pgk.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ov3FUKrNTHLpkrGh5RLsSQkZzOmYXtgceijebKP/orE=;
 b=Pxf91ZADA3kHjPOTZCRMhqikUJb6PIBg3jJeAbwA/Hf8O18uGy2b0oXYhxlV/BTduC
 n/djlhrL8iuzGzI7fyqZRmsCzqHugC0fvDI6OpfiJFg7FdKqYnTdmoeIF/AlzDZ5fUEA
 cBaj2zgLb7ITgxsXWhbRAPzZnTFP+3UHN2w9KWALiaD2FJ2TbDn2oT4W3M8DfHtf1FkF
 Nx7OVH7Z4k3RDHxutTwnSsOZ18/lCgUUtzsjLalW1qCDcBlrMHA60QSMgpW29f0Yhhdx
 Z8VjKTKEySkDlq43+F+xVpHzakF9ZASwJtHFB/iKmb1BZkItovGokmMJMfOIrigkWNRN
 Xe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ov3FUKrNTHLpkrGh5RLsSQkZzOmYXtgceijebKP/orE=;
 b=ssqGvHdov3vdqfUqYH26uQC/6BhMjIl5RbtZVBZZBXCuiya/CihJXWnr7qVbjVPCyM
 a4Y/YE7+aeT4U/5o3/vVMGOIvfBeJVj9gZJLsQbd/5CHhmAZD9PhTpyMQjg9LzDo2I6e
 8LE8enJny1z/4oGqC0mW40Alb1cMxJQXAasAp/Mmy7tx4EbbPPqUW2U0CsRSu+APtPQ3
 RD+Ehwb5wt8tg8BohOyJXlxZnURMGd+p119gBm1KJ734m7P1X6nEjhCdTjNAqlDeLgvT
 ctXAVuIhgvLr1nkZktsbE2lWSXPpBydon+z/Ugl9vBFa+60KWiYhCUkyGz/Y+xLKCQiF
 aOfg==
X-Gm-Message-State: AOAM532attYjTGO5o/sDkjW6MECv779VciQS2NXuKagaOozApw/dp7dd
 XviPdCJz085bNuzFt8e+LQI=
X-Google-Smtp-Source: ABdhPJxxXGtyhYKNPjMn5KenHZwRXjmQMFBS4Ovr6doT1BbITKj2ygbJJBvg7ch/3u6iFxAfxHNPgg==
X-Received: by 2002:a17:90b:4d05:: with SMTP id
 mw5mr9039646pjb.9.1602494275069; 
 Mon, 12 Oct 2020 02:17:55 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id w205sm19514691pfc.78.2020.10.12.02.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 02:17:54 -0700 (PDT)
To: Dominique Martinet <asmadeus@codewreck.org>
References: <20201012042404.2508-1-anant.thazhemadam@gmail.com>
 <20201012075910.GA17745@nautica>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <147004bd-5cff-6240-218d-ebd80a9b48a1@gmail.com>
Date: Mon, 12 Oct 2020 14:47:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201012075910.GA17745@nautica>
Content-Language: en-US
Cc: lucho@ionkov.net, syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com,
 ericvh@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH net] net: 9p: initialize
 sun_server.sun_path to have addr's value only when addr is valid
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 12-10-2020 13:29, Dominique Martinet wrote:
> Anant Thazhemadam wrote on Mon, Oct 12, 2020:
>> In p9_fd_create_unix, checking is performed to see if the addr (passed
>> as an argument) is NULL or not.
>> However, no check is performed to see if addr is a valid address, i.e.,
>> it doesn't entirely consist of only 0's.
>> The initialization of sun_server.sun_path to be equal to this faulty
>> addr value leads to an uninitialized variable, as detected by KMSAN.
>> Checking for this (faulty addr) and returning a negative error number
>> appropriately, resolves this issue.
> I'm not sure I agree a fully zeroed address is faulty but I agree we can
> probably refuse it given userspace can't pass useful abstract addresses
> here.


Understood. It's=A0 probably a better that I modify the commit message a li=
ttle and
send a v2 so it becomes more accurate.

> Just one nitpick but this is otherwise fine - good catch!

Thank you!

>
>> Reported-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
>> Tested-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>>  net/9p/trans_fd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
>> index c0762a302162..8f528e783a6c 100644
>> --- a/net/9p/trans_fd.c
>> +++ b/net/9p/trans_fd.c
>> @@ -1023,7 +1023,7 @@ p9_fd_create_unix(struct p9_client *client, const =
char *addr, char *args)
>>  =

>>  	csocket =3D NULL;
>>  =

>> -	if (addr =3D=3D NULL)
>> +	if (!addr || !strlen(addr))
> Since we don't care about the actual length here, how about checking for
> addr[0] directly?
> That'll spare a strlen() call in the valid case.
>
You mentioned how a fully zeroed address isn't exactly faulty. By extension=
, wouldn't that
mean that an address that simply begins with a 0 isn't faulty as well?
This is an interesting point, because if the condition is modified to check=
ing for addr[0] directly,
addresses that simply begin with 0 (but have more non-zero content followin=
g) wouldn't be
copied over either, right?
In the end, it comes down to what you define as a "valid" value that sun_pa=
th can have.
We've already agreed that a fully zeroed address wouldn't qualify as a vali=
d value for sun_path.
Are addresses that aren't fully zeroed, but only begin with a 0 also to be =
considered as an
unacceptable value for sun_path?

Thanks,
Anant




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
