Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF9F1F16B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739758998; cv=none; b=pOSCp44D8a2laqGmi8q3KANDTBTTM9y2109omvUViedLfUbAIbTig9pB8wTDzuzoMQET5alEUoaKBfTnh+Ps1JIfX4vwDIamKiU1b6/ox7wnhCkf6zgbJX4w4l0B0A1aZ+gxLJsHn8NbN+cBTKUh92ui44rGEkxw7Zv0Sgr121I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739758998; c=relaxed/simple;
	bh=yxz8zrIHDtO7kQkfjxlZZSzlZ1TclU9ag6W2VmYuy9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9Ti58djq/AlBVH5mJYyZIg3Y9WTrtYZwL//SnNYDVftniXFarj9N399DPfAtN+A+Gl0bkuGTeki9qEQ7JxYDYFJLcjPbhAzm9s38Sxzqqk0beDmirUOoXuPJKtfGOGkwixYQsi2vIaHLf0OwyW2Y+opUALQcLpQs/Xa6YKuXRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDxt6uXR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDxt6uXR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220d28c215eso53584325ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Feb 2025 18:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739758996; x=1740363796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eATGpv/yzwW7RwTTlAQI0b6AWmzMq+BHQwUQKB0Quro=;
        b=EDxt6uXRS9fe/at3uMWwi4i4ohB8UO67ErHBS+3x3arHGV//L9iiaBLCTN0OQ1OWQh
         U47mgYLFIllCzgFc+/nYLe7h638KtU2k+xZ/yRlFcLacdPUtEmtqVJaPAbLR+luQ8NR/
         zOpn0ttRRCQJOgT/SaZ91EXPwKb5mhVldFQSspFBoG2Ts5VL8lZMCDUf8igRCejJfRCz
         RqXVNWSDxfYv3la892zmsqZEM9kEyskb6rUQnsLNB4zw0DVr8XuKB71oUBGQZituIK8/
         RxxGCD/JULuFWp6Xd8MTiaPArYiV+Qnmf96/MdpaWTHv+98OJKHky3j/mmpGSzjT4Gaw
         sdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739758996; x=1740363796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eATGpv/yzwW7RwTTlAQI0b6AWmzMq+BHQwUQKB0Quro=;
        b=KC/1VfWFEk1yyUgVWpvS/QKCiIqktFtXpEym684Olrjm4BYJXQyLzEto7na4ApnDhf
         r9w2OukwEjUaIPCf70sh2N4x1JdfEY2XCZpGiR5J2yW5lHG7eh4bLv2e5nkWsM9iqdQN
         gY3KfgEvrta7rM+SPSN8JbDNkaoEwqpdKCXGZZvzANlX71pRXKO73PIE0yznezZntIsH
         4umGbl6dueZllCUqXMeyp+NP8anIpNHtDCkiFZ+QvnLS2IzFJiA9J61oJpaM16puz+Bn
         UIcKcEB9Rc4dN4zh31UFxalBeYCmeLITUbByTEgmnyMPVGNVmKSBFSt5vGtpwBQMWrpg
         EcPA==
X-Forwarded-Encrypted: i=1; AJvYcCVRF6Jkys8sLDcJp4FSwe+w/acdaMEwGkNLy/Owcb+xNOHuE3api4Y88KFC8mF6KoNQLllFCAH8a1XrUxNsJ7jpA+VL1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+DcB+iYfnh/fCYK4Xijw17sJgj0ljgNAjpqxlvAWgDScSoK3R
	7gRvDH8lgp0yzmizoW73UrRznGN85eOgAiHC9tuQ9Q8ncuyW6O4r
X-Gm-Gg: ASbGncsxp6PsU8mp2F7pXVDQjAs03XaU29yP+Xi/l6KS0eR1UbwbuA2Mq1fQTdvY8id
	OTok/9gttcTPL5yXzwns1JaC95njk+Aac/vbh8v8zNgLV/pvxZ7gLJM34CQTaheU9R2b7jWnX0N
	rsK3vix87Z+Y37pJB93gxaa+8zW3Mhr5+gGHi+TDfd4Pc62k6I99HPZxU3/4TuimxqCZCshXYTh
	IoXf5WUyDFROyPXIXpYwDz4F1Qfc6hiGtz/QXSvmGvVcjjSArLLE9tUO2NBT1E+IUodmJAmLEig
	bXm3zlmKeDuhYNuLI39k
X-Google-Smtp-Source: AGHT+IFViZjLBVkpW3BxuNj7fXUHmg1Djc/5+NyaIqfXwEcnE1lFoV6Cujl/dUine4R6CXlTH10+QA==
X-Received: by 2002:a17:902:ef49:b0:220:fe51:1aab with SMTP id d9443c01a7336-221040b1359mr150473335ad.38.1739758996248;
        Sun, 16 Feb 2025 18:23:16 -0800 (PST)
Received: from fedora ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5e0b9sm6356740a12.6.2025.02.16.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 18:23:15 -0800 (PST)
Date: Mon, 17 Feb 2025 02:23:09 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Andres Urian Florez <andres.emb.sys@gmail.com>
Cc: pablo@netfilter.org, kadlec@netfilter.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, skhan@linuxfoundation.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net-next] selftest:net: fixed spelling mistakes
Message-ID: <Z7KdjZ80R5H4RlIo@fedora>
References: <20250217001452.29578-1-andres.emb.sys@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217001452.29578-1-andres.emb.sys@gmail.com>

On Sun, Feb 16, 2025 at 07:14:50PM -0500, Andres Urian Florez wrote:
> Fixed spelling errors in test_redirect6() error message and
> test_port_shadowing() comments
> 
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>

Reviewed-by: Hangbin Liu <liuhangbin@gmail.com>

> ---
>  tools/testing/selftests/net/netfilter/nft_nat.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/netfilter/nft_nat.sh b/tools/testing/selftests/net/netfilter/nft_nat.sh
> index 9e39de26455f..8143b877ae7d 100755
> --- a/tools/testing/selftests/net/netfilter/nft_nat.sh
> +++ b/tools/testing/selftests/net/netfilter/nft_nat.sh
> @@ -569,7 +569,7 @@ test_redirect6()
>  	ip netns exec "$ns0" sysctl net.ipv6.conf.all.forwarding=1 > /dev/null
>  
>  	if ! ip netns exec "$ns2" ping -q -c 1 dead:1::99 > /dev/null;then
> -		echo "ERROR: cannnot ping $ns1 from $ns2 via ipv6"
> +		echo "ERROR: cannot ping $ns1 from $ns2 via ipv6"
>  		lret=1
>  	fi
>  
> @@ -859,7 +859,7 @@ EOF
>  	# from router:service bypass connection tracking.
>  	test_port_shadow_notrack "$family"
>  
> -	# test nat based mitigation: fowarded packets coming from service port
> +	# test nat based mitigation: forwarded packets coming from service port
>  	# are masqueraded with random highport.
>  	test_port_shadow_pat "$family"
>  
> -- 
> 2.43.0
> 
