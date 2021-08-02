Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FFFC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 10:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F05A60F9F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 10:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F05A60F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313C74038D;
	Mon,  2 Aug 2021 10:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53W2o0fxIh9N; Mon,  2 Aug 2021 10:44:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3F7B1403E0;
	Mon,  2 Aug 2021 10:44:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4AEC001B;
	Mon,  2 Aug 2021 10:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 894CDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AF27403F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D71ryJaL0B0J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFAB6404B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 10:44:10 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u2so10880921plg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sUkGZKiJFUHXdJRo8lZOT7YsQ1JM5hP71TkDPnklmzo=;
 b=rp8Pgy6HQTYz7cVX+UNgdkeJCLvJ9XPoAU3yqZXgbtvgw2Y4zu74wqxijCLER5h3d1
 9IYtRJjXiSsGud5BWvLf3v7KkB5rye6N2lkoW/Pq1IvWe1ZODNYVOkkOC+/zaRsg7CJA
 Rvuuq7ExBEHMZMJomnP1lenpEg0BLIBwh1An0oV1n8JnKD66FgQpYJGTreonjYIVFTpm
 7juis0NnCL5K9sVRVF3Xypev48AHMNw4lN3RRAVkXgFsil6blxy0EHqU5wO7nrylmw39
 ew1wiL5unCFrWDfe7sDk3aeIMjuTVMks4IjWg8/x3JTbd9YTmszZshuLWfMcGC5QdqEg
 W1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUkGZKiJFUHXdJRo8lZOT7YsQ1JM5hP71TkDPnklmzo=;
 b=EOU2H8IqKFEnQpp63fSvLVWGJ1fg/3hadxmpPCIXB9RvKjwHisIZVImKajMn9VuhWW
 0GF/XFyrKn9itBRN0RXoLvDbyi0ty3P7yhrYep8W33V+rPg/Q7zWa5Cv/ktfsSwSS1PK
 T6bbGDGUJKuoy9Qxv9wcxX6BxMVwiAeKkQhkJa75Gr2P8cCvW+OPZE3G6M6Jm/gEUd5v
 jJ6BXGEnFccOpYWiEozlmG5izYIUOQuJzfPl7Jlln0UBVYmMFbGlmB3NCVqNbvpzpnzk
 A2IkB40iiM+qdqXUmEj25DXnoYwbXW36hQ25Z9P2p2D6qFYxBRnnthMu6Wwo3j13D1LN
 wMEw==
X-Gm-Message-State: AOAM530RjTvXHUlims8gSV9f774ty8+MqoUvzj49SaQEftS/kVrOi9wn
 MAht69w6qnwyciXkX/WGlcoibSD50gDbEd9ZoD4=
X-Google-Smtp-Source: ABdhPJz2ikv5xjHbyI2OQRLvHxw/dvvTn8uEDT12ePKFpN2DmxJzLaY3iw0lqtbey0zspJENCX73JQ==
X-Received: by 2002:a63:4f21:: with SMTP id d33mr553007pgb.144.1627901049822; 
 Mon, 02 Aug 2021 03:44:09 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 37sm12731593pgt.28.2021.08.02.03.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 03:44:09 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
 <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <4d871d0e-3b51-8a21-49e5-1a413bf71d4d@gmail.com>
Date: Mon, 2 Aug 2021 18:44:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
Content-Language: en-US
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

On 2/8/21 4:26 pm, Daniel Vetter wrote:
> On Sat, Jul 31, 2021 at 04:24:56PM +0800, Desmond Cheong Zhi Xi wrote:
>> Hi,
>>
>> Following a discussion on the patch ("drm: use the lookup lock in
>> drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
>> helpers to make it convenient to compose lockdep checks together.
>>
>> This series includes the patch that introduces the new lockdep helpers,
>> then utilizes these helpers in drm_is_current_master_locked in the
>> following patch.
>>
>> v1 -> v2:
>> Patch 2:
>> - Updated the kerneldoc on the lock design of drm_file.master to explain
>> the use of lockdep_assert(). As suggested by Boqun Feng.
>>
>> Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]
> 
> Can you pls also cc: this to intel-gfx so the local CI there can pick it
> up and verify? Just to check we got it all.
> -Daniel
> 

Oops my bad, I missed out the CI for this series. Will resend with the 
proper cc.

Best wishes,
Desmond

> 
>>
>> Best wishes,
>> Desmond
>>
>> Desmond Cheong Zhi Xi (1):
>>    drm: add lockdep assert to drm_is_current_master_locked
>>
>> Peter Zijlstra (1):
>>    locking/lockdep: Provide lockdep_assert{,_once}() helpers
>>
>>   drivers/gpu/drm/drm_auth.c |  6 +++---
>>   include/drm/drm_file.h     |  4 ++++
>>   include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
>>   3 files changed, 28 insertions(+), 23 deletions(-)
>>
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
