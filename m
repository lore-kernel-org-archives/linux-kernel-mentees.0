Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBC218827
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764620409; cv=none; b=Rl9JRJ0R8qelETBB8M0Nb777LJwm/qZUZQ9a9AP2dOxI1eFlaFBwIw2DEh+dfWfxvFnJofM4GIbwcfJOPaXWOhnVbGjU5kt85FDu9EOd8aE6K6InSg1VjKEx1OPQIiim9tpZamip2HmL3yDp1kBgnf3YrEU5DZlhTpNX26CI8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764620409; c=relaxed/simple;
	bh=PRa8xOIamTzNHpbPH630DV3HxeBrPukZASLt2qOiZYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hrd0a/Yi9LKOIxHT2b0XdVc15njS1StJOBVkO0pU/3O3YReMRmsRsAz7CYANTf8oK57Mbl+J+LODHKRwmumaMVkKAX/DWda9dH5i8fwbVZI7E4F4g8zvTeBLqmEdJK07UO8GvopUOZanHZZ7QYSBDNA9wtDr8iNUdc6EvUO+BIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVV2xaLi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVV2xaLi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF4F80F8C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IvYGUKozjQZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Dec 2025 20:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81A6880F85
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A6880F85
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lVV2xaLi
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81A6880F85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  1 Dec 2025 20:20:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37a2d728536so7007061fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 01 Dec 2025 12:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764620405; x=1765225205; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7gDd4anQkoBfhiiCVrvGxkPHRjrXJfUkA8sU3Wlt60=;
        b=lVV2xaLinhw1E3TpaJYyrTumLeKBGeY2mk6jl1RVo7hhCWYuwGpN6L89K7SBSrH99J
         9N89LlfO2gAnN37iM13z9jQtPNUHnn3OqMcksnFbtUnx94IukVe3Z0hY2b4KepB+9jK/
         bAGj+dW/cViOqO8Lk6QcKibXjD/TqNVKeqoe3UTvDe49p4pXpGpsEzVbO1XN71XBQXB5
         dpJ75M+INvVZMb2BR8A4BIf7MjJEPhLlgNGam2Lcdrxku4o/8+lV1xv1dOBkCJfDhOq1
         CngDxv4om/56nqg3AbPRUTu2vBGACQwRgeT+bbRwtkuqhkn0ypXxzNTxCq0Kygk13CDq
         IxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764620405; x=1765225205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7gDd4anQkoBfhiiCVrvGxkPHRjrXJfUkA8sU3Wlt60=;
        b=WrDfrUoXrlvMHJZNXbyBC4OiVg71TtQ85nirYHBVXCKsrCj21DTS6a5AB924zgxAHP
         /fBSlwG/JZBhZ0bk9BsskcyVdEwQzs5coouMPxXfuQrymHvWNLJYE+tOYiVHoF1R6iRk
         GcdtMHHcINvkCESOJEJQgb2wSSfsWmQGz8saVU4OkcZ7QdifAc6t56MhffaI0sQWYrN0
         NTLYoYhE3ArTXhRSdK5JQuWE3XHJx6pzk/PwA1YEClWyLOTG1kBAoyirG6Z4nNW4LDmA
         4o7Q2AUZ39Xybfs2BHDt5oCSdp8wgvfoStQ/jDWl/Bp0wK9Vi7LbwR8qgko4k5hB3Uwu
         3bAw==
X-Forwarded-Encrypted: i=1; AJvYcCWUIu2NVPt2MBQ18+nd8pezuRpiefPXah73r3mUlRbjFBg9mtIXZXqy7pyOGp5BIws7l6EA4fbecCHJik4/kg+ugExxkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw2BYwFlaN9UAFKcoWegQ05b4I+zLUJLjeIotgTxROYOIZMHJV7
	37B+B5QGv18EkhpkJwSb53PotrZBbhYGxyITWz2easGaKsLpbWWvaQln
X-Gm-Gg: ASbGncs+blA76nh6f9zN2PDVvZ4bps3vu7oe2dQAWSKTM7DT0v9UpTaJAU97QPXbtc/
	P9gEaUBBJFThaKm+HTbziegEvCcfA9uR1c+xdIfW1ZDuXQJAffR4t5QsZ54ThErqkTVNZmjlLHs
	EMbrK+8Tw3SdEmKysV7NmhezmPA1NTxvfhrjAmPTCyZ3u01mzGBKr9yo8OPkHEaW1sU2F9Gd3vb
	tEjbYOY2ANMd4abCErQjxfOvO4CpY6l6EUKb85BM86/9Wljj5+ArzkRgjnV7Zy5skKLpxfPQkhC
	BERIcqBMZHH3PB9wgSTW5Kc+AazfmiiHekcPBZkcRkxYE0O7mOy/2gIjQjIXwIiB5Q95Pj00/A+
	GB0gJ1O+nOZQ0f16P0gSgOgsh7PsFj+HZOtjj0kNorkT++UUr3JuO+K2m8nAxukzuJLZKzfJ9Jn
	DfgeONoGeBbiVawFawzG31rlzhXEe7hg==
X-Google-Smtp-Source: AGHT+IGwThqm95w486AYWsPySskZwV9201UP4PC6YOAvGfNVr7lYqFBtxOShdiiOWC//XsnIcrTJPg==
X-Received: by 2002:a05:6512:e9a:b0:594:2a0f:917e with SMTP id 2adb3069b0e04-596a3ed45f2mr7386124e87.6.1764620404865;
        Mon, 01 Dec 2025 12:20:04 -0800 (PST)
Received: from [192.168.1.105] ([165.50.39.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b730esm3899389e87.44.2025.12.01.12.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 12:20:03 -0800 (PST)
Message-ID: <2795a339-dc82-4a1e-8c97-87dd131a631f@gmail.com>
Date: Mon, 1 Dec 2025 22:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 "brauner@kernel.org" <brauner@kernel.org>
Cc: "jack@suse.cz" <jack@suse.cz>, "khalid@kernel.org" <khalid@kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "slava@dubeyko.com" <slava@dubeyko.com>,
 "david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com"
 <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
 <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
 <04d3810e-3d1b-4af2-a39b-0459cb466838@gmail.com>
 <56521c02f410d15a11076ebba1ce00e081951c3f.camel@ibm.com>
 <20251127-semmel-lastkraftwagen-9f2c7f6e16dd@brauner>
 <4bb136bae5c04bc07e75ddf108ada7e7480afacc.camel@ibm.com>
 <59b833d7-4a97-4703-86ef-c163d70b3836@gmail.com>
 <9061911554697106be2703189f02e5765f3df229.camel@ibm.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <9061911554697106be2703189f02e5765f3df229.camel@ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 8:24 PM, Viacheslav Dubeyko wrote:
> On Sat, 2025-11-29 at 13:48 +0100, Mehdi Ben Hadj Khelifa wrote:
>> On 11/27/25 9:19 PM, Viacheslav Dubeyko wrote:
>>>
> 
> <skipped>
> 
>>>
>>> As far as I can see, the situation is improving with the patches. I can say that
>>> patches have been tested and I am ready to pick up the patches into HFS/HFS+
>>> tree.
>>>
>>> Mehdi, should I expect the formal patches from you? Or should I take the patches
>>> as it is?
>>>
>>
>> I can send them from my part. Should I add signed-off-by tag at the end
>> appended to them?
>>
> 
> If you are OK with the current commit message, then I can simply add your
> signed-off-by tag on my side. If you would like to polish the commit message
> somehow, then I can wait the patches from you. So, what is your decision?
> 
I would like to send patches from my part as a v3. Mainly so that it's 
more clear in the mailing list what has happened and maybe add a cover 
letter to suggest that other filesystems could be affected too. If that 
is not preferred, It's okay if you just add my signed-off-by tag. Commit 
message for me seems descriptive enough as it is.

Also I wanted to ask 2 questions here:

1. Is adding the cc for stable here recommended so that this fix get 
backported into older stable kernel?

2. Is it normal to have the Reported-by and Fixes tag for the hfsplus 
patch even though the reported bug is for HFS? I guess it's under the 
same of the discovered HFS bug so it references that?
>>
>> Also, I want to give an apologies for the delayed/none reply about the
>> crash of xfstests on my part. I went back testing them 3 days earlier
>> and they started showing different results again and then I have broken
>> my finger....Which caused me to have much slower progress.I'm still
>> working on getting the same crashes as I did before where I get them
>> when running any test.Because I ran quick tests and they didn't crash.
>> only with auto around the 631 test for desktop and around 642 on my
>> laptop for both not patched and patched kernels.I'm going to update you
>> on that matter when I can have predictable behavior and cause of the
>> crash/call stack.But expect slow progress from my part here for the
>> reason I mentionned before.
>>
> 
> No problem. Take your time.
> 
Thanks !
> Thanks,
> Slava.
> 
Best Regards,
Mehdi Ben Hadj khelifa

>>

