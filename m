Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4BC0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Aug 2023 10:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5376460FE4;
	Wed,  9 Aug 2023 10:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5376460FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmAg7_pUInxu; Wed,  9 Aug 2023 10:40:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3DC5360A6D;
	Wed,  9 Aug 2023 10:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC5360A6D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24132C0071;
	Wed,  9 Aug 2023 10:40:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32326C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 10:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1387241875
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 10:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1387241875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ef-FP6qq-S7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 10:40:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1B6F4182C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Aug 2023 10:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B6F4182C
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5234b80e9b6so1912476a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Aug 2023 03:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691577647; x=1692182447;
 h=content-transfer-encoding:in-reply-to:subject:from:references:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EvuJQXSSe40cX5NGFg9VHgGjEbwnqu6g+etQ9ZRA9zE=;
 b=IxYV1OeKGB3hHtLcLp2fH7npA8RVO7B3gL7YTm+lHiTV6APwPYgNbhNHDLefzphj40
 1uMRoGU8ytA55StgLwIcKqRWdf5QkA0YUVsuhGq1HfJlLL1Ae0SBG/xXr8CXrmQ6HNWh
 8O3BK+drlxIrIpUOMy9SKdgoOMDUYW0Jadjy3e0ZHE307kn3GkRZms8kL7wxAwoDIUS3
 jv1dR4pmruzc0llwDYJGVWXt6zH1eRX59BD9dt3iY7I2y8Xu1JeQXFEProEwWAMQgNm0
 iIrf+BjqIlkESS130YvqJggnHFlot7BlQyBVh3cagtAij8dlnWjUh5sTmoOLY7WWZ0Am
 amag==
X-Gm-Message-State: AOJu0YzCr4irdwxmzE3KUexmkQ3+zQarhJJOT3wQAvWqDH/yWCbqf7wx
 IzBZywxyU7ME3PiaUKCJK0A=
X-Google-Smtp-Source: AGHT+IGDSDK5w8O5A3SdecdKs9LGC7ETkSOUvMv8G6a5/4GTAq45utbrK+TufQQoNAicLfDDzLJG+A==
X-Received: by 2002:aa7:c0da:0:b0:522:2b24:cf6 with SMTP id
 j26-20020aa7c0da000000b005222b240cf6mr1437954edp.42.1691577646894; 
 Wed, 09 Aug 2023 03:40:46 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056402134500b005233647bc4csm4580155edw.59.2023.08.09.03.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 03:40:46 -0700 (PDT)
Message-ID: <83f73eda-829d-2657-9f10-8ccf78522e5a@kernel.org>
Date: Wed, 9 Aug 2023 12:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: mickflemm@gmail.com, mcgrof@kernel.org, kvalo@kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
 <92a26f67-1b24-ea35-2f39-7c0b75027617@kernel.org>
 <20230808194258.ocxnmqwzqlr6jpe4@mmaatuq-HP-Laptop-15-dy2xxx>
From: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] ath5k: fix WARNING opportunity for swap.
In-Reply-To: <20230808194258.ocxnmqwzqlr6jpe4@mmaatuq-HP-Laptop-15-dy2xxx>
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

On 08. 08. 23, 21:42, Mahmoud Matook wrote:
> On 08/08, Jiri Slaby wrote:
> 
>> On 07. 08. 23, 22:10, Mahmoud Maatuq wrote:
>>> coccinielle reported the following:
>>> ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()
>>
>>
>> OK, once again:
>> https://lore.kernel.org/all/0c3acbd4-6ab2-5cc5-6293-54e30093cce2@kernel.org/
> 
> 
> I had a look at the commit history, to see why the original developer
> didn't use sort() function, and name the array variable sort but found
> nothing.
> I have some doubts that he might did that intentionally, so not to call
> sort() function for such small array

It happens once in 10 s and in a work. No worries about that.

> and avoid the cost of context switching.

What context switching?

>>> diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
>>> index 5797ef9c73d7..f87eb684f223 100644
>>> --- a/drivers/net/wireless/ath/ath5k/phy.c
>>> +++ b/drivers/net/wireless/ath/ath5k/phy.c
>>> @@ -1562,16 +1562,13 @@ static s16
>>>    ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
>>>    {
>>>    	s16 sort[ATH5K_NF_CAL_HIST_MAX];
>>> -	s16 tmp;
>>>    	int i, j;
>>>    	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
>>>    	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
>>>    		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
>>>    			if (sort[j] > sort[j - 1]) {
>>> -				tmp = sort[j];
>>> -				sort[j] = sort[j - 1];
>>> -				sort[j - 1] = tmp;
>>> +				swap(sort[j], sort[j - 1]);
>>>    			}
>>>    		}
>>>    	}
>>
>> -- 
>> js
>> suse labs

-- 
js
suse labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
