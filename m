Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CB31DDB8
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758830778; cv=none; b=k6FX7jMCU6Lg9zGVDUERjTzI3NeVcq5tjjX0WdqcnQdBjVpA9Vg3Z8WmjPisYx++0HWqka/EUFFrhVQxDIGt93YkkX5GHE05vyh5XZfwJAw0U22MNuD8Dxnnhyk+2OK18XE3PvG1t/NQFdLVxW1Dm42S2xUQlWbYC5+a3+sOJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758830778; c=relaxed/simple;
	bh=Xx1KeRMb8qASSXQQi6oPfzSHjtino2Erc6qXBCGf8kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhr69+lJmvQ/0/El26ZAjkOSfY/L/YOdhBHrymNNp8Lue56a5NlzZvj2yn2+8ooUWCVLC+pqiqJ9pih1dvkdHYz5tmtl3oVWZuAXnnmN7yEqdySw3Hxh2KeOfhf2Dglg509TI3qZrll7dwpTPuYxz9q+WA2bhd47B7hjtXaleKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Rie/dGhe; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rie/dGhe"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-893630dba34so67031939f.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758830775; x=1759435575; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4J+q8Jl9uXHJWsnYE6h3kFUoOp3/nCTgLQNbxMPJA=;
        b=Rie/dGhe3Zu9wfg2yi7EJSpVGWShxSh8/tB+r9+ajK9c2HjnUY0PYzOxinSvxdyo4D
         R1jt3hHGolObLJ0Kf3sytxkmMWtuJHfomelF4h1ytcfId/Y9sjcPWurA+lDFm6jSkJNJ
         hvUDEdnEHlKpwXoKE+uoTx2x6BYs1iCJsZThM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830775; x=1759435575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZ4J+q8Jl9uXHJWsnYE6h3kFUoOp3/nCTgLQNbxMPJA=;
        b=gILzyCtO+SBHmlHBZJLvy6fSDL/KXw6ZIyNPeNyK0rnoPmojgxnwd6lKR+rgyHfvxS
         6Wy7kLX2S2RDhew5Dj/8yjkMtpFreVoWNtEeikfsDOunwUq4t5zgRe3umyGJnCD3Shll
         1vreJddZF0dMe6NcUdTUmuaug/lfwQ9LxR7BQfXI1kQA55iuYfCFNidoG/0kwtXEwcM0
         4OASIDuv26axzUf/9e3tTvb5hqDdd7Y+44ovIhMLBOyenNYFfMlcZIiREdZtSwqBaWVi
         NJNdhT7cNZlmgV8RdbHZi0l1fryVuj+adYoCGM7L+JzpiTRE/tpWdBC4TVmGWyhfD2DX
         6kig==
X-Forwarded-Encrypted: i=1; AJvYcCUctxjmEkkKpG9OH9HF2LpeyHP4cmcnYp10WuFbfRZ5i8z2uqu1iIy4yGR4yM/1ika1qt+0iGx/uGBed0PxIQNo3mZn1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJi5oqz74ejFBEgx+q9rO2JxM6F3Vssi/WN2sc/BOAvSPgeo0a
	9wXg729OrNxkvttHF4kdtmWL36O8sIIPfnPlgqc2JoXDH4YRE72PM0RFH1ynv0XqW0A=
X-Gm-Gg: ASbGncuSoZxorw3hRJskwx+7Tp/kXqOfEZC2dEIym8IOfNP1ZtSJJBYx4Cz2jcKSGYr
	sjKIITXHioFyOU7/R0l7vl6wopZAvvzMrIT17VTsSFubSKyQVC1B2pMy4GBweOkmsFkYICOh3hz
	oMCWcM6mcH1WuHBQMIms1FvymPNpDJ8dKMPzB8VLUc9r6fegLEXE62FiplRNl195TxQIjQGaVCP
	55lHPmMplnHJvKcD0E5UHFLfffihgwGLIBsW/4ZRXY7o102wqV78CtedJthBE8FJrOxa51DvFTH
	44MiP+aA/F4C3aUlbe8nx8FbP6AIdCANQjjsnfSwypweGu0XCLdb9abIiC9/YJMWU476hnsVbQt
	3WHChY9SxaaswcmHFBAb6bRHHn7XRspd7kjY=
X-Google-Smtp-Source: AGHT+IGgoqo4FexGR81T+2V+UyC7F009+mx6SQ2pBJCOPIpWzVqCjsnAHekbeNq05hlbCiQ/ymxj7A==
X-Received: by 2002:a05:6e02:441a:20b0:427:5aa:4570 with SMTP id e9e14a558f8ab-42705aa4687mr13249845ab.3.1758830775392;
        Thu, 25 Sep 2025 13:06:15 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a648d1aeesm1082556173.8.2025.09.25.13.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 13:06:14 -0700 (PDT)
Message-ID: <650a4711-1d33-4582-be84-19ab99ff7f82@linuxfoundation.org>
Date: Thu, 25 Sep 2025 14:06:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: perf: cleanup fujitsu_uncore_pmu.rst and fix
 htmldocs warnings/errors
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, corbet@lwn.net,
 fj2767dz@fujitsu.com, will@kernel.org, yangyicong@hisilicon.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250925195442.71997-1-krishnagopi487@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250925195442.71997-1-krishnagopi487@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/25 13:54, Gopi Krishna Menon wrote:
> - Adjust spacing around list and sections for better readability.
> - Use definition lists for defining events.
> - Replace block quotes with code blocks where appropriate.

The bullet list type format used above isn't right format for
change log. Refer to a few change logs and also check submitting
patches documentation.

Sounds like you are combining formatting changes and warning
fixes. These are better done as separate patches.
> 
> Fixes the following htmldocs errors/warnings:
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
> Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>   .../admin-guide/perf/fujitsu_uncore_pmu.rst   | 130 ++++++++++++------
>   1 file changed, 87 insertions(+), 43 deletions(-)
> 

thanks,
-- Shuah
