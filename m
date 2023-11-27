Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BE34544
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNxvuRdx"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5CF4091D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5CF4091D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YNxvuRdx
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1Hv9se3LGs6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 18:54:00 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 808164090F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 18:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 808164090F
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cfa7be5650so7754745ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Nov 2023 10:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701111240; x=1701716040; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBWX+tBMrXJ5sqEB3xXR9ubJgmb8By6ql2/SbCpyp68=;
        b=YNxvuRdxDB4juRNLbfVVyhGuHWcXOXJFG12QddyxfBS5b29kLuGtShdKDanzM7N5gF
         mq8iUmdUnTG8+gnm/BQUN2n+NcoHiIOmP/47Q8jK0GF1eIjrtAk4Lp27yknCtssgtHP/
         vyqMvVrYe7WF+wg4/6bcMn1QDfEOtEN7cpuHv5nefMCBF8JA8FHhlxWf8bKekhsWbWa8
         X5CxXaHnbCXAGuFwDFsKghnmCHhfM+ouO5E0JCh2f3LUmNiPz7bSFa0J/qA4383Zm+iE
         QxuN2Nqr9rycqtVMasqcZx2on4p5w70c/4KVG6nimlXZvHAT29yma0n7rjDNR/9I7e5O
         0PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701111240; x=1701716040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBWX+tBMrXJ5sqEB3xXR9ubJgmb8By6ql2/SbCpyp68=;
        b=xOyrl3Lbsmid/KY776TziEZ5Lb/I0BuGpJH9qAHHzhvAOhmRUu0D2lKRJgud7UGKy1
         p16xdDYLICqTV5NVQ05MAHmSdq4pk0r0EWLTJpx7t7IsO7PoMgE5r40B3qzwodS8wwIx
         3gPmqoP+HaORt5x5POa4ZoUnxuQUJ2Ildog+5X7x6Xqr+G4WaJk1EI0iNTwLvQnXz7ya
         cyQBTHWbCBrqznkdDMEwhmekbXNKQ4hks51dN22MBhzralDDR/Rjem/F7OzE6S7OgXPt
         bPtQ+YkLZEjQbgWL0JjDJBz0vAqnxEzD4WCUVUNf6HWFstvt6ZPvc1oXxpDem65tqBh4
         puow==
X-Gm-Message-State: AOJu0YzUuVoVW4qT+TZ7ezDNEJN9WtoAHPhIwAko5a46CmDJ6QJiOnF8
	UxYhCwrafV7YiP5QMUcHxrY=
X-Google-Smtp-Source: AGHT+IEL2mSrxdY6F1NZfGrVfQaW55mhAea9zjXPu/JNUyVOdoxUfVr1DXnyvjZYtrzmbHotbpt7aQ==
X-Received: by 2002:a17:903:183:b0:1ce:5b6e:bae1 with SMTP id z3-20020a170903018300b001ce5b6ebae1mr15606570plg.3.1701111239836;
        Mon, 27 Nov 2023 10:53:59 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902ecc500b001cfc50e5afesm3145347plh.23.2023.11.27.10.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 10:53:59 -0800 (PST)
Message-ID: <95fc95c8-dac6-4137-a9cd-29f27da64e41@gmail.com>
Date: Tue, 28 Nov 2023 00:23:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver : edac : Fix warning using plain integer as NULL
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, qiuxu.zhuo@intel.com, james.morse@arm.com,
 mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
 <20231127171435.GCZWTOe+DQSy4kkuKO@fat_crate.local>
 <dfb5b4cd-935c-445b-aaa7-bcce962a143d@gmail.com>
 <20231127183941.GGZWTibScFM4lgbqkG@fat_crate.local>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231127183941.GGZWTibScFM4lgbqkG@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/23 00:09, Borislav Petkov wrote:
> On Mon, Nov 27, 2023 at 11:53:02PM +0530, Abhinav Singh wrote:
>> Hello, thanks for reviewing this. As of now this is only a warning issue in
>> kernel. I saw this post by linus
>> https://www.spinics.net/lists/linux-sparse/msg10066.html and thought of
>> submitting a patch. Also a similar patch of mine got accepted
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2560740.html,
>> so thought about opening this one as well.
> 
> Lemme try to understand what you're saying: just because someone
> accepted a patch of yours, then others should not ask you to improve
> your commit message so that it explains *why* a change should be done.
> 
> How about you put the gist of what Linus is saying in your commit
> message? Don't you think it would be a much better commit message then?
> 
> Especially if it explains why, even if it is the case that 0 == NULL, we
> don't want those in the kernel.
> 
> Hmmm?
> 
Hello, my sincere apologies, I wrongly interpreted that you were asking 
for a reason in reply rather than in the commit message itself. Yeah I 
agree putting a reason in the commit message will make more sense. Just 
to be correct this time, I need to put a reason why this needs to be 
fixed, in the patch itself, right?

Thank You,
Abhinav Singh
