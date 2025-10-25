Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197B2FFF85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761404836; cv=none; b=aBVB+FDH9BDmg/w+ew1qbtUVuWrWCLrtbBFt6MyL1XkamwOk3yavMyhf1FsnREb4S2BKF6rD+X+sAXBhHqUJbCWS0EHljIg6R3p00MzrVH1sL2Rb7u9R3EWbsfMy0G4+QBlyE4+yRAH1a2ViTfpy1uvf6/nxI/O0IQgq0Bak4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761404836; c=relaxed/simple;
	bh=pdElZZTBRl/ohTApnI+0p2VE9kXSMqg2mVsZtsGTtng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWGcu+Aabb5u2ex2eP7pwQxzpft3JufOaL0RszggAsdQlv/P9N7XZ+aS1kSvS4P9Idgpgx/LWTzTdbZiuEvvFde2IV1+xiTJiRTugUaV19fzl/O+9tvAzol/bv/55ahnj6+N0mK6RnzThnPt2PM0k17wHwr9N5ImPdYzT2YjEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaH+F/Qg; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaH+F/Qg"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509A581121
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 15:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhXOIQvXLD7d for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Oct 2025 15:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50F1680B5A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F1680B5A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HaH+F/Qg
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 50F1680B5A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 15:07:14 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33067909400so2314289a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Oct 2025 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761404833; x=1762009633; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehGvucYryd5ksZM+NP6h3eQPQh9+jzxwKY2MY5g6NkY=;
        b=HaH+F/QgRbfKf+oDOieXtp5JyQMBbY9p6CqvEIN6+JeP45hIV10UdAeJMHADB/sj6O
         pEYHlrw0Tn9RGE9hE+iGCYzyd+eKNI7zjSBYi/VzVi0T84lqLk8NR969IQkJnz0HyPqX
         kMTlJ4kljUPExrl/bZuE3ZHdWUrpihVmdJ3RCfjOusO/FUDuvhz+AUxB1aP29hwcacOE
         dO1g16kk900uDF6c4+lPyiHPZ0DB/YwLlJVS4TUJZ8x/CI493ZRIlxM1MCo6sfmWLbCU
         MIky/ieROMTERr3xpGUOq3yfmwGBjeIlhsJRzjgPOpKM82WNzs0I8oaqKkA4iz7TD2eZ
         OWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761404833; x=1762009633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehGvucYryd5ksZM+NP6h3eQPQh9+jzxwKY2MY5g6NkY=;
        b=RPAo2LqsrzXji9SgLUWWpj9iK1vaGPE6u7vyy0zRqGeiUbN5vTdQjbID38LjjpPxaR
         Me19WILvWwhStW3nN71wuNxl09f02N+3suEGqOno/c0RDm6BfwQ0fFp7VWC+ay2T6hae
         b+Ynse1x6hD3vonv9N64LEb5U0ZjOUVAKQE9hQK/RHA80mlq3jdrcOxmAEI+IBY985Uh
         k9nBFkSGqSlljl0I6Djm17SV87AXB6YL30EebaZVgKRay3CX9KN1dx0XVIlBh8xUKNe3
         PNza5u5q5LFY0hdHNH9OxSQda1/HAPLTePjEW2eRc+0T+0g+YY+ZDH4Q/3A6WMoQKHPo
         k4/w==
X-Forwarded-Encrypted: i=1; AJvYcCVBiqK1MvIYPIWGJ0eX+lAKz04Jy2zkLunFdyiHR2kkwvqoRrQVHp+oX9MQy3cDLiQEWSOnozPTQGtkKIxD1RA7LKgNKw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwIUbsxsXDQ94RU3Y3tzxMDpanzK8wpDsA5dyHHZUGz0o5L0I5m
	o446BAVmZCD/xNRaZZZbt116cFlbGp+ZDF4HP5nua+6kywgWGRv2fz3I
X-Gm-Gg: ASbGnctkFH8cftJganl9tmk0F39jM8Y7xYAzKHoFnEUQTpSjJSlegC5OAMoiQ5R1fL7
	hXCLJUpw9yTL7830m67LnyqL4lkyg1vvyLA+sthsDhXQlWGKfip5GxXfXHeTx80taF9dooFW6XK
	L2JoT83RhA/ylrLeSXerzyNXQMKeXGnyL2YB43Vq2SLDKoXEmUWvDXdP/Mv6zLOyLWuHkX16IRf
	Yy5eqJMZIqsTWmwwuZHklqkOBE0uNJMtBcIoZJFzBF13w4JZmOYKwjgnrNfNELWvVVWQh5p6k9I
	0EL1jew8mMpFRUAO+MjJtmBgHZwFtGZoZ133t2TrRW1eHF3FCtvKt6YUBY90V8dWkd+7bnDUwjV
	JdaYTAvB0Vansfu3AS+Z7F82QU7zdKNTzWhcIQF81vu8islWjPDn1ifllwhbcj6xhkQjOBxoutW
	rVQmcVoOFtB/YBz+nwzecil0GtRXgfquaqOzokKXz9ubtqzDbbKoa5sdMa8lo1f5GzNDjFhZQWo
	JXK4mcJYQgo+oIuICFXJlo=
X-Google-Smtp-Source: AGHT+IHc2D1me194quCxZvcS0NmqKlfdcG9goQhTzdjCPdL4h6Tfx4LteJBnMLzm8AlcYT1LIELvtw==
X-Received: by 2002:a17:90b:1b4a:b0:32b:6151:d1b with SMTP id 98e67ed59e1d1-33fafb98ac1mr12129890a91.8.1761404833441;
        Sat, 25 Oct 2025 08:07:13 -0700 (PDT)
Received: from ?IPV6:2606:4700:110:896a:5f1b:2412:be21:3a45? ([2a09:bac5:3c3b:a82::10c:59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed73a7b7sm2605532a91.5.2025.10.25.08.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 08:07:13 -0700 (PDT)
Message-ID: <4aeceb66-ceea-4171-8806-95bd11a928b3@gmail.com>
Date: Sat, 25 Oct 2025 20:37:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com,
 ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
Content-Language: en-US
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
In-Reply-To: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/25 4:08 AM, Nirbhay Sharma wrote:
> The call to kmalloc() to allocate the attribute list buffer is given a
> size of al_aligned(rs). This size can be larger than the data
> subsequently copied into the buffer, leaving trailing bytes uninitialized.
> 
> This can trigger a KMSAN "uninit-value" warning if that memory is
> later accessed.
> 
> Fix this by using kzalloc() instead, which ensures the entire
> allocated buffer is zero-initialized, preventing the warning.
> 
> Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
> The following syzbot test commands were used to verify the fix against
> both linux-next and a specific mainline commit. Both kernels were
> configured with CONFIG_KMSAN=y, and no KMSAN warnings were observed
> with the patch applied.
> 
> An attempt to test against the latest mainline tip failed due to an
> unrelated boot failure in the SCSI subsystem (KMSAN: use-after-free in
> scsi_get_vpd_buf). Therefore, testing was done on the last known-good
> mainline commit below.
> 
> For mainline commit 9b0d551bcc05 ("Merge tag 'pull-misc' of..."):
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b0d551bcc05
> 
> For the linux-next branch:
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> 
>   fs/ntfs3/frecord.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 8f9fe1d7a690..4fe8da7fc034 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>   	 * Skip estimating exact memory requirement.
>   	 * Looks like one record_size is always enough.
>   	 */
> -	le = kmalloc(al_aligned(rs), GFP_NOFS);
> +	le = kzalloc(al_aligned(rs), GFP_NOFS);
>   	if (!le)
>   		return -ENOMEM;
>   
Hi Konstantin,

I sent this patch about 3 weeks ago and haven't heard back yet. I wanted
to check if there are any concerns with the patch or if any changes are
needed. The fix addresses a KMSAN uninit-value bug and has been tested
successfully on both linux-next and the commit from the syzbot report.

Please let me know if you need any additional information or testing.

Thanks,
Nirbhay
