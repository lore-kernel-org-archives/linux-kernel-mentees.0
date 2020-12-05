Return-Path: <SRS0=9kH0=FJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29D7C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 12:55:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465D022DFA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Dec 2020 12:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465D022DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA8FB86C6E;
	Sat,  5 Dec 2020 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQekYZSZVeWp; Sat,  5 Dec 2020 12:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32A7C86C67;
	Sat,  5 Dec 2020 12:55:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 194DCC0FA7;
	Sat,  5 Dec 2020 12:55:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5F31C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 12:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A23448769B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 12:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VH9gvIqYXnbJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 12:55:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CE8C875DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Dec 2020 12:55:24 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s2so4645818plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Dec 2020 04:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jccCTPX9VhL5a2HCkZ+hZzqNYA4bwr/fx20iblsQvxQ=;
 b=udldAPaYB3xIhdH1Dg90hV7/C0rScENP88UR5AD+PTa+81OdRmiZOZ0DGy+m1dG7ML
 +OChn2mFoaPBQu3gMpnaASzQTCQhL8KMeHlyg82EF9eq2ysBfALcNzRwe3wfo9Pe/gyh
 9Bj2vXY232oKW0zvVkT8iUiyytd1abqQDGtAp63oAdkgZ7mr9zgS0ExN9gSQJ9UoK73e
 ygh3jM98TVu3fOIlfDxo0kZgXYB9pF/h2cO7KMuMvXzMjXDiZCIJCmbzh04sITnp8v3q
 547eGxvs777gH7mdcbR9S0AfZFVlL+iW4HM7HLWIKB3jq1260SujB7iq6BodLKTxJbpM
 gahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jccCTPX9VhL5a2HCkZ+hZzqNYA4bwr/fx20iblsQvxQ=;
 b=E4hQuUMYYoYpvkDHuQ7iCtC8Rub/vnXSFjHppbhP2+tjjCAca9C/EFRk3bH8pTgys/
 o6DVIXQ7HsMbRJy6+G8Wl1zyjm7NbvzRbmrc1Ab7OqAuDciQ5yZbduM8RrGpa5IZrrid
 gStz4tKBSjfk5k0m4Xa2TCDWCM88xbmhDH3X6UuLsGSqReUoc5/z17RJLdSqgESHrvXv
 b9p6lA5lplO6pRzWj3GXJHmAYgON+B4UGcvaJiKU2q/6SpTyrgIOSFb2obP+TmF3YHJp
 rsnqHVQtLHoMtJqSey5KRwwN6/BeNhTrkTYQlknN5bLpFhPCI4kEyxekq/sXHytnNuk5
 +M8Q==
X-Gm-Message-State: AOAM531a2yI7eUt40xkv3KMaEy3Uyoh2zDY7gyjzOun/DOyaQ8xga1bU
 MBAqUjz5Jxvu8nff5am2P/HzEVSj0eYcPw==
X-Google-Smtp-Source: ABdhPJwlGVoj99/KpO+ODTm4FNwirRLr4NgiwdDEZUT8gdUdypX9kW94MDELGPBhonEUwf0mDTvSUA==
X-Received: by 2002:a17:90a:df10:: with SMTP id
 gp16mr8255948pjb.149.1607172923526; 
 Sat, 05 Dec 2020 04:55:23 -0800 (PST)
Received: from ?IPv6:2402:3a80:405:a0b2:f8e7:94b7:3acf:b58e?
 ([2402:3a80:405:a0b2:f8e7:94b7:3acf:b58e])
 by smtp.gmail.com with ESMTPSA id b37sm6719948pgl.31.2020.12.05.04.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:55:23 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
 <20201204144000.21734-1-yashsri421@gmail.com>
 <b9048b9c-22cb-fc47-8e87-1c091a9cc822@gmail.com>
 <7b8289150f47b1fe32fc85f2082a4b727f2b1664.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <43856cf4-c826-3fc7-1595-76734e535688@gmail.com>
Date: Sat, 5 Dec 2020 18:25:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7b8289150f47b1fe32fc85f2082a4b727f2b1664.camel@perches.com>
Content-Language: en-US
Cc: peterz@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 daniel@iogearbox.net
Subject: Re: [Linux-kernel-mentees] [PATCH v6] checkpatch: add fix for
 non-standard signature - co-authored-by
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

On 5/12/20 5:33 pm, Joe Perches wrote:
> On Sat, 2020-12-05 at 15:52 +0530, Aditya wrote:
>> On 4/12/20 8:10 pm, Aditya Srivastava wrote:
>>> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
>>> non-standard signatures.
> []
>>> The standard signature equivalent for 'Co-authored-by' is
>>> 'Co-developed-by'.
>>>
>>> Provide a fix by suggesting users with this signature alternative and
>>> replacing.
> 
>> we were planning to introduce a fix for
>> suggesting users to use "Co-developed-by" tag over "Co-authored-by"
>> and I noticed that you have earlier used "Co-authored-by" tag.
>>
>> We feel that users perhaps use this tag as they are unaware of its
>> standard equivalent tag, "Co-developed-by"
> 
> As I do not particularly approve of this patch,
> "we" does not include "me", nor is it I presume
> the royal usage.
> 
> Please specify who the "we" is here.
> 

Hi Daniel and Peter
Sorry to disturb you. Actually we (me and Lukas) were planning to
introduce a fix for suggesting users to use "Co-developed-by" tag over
"Co-authored-by" and I noticed that you have earlier used
"Co-authored-by" tag.

I feel that users perhaps use this tag as they are unaware of its
standard equivalent tag, "Co-developed-by"

Do you think that this fix will be beneficial for future users? If so,
can you please add your Acked-by to the patch?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
