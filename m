Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1F74C14
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173839; cv=none; b=sp/LAZDjLMLCN2LFk42/7sK/veSYMZJAV9bnO/v2taBi/0S7RnQQBxxx/Cou3syG7kj9c6/GyLaa3U+ukkRGQ/wvbHfXymt8uASCknNYq7vKIiLk872nVwVCM7VdsE2v6CtilY34Xeu1gj76Bwg0h5odgrOBl+L2ii+sP+ksfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173839; c=relaxed/simple;
	bh=mht4Mu8KwpR6qpvUd9Q38WXeV/fBDsQSW7CDZBj5eSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hyn+j9fsPeR/5o3KuIzv/0zqE9T2IqoIsjxj3od5WpDNtRikOD6zsjlxMN4Axb05GG/nZBK+v1gvn5EB7ThMTHpeA/KMFgqbki10yGyp2ktlUCUprnnx0VrQqgTzMcAVUYDi/KCl+rEAMp9fMyQemxB5qXNqm7PxhgCwkuqeNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KgrQseFy; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KgrQseFy"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8644aa73dfcso164413439f.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 15:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747173836; x=1747778636; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoKmI2raZuqSmtw+LIkwIvxwxu+cELMe9tnrTCWibeE=;
        b=KgrQseFyIJVU8420kY+v4DeVHzONbHi5UHRDFqEyIuj22OxVjtJqCD1A5EqCLWWzB+
         KkWP52sZ5nG7mS42+JUiTqB7eVpwkNf1T9RTmBvH7MVS647gr8ER2dQUE7/peOzE3ZW7
         M7BJkwvJId74UJNKwbgAFn8WAw+gjQ9HTiihI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173836; x=1747778636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoKmI2raZuqSmtw+LIkwIvxwxu+cELMe9tnrTCWibeE=;
        b=WmTHfYJPAgs1S/xff6xLRMR1CSIsclJhcPyGUhtyXtEDVX3VZ1uCNmBkVMu7h5b4dp
         lGJcGtmohDmC2RUG+Ud0WNZGkPMewfaXRSes5+AhQnlq5oDi3YTiP7A2/zBeRCLfTrn1
         6BCahLtlW2qS9T+ObGo5LYM0OCrRe8salFxfa9HdB1dP49CsMOh/7mcBKJ04LhNaxFTh
         3lHgJt8DmnU9dAag9AV2RpKftO6YanciZkNY2IJyj5M6uzT3RKAao8PkV4jifB2WiZpM
         TzvNSDk/WHRe7crI7wPi3kl/ksOdO+8O8Z1zvSwAZC/8m6Iwwh5epQXbw5+7e7MK3MK+
         /77A==
X-Gm-Message-State: AOJu0YygUudltKfrY1TSoSFDBpN45XdW5pJoF0o0mKGKjVNHQJWS8xD0
	RbebefWGIdvSYlh77RSI/PPiwZiR99bHVyt8HYc+7jP2CaX9q4GNcFTq859+7Hg=
X-Gm-Gg: ASbGncvrK5MVpep/ho33fMZ35mMFi+NOFpbNWP/GgXLB2Az97ttu4zuYDhSCkinnkCm
	OtDW5MT6nDJQ9XHdvoTBfdXdd/vRdsjZmzy07waLfAwsLi8Q9V781Z4oQjsDt+R0oBm4c1LWou2
	OC7KlVFCC3HykBRQaPOHj6j2CtTr4o8w7JqYVZqu0u3p/yZMXUjDvGZ73C7cwNbixWSOOd8k9I7
	Mvq1FlE8Te6nHFGcOG6M0R5HZRPjSjW2Z23kALQND8ndOWnRSCmf1v/0Sk4mpwjlPp1z+iy64Af
	GNNWufvnptKB73+ieAnAYq90znz4xx64rpqWuptqxbFzUsHxNvF0O1MbD04TlmJMyuLK4nFs
X-Google-Smtp-Source: AGHT+IF6/RkZ9qQPZwCYgDY7fPoXtWFmtHPVQT+c1klITiTH2LENUwc6S+Wq5DRw/bkxC7oGI/dW2g==
X-Received: by 2002:a05:6602:2744:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-86a08dcadfdmr145091039f.6.1747173836361;
        Tue, 13 May 2025 15:03:56 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224d8d13sm2302262173.31.2025.05.13.15.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:03:55 -0700 (PDT)
Message-ID: <09c7ad5e-4061-4c0b-b097-fa575c12a244@linuxfoundation.org>
Date: Tue, 13 May 2025 16:03:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/powercap: Implement powercap_set_enabled()
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, trenn@suse.com,
 shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com,
 linux-pm@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250510184709.44935-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250510184709.44935-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/25 12:47, Suchit Karunakaran wrote:
> The powercap_set_enabled() function previously returned a dummy value
> and was marked with a TODO comment. This patch implements the function
> by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled

The short summary should say cpupower: Implement powercap_set_enabled()
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>   tools/power/cpupower/lib/powercap.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/power/cpupower/lib/powercap.c b/tools/power/cpupower/lib/powercap.c
> index 94a0c69e55ef..7947b9809239 100644
> --- a/tools/power/cpupower/lib/powercap.c
> +++ b/tools/power/cpupower/lib/powercap.c
> @@ -70,6 +70,22 @@ static int sysfs_get_enabled(char *path, int *mode)
>   	return ret;
>   }
>   
> +static int sysfs_set_enabled(const char *path, int mode)
> +{
> +	int fd;
> +	char buf[2] = { mode ? '1' : '0', '\n' };
> +	ssize_t ret;
> +
> +	fd = open(path, O_WRONLY);
> +	if (fd == -1)
> +		return -1;
> +
> +	ret = write(fd, buf, sizeof(buf));
> +	close(fd);
> +
> +	return ret == sizeof(buf) ? 0 : -1;
> +}
> +
>   int powercap_get_enabled(int *mode)
>   {
>   	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
> @@ -77,12 +93,10 @@ int powercap_get_enabled(int *mode)
>   	return sysfs_get_enabled(path, mode);
>   }
>   
> -/*
> - * TODO: implement function. Returns dummy 0 for now.
> - */
>   int powercap_set_enabled(int mode)
>   {
> -	return 0;
> +	char path[SYSFS_PATH_MAX] = PATH_TO_POWERCAP "/intel-rapl/enabled";
> +	return sysfs_set_enabled(path, mode);

Did you compile this?

thanks,
-- Shuah
