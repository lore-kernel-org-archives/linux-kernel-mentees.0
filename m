Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE45C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 16:09:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB3F61247
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 16:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BB3F61247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031464035F;
	Sun, 22 Aug 2021 16:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVjvsb3Zhoki; Sun, 22 Aug 2021 16:09:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1B2AF4034E;
	Sun, 22 Aug 2021 16:09:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6490C001A;
	Sun, 22 Aug 2021 16:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15D26C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 16:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC08F4034E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 16:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJV2-llQnYGY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 16:09:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 681C1402C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 16:09:11 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 ml14-20020a17090b360e00b0018de39d40bcso328283pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EKq4J+P9WdN9gMgFhOs0qE7BZf4JXJm9ADFF4uvbtIM=;
 b=df1833izIAIWxi1JwycL0Jvq5q/U9e7NkDVnmLknVuXMfSJU6UQ9VrY9Phv9YwgMGE
 tl6nvyThFWCALHLROVTqjviMjBToCg2Vl8t7LzAc8F3VwdLX+OgGo+EOmbfuXi9H4fE1
 bt+h5IBCW8tNO+k9ZFoXG9v42st4u8X6rIbiHl6/uMiBFT5p8cq9gKxH7zApbKU/IkJT
 c19GM/k725/T4V+vj2fh3SXRerw6cjPtXqGMQa0XbE5W4daofvxlweNPqr2XYro4nWes
 ArxZjXc+u/O+bgrE9WFCS+BfzV1DQIr9edyKp2dB+PaLIjfUrAs3kc68HaVJhuHcDrkA
 81EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EKq4J+P9WdN9gMgFhOs0qE7BZf4JXJm9ADFF4uvbtIM=;
 b=qgH34FCnnucZTN38aM3MkTlELDAWgm1dxAycLcxvq+HPMQWqANfLg6FxFVZOZZfeAK
 v7A108xBr4A0IbHPvEhJmb0KO3+7YjIa1NU3cGc/tkGYVGBphoHZWIOg7uJrfv0whcYx
 5tuW4u2w5jkFjXVAs2d2S7qN6OQAJWUqGDH1N3cSU2rwp3NZVwcWVip7LXbEAJle2f+W
 OtAfeOfOhjC7t0ObjGkTMQgrN23XhomiCnaf2NsK6GGleG9CzMnZreO6/JtOsZ7LCom+
 ykqh8/tZJIj3/6tGXjPp/0W/Wb2Y8E/Li5tJkY6DwVP2KJ3FJMienqL9x2YF1PXy1fMQ
 671g==
X-Gm-Message-State: AOAM532TKHI7zdwJvOwIf6SKUsyJT8U+8yiAiKceOfb0YKW3JUp+NM5r
 Qfe020NfcmA72VUF+iu81K8=
X-Google-Smtp-Source: ABdhPJxySxEOSeAfZ12QOApOT4B9osrMWf3NX3pJwrHzw1hKexEfltD/3Srjv8WWLtLES0esr/7rgg==
X-Received: by 2002:a17:90a:9f91:: with SMTP id
 o17mr15239894pjp.29.1629648550898; 
 Sun, 22 Aug 2021 09:09:10 -0700 (PDT)
Received: from [192.168.1.38] (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id j68sm15928962pgc.44.2021.08.22.09.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 09:09:10 -0700 (PDT)
Subject: Re: [PATCH] tty: Fix data race between tiocsti() and flush_to_ldisc()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210807190513.3810821-1-phind.uet@gmail.com>
 <YRYgSZwivcPPMhrS@kroah.com> <7323d825-f596-223b-a063-7539a6a57107@gmail.com>
 <YR0TRf+283ujBxbv@kroah.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <dd30778d-2b12-f784-d00e-3b977358e5da@gmail.com>
Date: Mon, 23 Aug 2021 00:09:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YR0TRf+283ujBxbv@kroah.com>
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

On 8/18/2021 10:03 PM, Greg KH wrote:
> On Sat, Aug 14, 2021 at 02:35:53AM +0800, Phi Nguyen wrote:
>> On 8/13/2021 3:33 PM, Greg KH wrote:
>>>>
>>>> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
>>>> Reported-by: syzbot+97388eb9d31b997fe1d0@syzkaller.appspotmail.com
>>>> ---
>>>>    drivers/tty/tty_io.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
>>>> index e8532006e960..746fe13a2054 100644
>>>> --- a/drivers/tty/tty_io.c
>>>> +++ b/drivers/tty/tty_io.c
>>>> @@ -2307,8 +2307,10 @@ static int tiocsti(struct tty_struct *tty, char __user *p)
>>>>    	ld = tty_ldisc_ref_wait(tty);
>>>>    	if (!ld)
>>>>    		return -EIO;
>>>> +	tty_buffer_lock_exclusive(tty->port);
>>>>    	if (ld->ops->receive_buf)
>>>>    		ld->ops->receive_buf(tty, &ch, &mbz, 1);
>>>> +	tty_buffer_unlock_exclusive(tty->port);
>>>
>>> Did this fix the syzbot reported issue?
>>>
>>> thanks,
>>>
>>> greg k-h
>>> Yes, this fixed the syzbot reported issue.
>>
>> The lock is grabbed in flush_to_ldisc() and paste_selection().
>> Actually, I follow the document in tty_buffer.c, where it say the callers to
>> receive_buff() other than flush_to_ldisc() need to exclude the kworker from
>> concurrent use of the line discipline.
>>
>> And function tiocsti() has the following comment:
>> /* FIXME: may race normal receive processing */
>> that why I add lock in this function.
> 
> As you are fixing this FIXME, please remove it in this patch, otherwise
> we will not know it is resolved :)
> 
> Can you add that to the change and submit a new version?
> 
Yes, I will submit a new version.

> Also, this should go to stable kernels, right?  Any idea how far back?
>
I have no idea about this question, but I see it meets specified 
requirements in stable-kernel-rules.rst

BR,
Phi.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
