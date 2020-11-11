Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163DCC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:36:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3936920825
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 19:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFaK/f3R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3936920825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE7CB86C5A;
	Wed, 11 Nov 2020 19:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybTmp3o-Du6h; Wed, 11 Nov 2020 19:35:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00DA6857F8;
	Wed, 11 Nov 2020 19:35:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D95E8C088B;
	Wed, 11 Nov 2020 19:35:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B96AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5205A862E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fws7tj-XeWqr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C4392862D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 19:35:56 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r10so2039790pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 11:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=axYVJwtCg4GMmJwn9cCHNuKpur6id/06Ad/8ZPnXHN8=;
 b=qFaK/f3RBV4skjI5iL+RJ9sXTn+v0lyV7+GcTIyk2g/NxkGwTjvxK+ft/rRNaBy/vZ
 5oFmERhHSGBrshObZPn67EbAxF9+nN6fUs/cWvSDTRiVlqV1pozOaxSNexIY9vMfcGeP
 e3sIa+ml9UjnmqQqvHQ+gF14UpuOIc2ZtOJ7GktDsdpy997qH4CIwy4/igMYQhro0O/G
 oEc19o57tzVbiFjXpxHQXmVWIjchPF8bdAAgnBcGvC99ExqRzJ1ZTjrQv6GFzkrWaT+g
 4h1jg+qvp92IUhhN47xqc9itO2E67DjFpW4PIbzz0S5SYSEUANNkxobZJa/yURG7nBZy
 X9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axYVJwtCg4GMmJwn9cCHNuKpur6id/06Ad/8ZPnXHN8=;
 b=KnJZknSC7NiA2EnvzdeyjsJasuj9pmFBQbjmON8ayRAB9CcW8V6ntKpJm3M+0+vgy0
 VSPCaJilG0jN0QGELA807RQf3xdM8C6AkLptH+06s2okWeKXtqOdlTequtJGpb5TBVB0
 X8KXB8l2W8NlQKj1vtIjwiCGTdG5CVoryhID6bMVhpem5S6n/jtTAyTRklEiag9/FckO
 l4VQA4szAOHUBV8BQYNE3/ZcfgV9NE9qNatXgRRcmI89RQxd2vDjsbDZdQOJt4OP9I3y
 tC5MoUiQEfONt+HMzD6k2bqMsOnVQI6im65Vk66OuyOkWTVyKcWD7Att8eukhn0XKjwi
 u5DA==
X-Gm-Message-State: AOAM530Ni4791vnbw2CSmI/0tEiCi3NlY9fLtA9b6b+GLepNnIHq0A7s
 TAb/LTZlncRF0hyyey84jfDd9IGMlGa3YA==
X-Google-Smtp-Source: ABdhPJxihvQG3FM5UwmNo/ezqPthMPxfiPv/kVtGrM56Z51qixlJuaSHjLmEVyDWgY8QlqdiW62Ltg==
X-Received: by 2002:a63:3c5b:: with SMTP id i27mr21072371pgn.268.1605123356023; 
 Wed, 11 Nov 2020 11:35:56 -0800 (PST)
Received: from ?IPv6:2402:3a80:438:e4d1:90d7:ac69:6d50:789e?
 ([2402:3a80:438:e4d1:90d7:ac69:6d50:789e])
 by smtp.gmail.com with ESMTPSA id v196sm3592247pfc.34.2020.11.11.11.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 11:35:55 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
Date: Thu, 12 Nov 2020 01:05:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On 12/11/20 12:56 am, Lukas Bulwahn wrote:
> On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns us for long lines in commits even for
>> signature tag lines.
>>
>> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
>> clear Mac Table Digest") reports this warning:
>>
>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> This is an example of false positive. Provide a fix by excluding
>> signature tag lines from this class of warning.
>>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index ac7e5ac80b58..1d257b1f4a4f 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2963,6 +2963,8 @@ sub process {
>>                                         # filename then :
>>                       $line =~ /^\s*(?:Fixes:|Link:)/i ||
>>                                         # A Fixes: or Link: line
>> +                     $line =~ /^\s*(?:$signature_tags)/ ||
>> +                                       # signature tag line
> 
> Can you simply add this check to the expression above?
> 
Yes, we can do it. But then the match will become case insensitive
(because of presence of '/i'). Should I do it irrespective?

Thanks
Aditya

>>                       $commit_log_possible_stack_dump)) {
>>                         WARN("COMMIT_LOG_LONG_LINE",
>>                              "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
