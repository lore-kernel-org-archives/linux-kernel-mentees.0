Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DBE4A0F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727607624; cv=none; b=UjZ/hrIAHvuOTxMEa0wdJJA4phURW9XjRle+KbvqNYyo/JNRHgPvdY8E8BFR99m/U/PsgaViKp5AUQf+kKpoV+TOAkOPusHiuIUBvZN4t1vcl8pLfvWkwvRI03RRkxivKuWwM5rGB9rxxLf/TRGWqldINAADsBTm7O+ZqRfkp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727607624; c=relaxed/simple;
	bh=Iq77x4MLEGgojJ8AajHtBHQUxibrdfvijC+nEkxrpyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PNd6vrEDFMkE/H2ZabL16KJOTb3ThsESTiNK1rg5zlBscptGdZOLodbGbvr/KzDVMkEcnv8QJtkN9HTW/HcBpwdCZwuwGGkmh7EzBK+B0MCjOuH9J555mXfNfXi2DzUOd5248+yS2aATElsBkeS3wdb+shLL02gsX8GtSStZxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fL9p5kzu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7Av+XuoK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fL9p5kzu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7Av+XuoK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0B0E403DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 11:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.8
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejgj16Okum0e for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Sep 2024 11:00:22 +0000 (UTC)
X-Greylist: delayed 466 seconds by postgrey-1.37 at util1.osuosl.org; Sun, 29 Sep 2024 11:00:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95B8E4027A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B8E4027A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fL9p5kzu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7Av+XuoK
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN> 
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 95B8E4027A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 29 Sep 2024 11:00:21 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727607151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neHGIRG6ObTmuPNtZ+HaQ6fkZuReAPwqce8LCfhesuk=;
	b=fL9p5kzuRIt6VGDA4RqBBmjkjWurYlThgac0kd3CKMhoj/UAzRy8EfTLixAGXmF/yelOQJ
	/eiOL+6S3laniMoL/L4Wc1EQ+hMLivw54S+rklsqNSdDTcv9sT8RpQyK+4Fb8bO86y4Ihb
	MJvurKXcoy9Y0+pFVJAUvDImGKATgC5iBwE/KsCaRTT9sPU1Zk9LWuY29I1YX/iEHVbEQY
	SmOkoMNB5MfFxEyyeag4g5fj7exXam+/DuSpkX194RRFhPk8+8b8eg3u6dWl+WB9xo+1FF
	iJleTPP7WDPjcvJnEoLYb742dyUtMVUHAOUSbUJtsS9fF+GlBPNu7c8EEMCHfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727607151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=neHGIRG6ObTmuPNtZ+HaQ6fkZuReAPwqce8LCfhesuk=;
	b=7Av+XuoK9qEYV+knfSqJxYR6azNXDFlqEPeW7nwvoZqQ3MsruyCQ8xtluUgrJvW5lpZYLP
	u9fNoXOowK3D1ZCw==
To: Remington Brasga <rbrasga@uci.edu>, Christian Heusel
 <christian@heusel.eu>, Shuah Khan <skhan@linuxfoundation.org>, "Ahmed S .
 Darwish" <darwi@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Remington Brasga
 <rbrasga@uci.edu>
Subject: Re: [PATCH] kcpuid: Fix potential dereferencing of null pointers
In-Reply-To: <20240926223557.2048-1-rbrasga@uci.edu>
References: <20240926223557.2048-1-rbrasga@uci.edu>
Date: Sun, 29 Sep 2024 12:52:30 +0200
Message-ID: <87v7ye20lt.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 26 2024 at 22:35, Remington Brasga wrote:
>  	if (!func->leafs) {
>  		func->leafs = malloc(sizeof(struct subleaf));
> -		if (!func->leafs)
> +		if (!func->leafs) {
>  			perror("malloc func leaf");
> +			return false; // On malloc failure

Please get rid of these horrible and pointless tail comments.

Returning false here does not make sense. This simply should terminate
the program.

> +		}
>  
>  		func->nr = 1;
>  	} else {
>  		s = func->nr;
>  		func->leafs = realloc(func->leafs, (s + 1) * sizeof(*leaf));
> -		if (!func->leafs)
> +		if (!func->leafs) {
>  			perror("realloc f->leafs");
> +			return false; // On realloc failure
> +		}
>  
>  		func->nr++;
>  	}
>  
> +	// Check for valid index
> +	if (s >= func->nr) {

What's the point of this? s is guaranteed to be < func->nr, no?

Thanks,

        tglx
