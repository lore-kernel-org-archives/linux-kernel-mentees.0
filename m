Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 18:36:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB2360EE0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 18:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAB2360EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D0580D8D;
	Fri, 13 Aug 2021 18:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2YYUKT4bVMy; Fri, 13 Aug 2021 18:35:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C484080CCD;
	Fri, 13 Aug 2021 18:35:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7177C001A;
	Fri, 13 Aug 2021 18:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B6FFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC57E4073A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTzrs_IYFMEl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:35:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5456640540
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 18:35:57 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so17207751pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmQGD78Kcw/811yn6mUH04KRF7g+1f/MA8JMyFARSp8=;
 b=fYjRhvBx6STv2QBZ5CbB6ZRNsAObsuvKnveDQqyzBeyf3TOZQt+D6z10IMnbFszOLD
 QUNrOtfby3KNd9WrMmUKjCXqEf8eZ7OpGQEb4W6pzRd364n60aedEJtfET8IS22P5UPr
 lmXsEmYknMPWq5efDpQ8pJOIWx3KqJIeIAUTOLQEjW38F9Ile6Dy3trMG6cwzR1t3ugh
 9go6mbsUHAfYdCVgVsRNwpo1lfihXHwZT9Uer3ps9rVWLKF8CFENGS/Axq4kfo1rqJik
 TA5nBZcv826SkE3xW0p2hdtXo8eYYx9/ekOpeMTAlFwa2nDvx4k3mHC5TTSkcwlfYCpj
 1M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmQGD78Kcw/811yn6mUH04KRF7g+1f/MA8JMyFARSp8=;
 b=pHyhCFi08QfqO4Z9WssiAyBsyimMMl/er4H2PY3Aa0k6gGJrRNLcDDMACE2Bce48if
 hjA3XrelDZTrueo+1M887ML0P2rM5MJycPQe8BQ0d9f95Bnj+D4KFGsQKE7SSJsW4+3Z
 RfvRfNgRhycZeDehwB7cnp3V8DbYS9HahMnY7TlIkfS+vT0gBonq/hp10ub09pdqfNeZ
 JfqJkvWBfD9f4ms2bzCLBXtF3lWiatkZlJdwDPoLSjuR4bMZuhSMduWJ6PSs4dSS4+wa
 0wnhq8HD5MQNFVnXIlMWPKBYQSw2CKh42D08t9g0uv68nsSh4GvaoIIx2bg7M36QFtLV
 7Srw==
X-Gm-Message-State: AOAM53094MYX3SpBj36BfY0tLgGgLELKKdy5Ip9/tKD6CnCmQlRx+ia/
 kNtC9qkOTnyK/zHePi3FokQ=
X-Google-Smtp-Source: ABdhPJx3JDx6ePZBFHYocj6ckhh1x+sga4Ijv8RnrIzugNAfXq9reF3IdPBtXiWW04kzeewAoosHqA==
X-Received: by 2002:a63:de56:: with SMTP id y22mr1388284pgi.157.1628879756728; 
 Fri, 13 Aug 2021 11:35:56 -0700 (PDT)
Received: from [192.168.1.38] (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id d5sm2485792pju.28.2021.08.13.11.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 11:35:56 -0700 (PDT)
Subject: Re: [PATCH] tty: Fix data race between tiocsti() and flush_to_ldisc()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210807190513.3810821-1-phind.uet@gmail.com>
 <YRYgSZwivcPPMhrS@kroah.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <7323d825-f596-223b-a063-7539a6a57107@gmail.com>
Date: Sat, 14 Aug 2021 02:35:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRYgSZwivcPPMhrS@kroah.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com, jirislaby@kernel.org,
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

On 8/13/2021 3:33 PM, Greg KH wrote:
>>
>> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
>> Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
>> ---
>>   drivers/tty/tty_io.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
>> index e8532006e960..746fe13a2054 100644
>> --- a/drivers/tty/tty_io.c
>> +++ b/drivers/tty/tty_io.c
>> @@ -2307,8 +2307,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
>>   	ld = tty_ldisc_ref_wait(tty);
>>   	if (!ld)
>>   		return -EIO;
>> +	tty_buffer_lock_exclusive(tty->port);
>>   	if (ld->ops->receive_buf)
>>   		ld->ops->receive_buf(tty, &ch, &mbz, 1);
>> +	tty_buffer_unlock_exclusive(tty->port);
> 
> Did this fix the syzbot reported issue?
> 
> thanks,
> 
> greg k-h
> Yes, this fixed the syzbot reported issue.

The lock is grabbed in flush_to_ldisc() and paste_selection().
Actually, I follow the document in tty_buffer.c, where it say the 
callers to receive_buff() other than flush_to_ldisc() need to exclude 
the kworker from concurrent use of the line discipline.

And function tiocsti() has the following comment:
/* FIXME: may race normal receive processing */
that why I add lock in this function.

BR,
Phi.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
