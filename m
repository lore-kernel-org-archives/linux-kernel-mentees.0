Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B826FD8C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 22:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952442; cv=none; b=FG2yeCj1GhEQbKfTB85BmzLt6sWNRwF3Lb2Wkitbk4EzI9uoulpwJPVIRaIXlVSwsuZtvWxHYGhu0/lhgorMJsfnLDbKzZ7fmmX8CEeUVRggfZ4vQiqGvC4/HBcIw2tAFt1/8aW0bvfnd9YYhx3zOrvxph8o5ccwpt1M570LxO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952442; c=relaxed/simple;
	bh=mnHKE1BUo31x7AyUtPinsLwcx+oySEsRQhIFnGP6ry4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZg4H44klZjRMvUSqB3O4bnQx0MEJEtSD7/Kt0OqxWeu//T2gSTqcRMt+GcS7TpTbyOi7p/XT8MVcwXluNrXbN+yXfqwWAwy7MEanyUQ0umdVC9WPyumCjWOpLwdKniheifKeZEhiCPkZPv+5MVs9C6jC5tJXNT5PqrXciXjX28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g8zEVoVW; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g8zEVoVW"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso1270055ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747952439; x=1748557239; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5BNM50paBCJ37VNYgPqSl677v0Imj9cFeeb/Yu2EZA=;
        b=g8zEVoVWcK+FjIYiB6wHphcTZf378WUm7ChC0kFUZURw9N0Brrbulbd61a+dMemrx1
         Yt8b4YgmAoYOhVWh8VMfa6zTwbT9hpJ9gxVb5nHPW1i++sHKQV9fPqqwKzJuNwZQYXM/
         vsldqw7QooMLfKgJ4pMqP+sitzjTXA17mtXIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952439; x=1748557239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5BNM50paBCJ37VNYgPqSl677v0Imj9cFeeb/Yu2EZA=;
        b=CKuBprYQzFVf005u6Un0U6hFnKxdd/+nyPmg87h0c/XazhzYlmfsV52tgDhTyoCHug
         lIQUZrfPpbo+XhEf8+IDbpafD4eq6ZM6sPi/lnL5b3NRfhyxnzjTT47wrwq6drF2uBVV
         h+M7+p3nvdi++eVQwep7f6pqsfjH69YsXtnknqH504mifkACTyGMNuIQIUuq90WsykdH
         cJzY++cEWuDBlgKmN+4m7HUPc/MrrHuNkXJdlXmMHqvHgCHLLiu4XBxymoTV5dp1zguj
         aXPqgOyD9osoNlCEZZwhv2iPhcScUPt1GzK3ryWTJivJr481cJ61pXcDRAkPCgWq8UAt
         CTmA==
X-Gm-Message-State: AOJu0Yy3LDth2SuLqa6xl+sis5J+pAdqGl6SUh+ERxcQXaj2n3GSS22X
	CB78UMuP13/buWm6QlAKl+WT5sgfBBNePnYCLx1vzXWzaTXmB5qkbuYHHHYa2YYwYSU=
X-Gm-Gg: ASbGncsvOTdttXVhiZasg4pPDPWPm+ZvRBAMSi0EjQhUyI/KPWcwek0jRRQkXrE0Kzz
	ETe9oN6DsxAcEjkjNvdGv9MmEaHgcjaF6vADtPq+Yr/Aagow62Rpwhx+IQ0Cqe3MmBCZsrzrcI/
	b0b86ajQ8MtTYBquRP6Q8MMahw1o6sLGnUSxSJpQpo2pDTa5t7e71+ECNrTswwXBFJe6gCL8ZNz
	v44WAWCD5XwBGSLQjmb35UUGAdpuVwN+YcF8DIpxnQFtNB/2yjymmV8ydLxAQ0xPteg7O1rdf7o
	0sPS4HyZV7B0zGxFaImsGCFn1q++5NWMHgzFkzYU5Nm/1tJPKWPdPc9ng9Ea7+rBr+jxJCIQ
X-Google-Smtp-Source: AGHT+IGYLQ2LO5QOfE62VgsMxmlKAhEOBopbDS6A7t9QHHagvVdXFcgpgAg/8sKLAv9dg/KeRHZBUw==
X-Received: by 2002:a05:6e02:16ce:b0:3dc:8e8b:42af with SMTP id e9e14a558f8ab-3dc92bf6514mr15590275ab.7.1747952439346;
        Thu, 22 May 2025 15:20:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85440323sm10378805ab.50.2025.05.22.15.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:20:38 -0700 (PDT)
Message-ID: <2973cc3d-a4e2-4120-ae89-730581090ef8@linuxfoundation.org>
Date: Thu, 22 May 2025 16:20:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: filesystems: removed repeated word
To: Nidhish Chauhan <solemnsquire@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250516164648.15396-1-solemnsquire@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250516164648.15396-1-solemnsquire@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 10:46, Nidhish Chauhan wrote:
> Removed a repeated word 'at' from journalling.rst at line no. 96 in
> filesystems directory.
> 
> Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
> ---
>   Documentation/filesystems/journalling.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
> index 863e93e623f7..2825f6c030c2 100644
> --- a/Documentation/filesystems/journalling.rst
> +++ b/Documentation/filesystems/journalling.rst
> @@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
>   
>   Try to reserve the right number of blocks the first time. ;-). This will
>   be the maximum number of blocks you are going to touch in this
> -transaction. I advise having a look at at least ext4_jbd.h to see the
> +transaction. I advise having a look at least ext4_jbd.h to see the
>   basis on which ext4 uses to make these decisions.
>   
>   Another wriggle to watch out for is your on-disk block allocation

Please run get_maintainers.pl to get the correct list of recipients for
this patch.

thanks,
-- Shuah
