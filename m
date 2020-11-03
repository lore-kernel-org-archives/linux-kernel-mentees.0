Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B4FC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 14:47:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FC2223C6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 14:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwWKS5Po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FC2223C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F9C486102;
	Tue,  3 Nov 2020 14:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8WmyNRvaFAf; Tue,  3 Nov 2020 14:47:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C4E6861A3;
	Tue,  3 Nov 2020 14:47:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA22C0889;
	Tue,  3 Nov 2020 14:47:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1571C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C936587256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jr05v2YrWGPk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 14:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 052DD8724E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 14:47:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j18so14400811pfa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 06:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4cd0RzlPCR9nOGO4PnuCzpjjKTSYq9sh5G8Ujtnm9oo=;
 b=cwWKS5PokFktGTOhW3PpIKjwGggFdZuSRLx+XmowTk797J3/G/xIezAXlLaNr5W6u7
 B+E0WylrVOZLHgQRH5LUZpZ0i05j3750SL+nfY/KYhurV8OkFqO058GcNJC/hMsz2N1G
 W7rw5oiXAdLCW31HkRMsjMTL5szjfz5twZxmo6p0cYcB1q/Zbs4XaRixA1vUwySKk2ue
 MaGhFAHtEh+wD3JdSPGHbef2vZk4ROSdNxURf87e9d61B0+5lI0egirW9TYLZEwwp1a7
 ZTxqiC101nzQ+deIFC66TaEwK/3j/QUbrKeRJzzOqjoIjBX3/ypCBiiJPDccoSoSR4tq
 0VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4cd0RzlPCR9nOGO4PnuCzpjjKTSYq9sh5G8Ujtnm9oo=;
 b=HzpSNh7HS/9dl6e7ghhtzLDzG7b/Dq4/kolWZvmPKptKvR/NpcvyNoEKR3EMnl6nS0
 5L//MuMGUuP2ER/HrK2rfN4s/ZMjO5539mBx8S9Oy50C02f/LslD8jqUFw8/e8LOO7+w
 JYbCOtG4yGbfZz3VgdxZhhH+7KXKhv6eisLyACh9SFT9dAtq+JTm2I94n/mX+ueXOLnf
 VP6IK0gshwRcIEnG5KfgDbioOijZjQgzKgHj0QkMqHVh+0pISN5d8MkHT6ones2y61lq
 7uP7S+/K98YiFme6ECIJ5zl2CFAWpI1vHTWUDPsgIxUhJvfNH1rs+CbCoOYF7qrmr45J
 8m3Q==
X-Gm-Message-State: AOAM530/+EIDYUzWwX0/c1VYZTLinHR09F6EtoqREZr4E0e6EYU2L8Uu
 GkBnPtzgIYHodllFo59H2aXpe6b9KDa7iA==
X-Google-Smtp-Source: ABdhPJyy58+y5Mk2RScOhB2jgrnmykvyCJZ19mZrAnqKT9BPp58LQlKzMAscutZPlE02gsysNc9zQg==
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad17 with SMTP id
 y17-20020aa79af10000b02901526101ad17mr26449074pfp.25.1604414847962; 
 Tue, 03 Nov 2020 06:47:27 -0800 (PST)
Received: from ?IPv6:2402:3a80:41d:f163:ac:13ab:8c6a:34ab?
 ([2402:3a80:41d:f163:ac:13ab:8c6a:34ab])
 by smtp.gmail.com with ESMTPSA id g85sm17340886pfb.4.2020.11.03.06.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 06:47:27 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201103133052.21053-1-yashsri421@gmail.com>
 <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
Date: Tue, 3 Nov 2020 20:17:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

On 3/11/20 7:09 pm, Lukas Bulwahn wrote:
> On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently, checkpatch warns if the author signs-off two or more times
>> for the same role.
>> E.g., for commit 6dd47d9754ff ("mac80211: fix
>> ieee80211_txq_setup_flows() failure path") we get warning:
>>
>> WARNING: Duplicate signature
>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>>
>> Here there are two Signed-off-by lines present for the same user. So,
>> we get a warning to remove one.
>>
>> Similarly, we get warning if the author of the commit signs-off under
>> co-developed-by.
>> E.g. for commit 6e88559470f5 ("Documentation: Add section about
>> CPU vulnerabilities for Spectre") we get:
>>
>> WARNING: Co-developed-by: should not be used to attribute nominal
>> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
>> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
>>
>> Provide fixes by removing the duplicate signature line and the
>> co-developed-by line from the commit
>>
> 
> 
> The duplicate signature fix is simply wrong, because the indication of
> the duplicate signature is imprecise.
> 
> Probably, we would first really need to understand the valid cases of
> duplicate signature warnings compared to the invalid ones.
> 
> Please rework.
> 
> 
> Lukas
> 

Oh, Alright. I get it now.
I ran a script over WARNING: Duplicate signature.
I found out that it is occurring with these prefixes and their
frequencies:

Acked-by -- 6
Signed-off-by -- 218
Tested-by -- 3
Reported-by -- 1
Reviewed-by -- 8
Cc -- 28

IMO largely Signed-off-by warnings in this frequency might be false
positives. This is so because we are simply checking for duplicate
occurrences in the sign-offs in checkpatch.pl

> Probably, we would first really need to understand the valid cases
> of duplicate signature warnings compared to the invalid ones.
>

Is there any way I can know that the second sign-off is intended?

In my observation, this particular commit was prefixed by '^Link:.*$'
Alternatively, we could use maintainers list to ensure that the signer
is maintainer and avoid this warning.

How about other prefixes. Can we remove them?

I observed one of the 'Tested-by' warnings and it was because of these
sign offs:

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
Tested-by:Liang Yang <liang.yang@amlogic.com>
Acked-by: Liang Yang <liang.yang@amlogic.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Here tested-by is occurring 2 times.


> A patch shall only do ONE thing. I see two here.
I'll remove the fix for Duplicate Signature from this patch.


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
