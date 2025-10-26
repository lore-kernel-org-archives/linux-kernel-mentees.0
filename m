Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AF625F98B
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761447397; cv=none; b=EGb6z438KDMm8/fIYJoky6iJbKxo+jFmAueWLkbDrjBSctuBquP+fhZdoK9wvEj3wANitVTwbTsVpzxLC/aTEpTHKzFgt7WzGyQa01ZdPi/2EcBnSmW9v984l+OyNCh059ontTTFDuWmra/nv9fvAa8YF58uZNcJl36uLzqbgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761447397; c=relaxed/simple;
	bh=WMIoHeGDeQN9kTV67+ZtxnZ2djlpcLNFGvv/kEgUiRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1on3gktvXFI3+5xuaj2Hwpnh32yURtDqgpnf5dCXQMiJY4cPsxOf1ZBZ6g7OH1MCskMHOLLpfkagmeC5qJY5WY8pQx8d0XDq44c/QqZ/XgEIwmqfcqnSZTFOEVMSPGT4ZBBxYRv9RtjQhj0XPq1/QOf71nIp9WxUeXWqZIFw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKPH5VKs; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKPH5VKs"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-932bcc0bcf3so2598959241.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Oct 2025 19:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761447394; x=1762052194; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfE2kMhhbNGjJf4FBWUzEJkfsNPGT4ktOzq6Ee9jcQo=;
        b=AKPH5VKs3qmiyCg1mSChI6miKJMl0uFnH+cy2m0mzb23a495cqyQbcbwNvtLs/ijeC
         7ypXdxr/TkgI42ClrYzIKo8kiz0n4TQpbSzx6ErWydJaKlD0l/ee9XxAng34rEBVfHlB
         K9Adv9a+2muq7fzmNbw/UrT0iLdvdrHFfctGyDLt9BzkSvjHv0Ia9UcUgiE5lcEhhAD2
         558LASBwpxA6v+KBO7htHRe08keVLjP9cXIotKVqfDJ58c9nWL1mCi5ovq8OxNRU3XGB
         65e8ARI8oNqtEOOTLVn2Q3+M6lzErdGdUb9fknvInWYdLPSfD5+7QrFPyT2MYmTDh43C
         1sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761447394; x=1762052194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfE2kMhhbNGjJf4FBWUzEJkfsNPGT4ktOzq6Ee9jcQo=;
        b=NwhNyBhCV8XUa5kSwTbm6eIyH30chbo8KOtCQLwiTU9FncylnRd477uNCucBOETRrZ
         /0dC+VSl48iovC3wfiXFQe6Oj8RYHAvU7dY1TnKNrhsFP/JWRVy/wRBy/Cw0QexXuvP2
         NyZjrufNHI15dIE/0i3ccEhvnn1oXlmyKNl8Ryq/RsXTSFf8kl77+HWs3374G5fqOaL7
         JSq7K1bvpN88T1yVUiDh4XwfC6FIPTin4rHuoCjCmM9R7hO/QN80b+RaqdJQFCeDfMw4
         0wB3O7I8Q5WVlFkia+wE/TXR6OJadK85bxaPzBYaDvIfrYlMNx7mNQjupwoNDbzWhWoe
         6tyw==
X-Forwarded-Encrypted: i=1; AJvYcCWj7ssaMKJDXEJ0iTYfeQIKRV5A9TovXaNXNX7SW1kT4cjrH46LbwOpuhqOUViytsukCDXD9TroRwYxrAoeDyBmlxiL9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMUKXGIv6636LgZzOEIJrrXjuivw4rMw7wEEifh7iTj6U/0GPJ
	x+w0fkA96WXnJr+4ACYVt+v4/Vf2iBovRQIJIbit/AH9bKfk2Lta5qEl
X-Gm-Gg: ASbGncsYAWhBv2I6Fo2a6ka+W1CKVBYfPaF785qRqihE9O9z3uLv/Wy8Vd4d/tbi7b6
	ILzWZHARnQ5VUxT8XExwvzEoq1jKuFAkzKT5dk01ZSX0fFy6v2NCnhTN2bRTrJ/JJemmxwIqtTp
	dCxFzEZ/jQPUBZq1v7gpmMvxpHZvoQZq4ZC+pM5TQXGOoW2/Euc/h5L1XIGoAfEjA7UwFHm8aRi
	NjRAkgs49xOeiap2jJ8j6gVEXne/wZxrQlqOMa13dPiBjRYn0BY2JJ9EJgvv9Fz2vdd00ffoy9R
	RYa9O2PUeskzRolcR8qGwUvhJPQtlttqlMqgEYhF7xxIPMnl/qvIno623qdH9880mEaa5e4LF1/
	3BpHPk4rSRyH0UVs9cqk6iC0IiXEiJKY6o2KBPsnUDxZYMHJEmW2fdU5yZfV0CTSyfPsKuU7XDW
	Djy5ECpRav8TeR90HY
X-Google-Smtp-Source: AGHT+IFEvi5BCIpNjIAk+L8wx9AmdLN0mDrqj0eQcdBvzBhQkclB5kD87AXiHagxZsym14ibMVgy2g==
X-Received: by 2002:a05:6102:50a0:b0:5db:242e:71d with SMTP id ada2fe7eead31-5db242e0a11mr5274445137.37.1761447394606;
        Sat, 25 Oct 2025 19:56:34 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e592e61sm1359406137.13.2025.10.25.19.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 19:56:34 -0700 (PDT)
Message-ID: <d1a483dd-5405-4e8b-8a38-816d49fffbc3@gmail.com>
Date: Sat, 25 Oct 2025 22:56:32 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: tty: add tty_tiocsti_test to .gitignore
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 khalid@kernel.org
References: <20251024161909.327158-1-krishnagopi487@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251024161909.327158-1-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 12:19, Gopi Krishna Menon wrote:
> Add the tty_tiocsti_test binary to .gitignore to avoid accidentally
> staging the build artifact.
> 

Why do we want to ignore building this artifact? When submitting a
patch, it is important to list "why" something is needed. Not just what
is done.

> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>  tools/testing/selftests/tty/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/tty/.gitignore b/tools/testing/selftests/tty/.gitignore
> index fe70462a4aad..2453685d2493 100644
> --- a/tools/testing/selftests/tty/.gitignore
> +++ b/tools/testing/selftests/tty/.gitignore
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +tty_tiocsti_test
>  tty_tstamp_update
Thanks,
David Hunter
