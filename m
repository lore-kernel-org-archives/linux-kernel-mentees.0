Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9942C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Aug 2023 04:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29BD660804;
	Sat, 12 Aug 2023 04:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29BD660804
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y0b40I54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbQLD9Qtmwel; Sat, 12 Aug 2023 04:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AA19F60810;
	Sat, 12 Aug 2023 04:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA19F60810
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79940C0071;
	Sat, 12 Aug 2023 04:57:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9CC8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Aug 2023 04:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7112182060
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Aug 2023 04:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7112182060
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Y0b40I54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBTrSAblmSZ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Aug 2023 04:57:09 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F6A882045
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Aug 2023 04:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F6A882045
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e8c4so23225505e9.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Aug 2023 21:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691816227; x=1692421027;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WgqIkLkub4eHxHReFBW8WNmllVH5KUIYHbD1VTbSRzs=;
 b=Y0b40I548mOCcSdOBW1Y1cDfp1wSd+FO7Zg2yR9slRNRo4nwoS65nefcwDHJw0NxrF
 rXL0AqFkV7NR10HfDAHRh6LKZP9ysnePUOWruOAvT4+vABJafiZtcb63Qs8bZjv53Gvf
 3IlYf8RvWFM2EnEObPiiRSOM5GetjM3fAgkHSidcZGbqtoWMU449ejQLojFxn5jNkqER
 vPUJUQPbsLjBRo2pd4Al5isZ6pq4RHIAOjcdSSBIUkrod3BlodqdK/K82a/BfMydXaYU
 DYxT4Uckqf3oOfNmZZGxy3qJX/EV3PUsIA2NawBJ5jxM+UjoMmlcmwmhInnC0ZbrQPpw
 joew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691816227; x=1692421027;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WgqIkLkub4eHxHReFBW8WNmllVH5KUIYHbD1VTbSRzs=;
 b=BIRjxjE01tl4M9wkaRuEx0ooF/ESsO0AyRYj3VzyusixSby8SijY8yv1bgPa8XU9lp
 c5kpRGZao9MILqaMrklqclgUt7coaTXMWlZMLbQcTXT2K9g4wZ+K1hopaXhA/4RRoWCi
 sRL0J1djhLokds8uUrI+WMi1zBH0spNwmme4ijhuZkZXSB+1EgwkasBnjYWRfN5GBDhf
 bHNaOf8/p0J98kqEYoau5l9AV51IS0+U+YBFO3yHuPz6krizZTsGO1Due4i38tTJ+ZsH
 4SaI6hZgJhsFBcmeCiTZZCNY3WXNs+HTt8SHmJHOCGOFlYBrIw+CiWU6Dfmq6/3GrqYd
 2B8Q==
X-Gm-Message-State: AOJu0YzPGqgvK/W8qVlo72+1lBEFDTY6tMOvLSDtMVSNMxbZ2G6zpbi7
 ygxgu+VzmVx1HgFG2SKIXls=
X-Google-Smtp-Source: AGHT+IHsD7B35EAOq9G3nAXsQjp6ojolRnbIUjzlKPOq3wniPNfmeOz40kue9w5Q017etvxgBRsXnw==
X-Received: by 2002:a05:600c:214d:b0:3fc:62c:8275 with SMTP id
 v13-20020a05600c214d00b003fc062c8275mr3057637wml.35.1691816226548; 
 Fri, 11 Aug 2023 21:57:06 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:15aa:d:47bf:868:52f2])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a7bca48000000b003fa96fe2bd9sm10155580wml.22.2023.08.11.21.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 21:57:06 -0700 (PDT)
Date: Sat, 12 Aug 2023 08:57:01 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>, mickflemm@gmail.com,
 mcgrof@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, mahmoudmatook.mm@gmail.com
Subject: Re: [PATCH] ath5k: fix WARNING opportunity for swap.
Message-ID: <20230812045701.erg57tzebp4nebpo@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: Jiri Slaby <jirislaby@kernel.org>, mickflemm@gmail.com,
 mcgrof@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
 <92a26f67-1b24-ea35-2f39-7c0b75027617@kernel.org>
 <20230808194258.ocxnmqwzqlr6jpe4@mmaatuq-HP-Laptop-15-dy2xxx>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 08. 08. 23, 21:42, Mahmoud Matook wrote:
>> On 08/08, Jiri Slaby wrote:
>> 
>>>> On 07. 08. 23, 22:10, Mahmoud Maatuq wrote:
>>>> coccinielle reported the following:
>>>> ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()
>>>>
>>>>
>>> OK, once again:
>>> https://lore.kernel.org/all/0c3acbd4-6ab2-5cc5-6293-54e30093cce2@kernel.org/
>> 
>> 
>> I had a look at the commit history, to see why the original developer
>> didn't use sort() function, and name the array variable sort but found
>> nothing.
>> I have some doubts that he might did that intentionally, so not to call
>> sort() function for such small array

> It happens once in 10 s and in a work. No worries about that.

if it's the case so make sense to use sort().
but should I send the modifications on the same thread?
as the subject needs to be changed.
ex: repalce double loop with sort function
    replace bubble sort with heap sort. 

>> and avoid the cost of context switching.

> What context switching?

I used the wrong expression, I meant function call overhead 
e.g store/load registers.

>>>> diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
>>>> index 5797ef9c73d7..f87eb684f223 100644
>>>> --- a/drivers/net/wireless/ath/ath5k/phy.c
>>>> +++ b/drivers/net/wireless/ath/ath5k/phy.c
>>>> @@ -1562,16 +1562,13 @@ static s16
>>>>    ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
>>>>    {
>>>>    	s16 sort[ATH5K_NF_CAL_HIST_MAX];
>>>> -	s16 tmp;
>>>>    	int i, j;
>>>>    	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
>>>>    	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
>>>>    		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
>>>>    			if (sort[j] > sort[j - 1]) {
>>>> -				tmp = sort[j];
>>>> -				sort[j] = sort[j - 1];
>>>> -				sort[j - 1] = tmp;
>>>> +				swap(sort[j], sort[j - 1]);
>>>>    			}
>>>>    		}
>>>>    	}
>>>
>>> -- 
>>> js
>>> suse labs
>
> -- 
> js
> suse labs
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
