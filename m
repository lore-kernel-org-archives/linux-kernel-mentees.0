Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7D124167A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  8 Nov 2025 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623013; cv=none; b=d9SJvMsXIyyN+c2mWwfsfkOzrL+S92f8Ve+fdttci6aGu7hQxZxVFjd/ZvtD5vPh71M9a6MqV9oSLyEubJo0anK3yLWLl3O72unhdVfRDox3KYCX93DOAiQNC8iXWCI6ClNUQmaDu1V1Ld0S+WXNkF6st5XRPh3FpIVy0mtTm/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623013; c=relaxed/simple;
	bh=mqvOz/c5PMEmaEMrlMTr9mIFRYBwkDh40KxWBaUTkP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F22BiPHq9qzllkbP/YhgPOhAPOwVxCHUDxN2vWM7xh8Nny/Bb1fqie+YDqpQN5ah9rXFYJ70H2P74E+ihKKg4bmWMXdjYCQ5Hlmj+ejiMs6R7J6tg8EcezukkvZJjXbjxlFiRl8oxejt8rga3NXHtEfnrbtPii25IOBo8JCfMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwh5YIbO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwh5YIbO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AB0606F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  8 Nov 2025 17:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L85JDl8mgJK0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Nov 2025 17:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1041; helo=mail-pj1-x1041.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 539E46067F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539E46067F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fwh5YIbO
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 539E46067F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  8 Nov 2025 17:30:11 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-3436d6bdce8so825968a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 08 Nov 2025 09:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762623010; x=1763227810; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ksh9yCu4UesSZktaqp077/wo5kGK4/tiGrzTuoLqT7M=;
        b=fwh5YIbOgzxaW/LKsTKi9yc9sg1wKBXLExVJaSe5PygH65ChkOgx5p6Sg+SF3Jzxap
         7gmp3YE4XenSLyIioO1+9uBu2z6Xj751lercGARo7oZQ902boM1bfYAKtzraotC1XGGD
         tbFoB1ynqIILUjebQCDRZpwlu+vbbZBlQXTEZDEgak3jLSZa/+ktQ5L46P8TPt4HfG4g
         Yvbrx2D7enWucgv84MUN2o+By/gYhyEH4nKT3OX9+yqm5/cPgAEiFGT66mqZzB9xKVM/
         yvImRW87uBrtynNjOAA2BWWJkCWq9nx+D+BJngS57kWfoNpsbLG6GwgeCVUWuzkqnKTr
         I3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762623010; x=1763227810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksh9yCu4UesSZktaqp077/wo5kGK4/tiGrzTuoLqT7M=;
        b=C6nINRcM/saR0Ec2n1ND5/hL3jjbpRCSmYWfgnnxK15Rjd/6YXONThPKyCPJqhSvsd
         M6Hb+IXqthUEFZt5ynIWgMWLYhHY5jvJryrkCT08xOKGgpsqurWjbQlHlHmGFGMpArLA
         FmOCqME6QxpiETy8yJQC6mxXphTf72WkG5SrNPuSysqgzt18JPVQn7wafBO8KzG6N3cR
         BA3YisKxb/wEQPK2j7QeXz8Wo6BRRGnsn1ireWkQL+ZZBHwliWxrahcWsrc1EVK5NXaT
         FjJk9lw9h9KI++EsocQfFwX6CSSktzfLk1gJqXBXzCf0UIusPeikJKuqsXSQJKjSwogt
         GmdA==
X-Forwarded-Encrypted: i=1; AJvYcCVKG4IwQAfcseUu5kixp2zeCEDy1uG5GTfcZtTozrUCWGDqvT7Fp2m6YDP4veZ8Cd67bHlwd+ITc9EPZXifdRho5t51FA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwfUMHkSq04/0n7h4mAE5NAT1PsL39J+ovHnb2s7ePk6Qgecvq0
	sZdQBPjCzk0RFWTlra8p/tZ0vNHOWdyUzZyX3zmuwj919gn3NMyi0H2s
X-Gm-Gg: ASbGnctn1YcOkucXp2aAFHsLNzep7HXY75Pf3PjinGHhHeNfs+RPIT3N7YxiHR6NTn6
	MDE/PCBiRqwjJ/opSRAJmO7qyI2CKmMyld8y6lop/iX49Q7kJ7hz59LgICAGg/p5h7eji2sV8be
	DP+mk+IHH8BbgCyUxMzJ5Faz78fDUWeq3Ap8CST2aSPXwGZR9DaH6pJnYU0xkeJCTto/HeV5oh7
	NNnABtWen6LDWGeDnLoAGZQKMV8vkgdk9eBt5sR9ikwOcmH5fjNnkYtwGpINxKzMyXcAQJLP8nk
	fC0uxfcCfT3NCAjC9aDtnstVD8OUC91IEiJmHebnYm+uiGOq+ouoEOEHdhbMRBQ32X4OswGqlBk
	3+DRMtiPu6DAeSwz4RIMuo0AtuUidTKfHcR6cgZzDdbdJa36BAx0p7PVuYfxcjpbVgNoxFx+xhb
	MkuPMiOdsgF8tgcSbtj5o=
X-Google-Smtp-Source: AGHT+IFLUU/VWag8EJzSY/0xYAOHUmVtlabS8D9NAS2JD/HU1e2hrzCK0vE/MQxp1herrE49UHd/uA==
X-Received: by 2002:a17:902:e848:b0:296:3f23:b939 with SMTP id d9443c01a7336-297e56ce0b1mr51308795ad.42.1762623010252;
        Sat, 08 Nov 2025 09:30:10 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c72esm93914635ad.33.2025.11.08.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:30:09 -0800 (PST)
Date: Sat, 8 Nov 2025 22:59:59 +0530
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftest: net: fix variable sized type not at the end of
 struct warnings
Message-ID: <aQ9-F34aW__rlMuD@fedora>
References: <20251027050856.30270-1-ankitkhushwaha.linux@gmail.com>
 <aQD8AOZduY4Fit3k@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQD8AOZduY4Fit3k@horms.kernel.org>

On Tue, Oct 28, 2025 at 05:23:12PM +0000, Simon Horman wrote:
> On Mon, Oct 27, 2025 at 10:38:56AM +0530, Ankit Khushwaha wrote:
> > Some network selftests defined variable-sized types defined at the end of
> > struct causing -Wgnu-variable-sized-type-not-at-end warning.
> > 
> > warning:
> > timestamping.c:285:18: warning: field 'cm' with variable sized type 
> > 'struct cmsghdr' not at the end of a struct or class is a GNU 
> > extension [-Wgnu-variable-sized-type-not-at-end]
> >   285 |                 struct cmsghdr cm;
> >       |                                ^
> > 
> > ipsec.c:835:5: warning: field 'u' with variable sized type 'union 
> > (unnamed union at ipsec.c:831:3)' not at the end of a struct or class 
> > is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
> >   835 |                 } u;
> >       |                   ^
> > 
> > This patch move these field at the end of struct to fix these warnings.
> > 
> > Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> 
> Hi Ankit,
> 
> I don't believe this change is correct.
> 
> I think that the intention of the code is the char arrays (buf and control)
> provide the buffer space for the variable-length trailing field
> of the preceding structure. Where we basically have a header followed
> by data. But your patch would place the before the header.
>
Hi Simon,
So if buf and control providing the buffer space, then i think it is
better to suppress `-Wgnu-variable-sized-type-not-at-end` warning 
within this block of code.

	#pragma GCC diagnostic push
	#pragma GCC diagnostic ignored "-Wgnu-variable-sized-type-not-at-end"

	struct {
		union {
			struct xfrm_algo        alg;
			struct xfrm_algo_aead   aead;
			struct xfrm_algo_auth   auth;
		} u;
		char buf[XFRM_ALGO_KEY_BUF_SIZE];
	} alg = {};

	#pragma GCC diagnostic pop

I think this would be fine.

Thanks
-- Ankit
