Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B4155A2F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Oct 2024 03:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730085903; cv=none; b=RQtpfeCdFcVJ/e4FI82Qif0/5jZpxT7S0u9/BQqTJYiWIC7vRrOrf5bXxhKtjTzRXQRExWvAxAvhpJvqIwT6Zj4ZhtEwU9kNEgTXlnH95cN7vlKeR5azausPmOVewnP2BgliQdpb5nX4grrArckRk6tNkNR9jIavz0VifrWF5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730085903; c=relaxed/simple;
	bh=BgAxH7BuovLSb/VyMg+CeBt7AY44ASR1oxeFqo3yo44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDdkc/ewQVZ3ePZJbEKzMT79rRlTKOpQgUZtVOHt0PYFsheF4cYpklxn387q1e1TSMA3EpBkj/6MxFe4b46BxmQqccBGtSZC7ZcWnflVJzZTUbLhVdd2JV6mN3SALC/a/jE8d7Ztb9W4r7ommqoJZu5f0d6veXFgwlnXuN0mLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iURAN29Y; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iURAN29Y"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-288d70788d6so1824456fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 20:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730085900; x=1730690700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQps+ZocWxrGBOwCyIh53YeKrI3fc0l3GGoMpgWYcYE=;
        b=iURAN29YGSEyH+Y24P27Fc7sWXpXSJAYfQK98eKrSAdnB/ahVaGtNzG3lW7abKFz7Z
         iLS6kBenT0Be7qlpDLSzWomSAJwOKC0/ZclnphW5hCdkutUj2mwYNITapckgQlH6jZGE
         RmxL7x4DLdAaxnE0bVPjdhZl9txa7wOWevqg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730085900; x=1730690700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQps+ZocWxrGBOwCyIh53YeKrI3fc0l3GGoMpgWYcYE=;
        b=cDEz2kMtSkEwfL9K8RQB58ybALi+3HlUxZqsFq+0KJ2OWc7quMBqGMLWNjZ9W7zR4v
         lJfihMDIWNf97fQBRh+Bo9XenB1aXEtvA//S3JJi0tnp5Tr6SrK0ie76LPdv6jFg5Zfi
         s18bwYEokxURmO01xFaU7mT1VIVJuMkv1MJ8w915V9YpUcy9REaHDQQA4AwqzpB9bvtl
         gfELWPdZrNKNqeJR2YA6/jX7gOzbYMQl339F8rZ+y6PzFVqoya3FVBZLIGbuhMF3/Z3o
         XK5jaHs4XB62JOY3zNZ0PbtOFXfeBfdJMB+DxG+AuuBJqeCIz8kWnH/NlDOxw+yygUmr
         A9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUdqu7aOl9lq9pdgzv8015Vi/TrnqvZMOaQ+MKEYVrO/++2iQbSXnyccN0zxV5c5i5ZP6tQlyEtXILQijMf8s+lyDeXkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxxe4/PBn0bHCTbAxRceQXlWLEg1SpgVO4VZ2X0Ry5CgHY1RouO
	ERAEOHly6OdwIBu6THpFFizNG7kf60qOiq5etQsxvYNBjoY29XZohTAhfBoLIcs=
X-Google-Smtp-Source: AGHT+IGE75zSHhwyyDDQtRp4FgDHkbHA5Xo/zZuHaCPkdqAGRqL3DWjJapnemFbOWTvX+FJ/kTXKiA==
X-Received: by 2002:a05:6870:32d2:b0:286:f2cc:7a71 with SMTP id 586e51a60fabf-29051d705b0mr4868242fac.32.1730085899683;
        Sun, 27 Oct 2024 20:24:59 -0700 (PDT)
Received: from [10.200.3.216] (fs96f9c361.tkyc007.ap.nuro.jp. [150.249.195.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm4781718a12.17.2024.10.27.20.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 20:24:59 -0700 (PDT)
Message-ID: <5d87c8ba-8464-4d9c-9152-611097b5ae3e@linuxfoundation.org>
Date: Sun, 27 Oct 2024 21:24:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Removed unnecessary initialization of "ret"
To: MottiKumar Babu <mottikumarbabu@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 anupnewsmail@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20241027211913.26718-2-mottikumarbabu@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241027211913.26718-2-mottikumarbabu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/24 15:18, MottiKumar Babu wrote:
> The initialization of ret to 0 was redundant since ret is set to meaningful values later in the function. This change simplifies the code and avoids confusion about its initial state.
> 
> The issue was reported by Coverity Scan.
> 
> Report:
> CID 1633338 Unused value - An assigned value that is never used may represent unnecessary computation, an incorrect algorithm, or possibly the need for cleanup or refactoring.
> In register_ftrace_graph: A value assigned to a variable is never used. (CWE-563)
> 
> 

Check submitting patches document for how to write short log and change logs.

> Signed-off-by: MottiKumar Babu <mottikumarbabu@gmail.com>
> ---
>   kernel/trace/fgraph.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index 69e226a48daa..b13ab2ad0e88 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -1249,7 +1249,7 @@ int register_ftrace_graph(struct fgraph_ops *gops)
>   {
>   	static bool fgraph_initialized;
>   	int command = 0;
> -	int ret = 0;
> +	int ret;
>   	int i = -1;
>   
>   	guard(mutex)(&ftrace_lock);

It makes sense to initialize ret - i think you might see a warning about
ret being not initialized before use. I don't see much value in saving
unnecessary computation.

thanks,
-- Shuah

