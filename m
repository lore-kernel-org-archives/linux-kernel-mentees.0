Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD1AC34022
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 21:33:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCE8224656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 21:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cYcZaClt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCE8224656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74E3B84519;
	Wed, 19 Feb 2020 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ids5CLNqXNDB; Wed, 19 Feb 2020 21:33:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB39844A1;
	Wed, 19 Feb 2020 21:33:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0753FC1D81;
	Wed, 19 Feb 2020 21:33:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4853EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37105844B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2UxfWAYBFcW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 69DE2844A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 21:33:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so2264391wrw.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 13:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yDc3+2LTXdeT4DFS6yiHXemjisG4SKrPsn7wcWKNyc0=;
 b=cYcZaCltkuSpbD/WoHJZ+CIv9gG+julOvJ1jka7rOBCY5GMl9cks8jtPmd4v6WArov
 1mHzdIUClTgGLHl2fqzIiUqoBc8skRZLZ8VCXOzUhSxYUtPRmmsLAY/U0BJ56qUcmUmH
 RCcTREkweJYOkTucwK/nzuiNGNow0+L6tS9qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yDc3+2LTXdeT4DFS6yiHXemjisG4SKrPsn7wcWKNyc0=;
 b=RfytfGW1QAfogjsmqLkKD5VGrT4Rk/tXzIK6Z9y0oEoknJLylvOLTQxTyJmSeuB8Zj
 UewjCg4cB94jMjW6PZtaYMP608MRTmHmboVkMz47rE2Wjsjs2gjcdm0gMhxHt42iYSUZ
 BvW5YEKg7U+0GxulLCv77hjxci8xkmIY78UkjbxCRTTGeptInWNC4wVmqGKhjzrf9259
 R16grytw/RUat9TQkiAC5L9VrV42K7E4IHbTKcPgodKIH3qrtD5x7RS3JsCdkhWnrNRI
 XYbvS0vSBDSKZ2cXC/lkwoAa63Pej+z9Fi+LvWszCELA4Ey+YPaRdi+RuAOVWh7kk5I4
 MTQQ==
X-Gm-Message-State: APjAAAVwJ2FvA4hBYe3DXPmCaZDQvAqdi88hYGSdIP2MJnvs4AkcjThc
 2yFOiVQcw75Ly9RYDi2VU+brKg==
X-Google-Smtp-Source: APXvYqxO0pamPxMf/8ILBFlAvOSGJ6ULjaU2B+PG28ryNIhHvKKg9F63tlUJbqWykPnAHbIThnz+8g==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr39007634wri.95.1582148009688; 
 Wed, 19 Feb 2020 13:33:29 -0800 (PST)
Received: from [192.168.178.129] (f140230.upc-f.chello.nl. [80.56.140.230])
 by smtp.gmail.com with ESMTPSA id h13sm1626791wrw.54.2020.02.19.13.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 13:33:29 -0800 (PST)
To: Johannes Berg <johannes@sipsolutions.net>,
 Amol Grover <frextrite@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20200219091102.10709-1-frextrite@gmail.com>
 <ff8a005c68e512cb3f338b7381853e6b3a3ab293.camel@sipsolutions.net>
 <407d6295-6990-4ef6-7d36-e08a942607c8@broadcom.com>
 <855dec1f598d8b43400089cd0c5a7ac9b3533fc7.camel@sipsolutions.net>
Message-ID: <795b0dd6-23e7-8780-7cde-cf309f08109f@broadcom.com>
Date: Wed, 19 Feb 2020 22:33:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <855dec1f598d8b43400089cd0c5a7ac9b3533fc7.camel@sipsolutions.net>
Content-Language: en-US
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cfg80211: Pass lockdep
	expression to RCU lists
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
From: Arend Van Spriel via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 2/19/2020 10:29 PM, Johannes Berg wrote:
> On Wed, 2020-02-19 at 22:27 +0100, Arend Van Spriel wrote:
>> On 2/19/2020 10:13 AM, Johannes Berg wrote:
>>> On Wed, 2020-02-19 at 14:41 +0530, Amol Grover wrote:
>>>>    
>>>> -	WARN_ON_ONCE(!rcu_read_lock_held() && !lockdep_rtnl_is_held());
>>>> -
>>>> -	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list) {
>>>> +	list_for_each_entry_rcu(pos, &rdev->sched_scan_req_list, list,
>>>> +				lockdep_rtnl_is_held()) {
>>>
>>> Huh, I didn't even know you _could_ do that :)
>>
>> Me neither ;-). Above you are removing the WARN_ON_ONCE() entirely.
>> Would it not be good to keep the WARN_ON_ONCE() with only the
>> !rcu_read_lock_held() check.
> 
> Not needed, the macro expansion will already contain
> rcu_read_lock_any_held() just like in all the other cases where you pass
> a lockdep condition to RCU helpers.

Ah, yes. I see it in __list_check_rcu().

Thanks,
Arend
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
