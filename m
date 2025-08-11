Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E91A9F9C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754955439; cv=none; b=r3dUU4BJeDxz6ql5nGuP5gWcmjzbYyICksmQfxfq53weBGgLeFspOFxuPH6rlTShFpaycqhfjHJpiZGZdne2TYbv/1B1qXnrrhcCJz+KkDEcynhbwnYkwTcE+Tp3+nOZesO7EbXzSzR+Hd+ZKiuH7nu9qr/wugQkV4oZrIdu96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754955439; c=relaxed/simple;
	bh=t+BKRCWZsKqgAOgvdI/IQS5v4/7HhWU8/k4yGH4GnXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz2H0fYhLaVKp2B9e+vtRmAe2E8SwcJMBi2QFSooHkrh9t1gfEqzmQDD3iCMEG7Pwmyxbk7j9w5b49VD7nSZ+6KKT8bjWelBuaxrL1hlF3ryNgv2FRyUZcyj4P//wuIp4Mif8sSQSphwO3iyZxiX2v5GsTBgP88ihbujCxtRlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=Wp+Q0qWW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="Wp+Q0qWW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so5912919a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 16:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1754955437; x=1755560237; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfmfLdS2dFzqX+Fr78BWjugD3hNZ34Ysqu9SesKrFGM=;
        b=Wp+Q0qWWwmKhgkzf3VaJUz/hRQ5cImsvOiPQOlzlemtP3QU6sBLLDActzI6mZxoBjz
         WwgmInwf3oNOZXXXFYhlrg/1smfSfZrvBvrY/K+uVZXGYmpZ13Xrugqj/xZ/kbKj1EvS
         iwLQ9mPqtui5yoqHQeG1PDh72ya6PThMMrQXB3KdNTONRfA3oRNnVccZLa9cEs5elAk4
         yP5RQPuOQid1xfforT+U3KCGno4Db7tCdPI0V0WkFadCyUg82qL/N8f7mUIUJyuTihqr
         tsdl22R6K5T87XN/wrdYeD9fUu1TmRJ78Zpj/jmmY6t34iQ4qVX9Zz6LVzU9LAjcr7c5
         F6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754955437; x=1755560237;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfmfLdS2dFzqX+Fr78BWjugD3hNZ34Ysqu9SesKrFGM=;
        b=shwYnajP6+QZVbAJDjN/iGL+PtlREunzKS6OLsTqQhga+sQrCX6liI7p5ld/SIj+w8
         feQ6HpO+9KXMlpOhaCCAS+EFMr/In+QP4WZmkqX3XBKuaL8E7sf4d52gks5lYkH+w/xy
         C7IMzW6YxkIckqFX2U4BTgNTAsOzNpUWab4sMWtqq8Por54+AFmdn8ltFMvP2gsB2O9L
         LQo14ACUXZd9lBzLhvzQJxn96mzbE61T1DolyQRMdSBY9HuHiQHOaXS6NjakGuKX160W
         oiFA1XGzsxuyEJ+gTP4A4+1grGwxq9UbwTuvmEwDcnqdoR5xLZTfSwB5li3/NT1pm9oR
         OM9g==
X-Forwarded-Encrypted: i=1; AJvYcCX/9w0i1G7QzSMRTI7Gup+4TWx6XSe0aABN+LihlGweSpSSAp3VQ6zYjsDpKIdaVylXqY+ScyuRNxtwdzxgjDrdfLJoLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTjPJIqz2DmqjJNO9ru6nQxl6qP+rlt8Kf2SWpqHShdIXFWwLl
	5Ecni0tAqsQ8rhzl59xWKjqw090x1TRPjQzF+V+bmX9VYQIs087D1adNBxObEzCi7VU=
X-Gm-Gg: ASbGncvLwBmyirj7oJzZdt/GA6lY46K4Bj8hf1II0wiCVZPyJwxSh086oy1kMAmI0DC
	GFDosMNwVa9xG3sRYG8m1FeHWrN3MxDR1MdIFj+DwPaSBpge6AJBc4SZ8BGuefjuqwwiz6qrxyf
	0ny9l2qfssCE1Slv5TYvFINi+0o6Wa/k8p7T43XbEMbF4qVc0nseJpaw44gV9ktN2akrZkMxlKP
	uzPn8rXJVh/+7KgWwTI80iPHh6cM/vAMMmxwWP4VZ5OF3aavDnAHs++8nNK/NQtefS1rrn/a0Es
	FqWW+YVXTDBwvqeD+wABNVguVACG3SYKcW2hpsAwsRv8JlKJCZuTxxhPbbqvelVCI4+wHpGLgYi
	ud/uQwsDPXAB4h2OpEwaTJ6u0yn5G7lyC6luDLNsihuAOD6AaSth/l6OZXNz0EWWxpPQ=
X-Google-Smtp-Source: AGHT+IE+UBYandDx5z87lM/XbpF62WzKz4U6tb9Qgmd4oPQwzpn33MGHYW9itmHr3TzEusfdJbbs5g==
X-Received: by 2002:a17:90b:54c4:b0:321:156f:5c00 with SMTP id 98e67ed59e1d1-321839d5850mr19572692a91.1.1754955437052;
        Mon, 11 Aug 2025 16:37:17 -0700 (PDT)
Received: from MacBook-Air.local (c-73-222-201-58.hsd1.ca.comcast.net. [73.222.201.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32161282b5esm15905398a91.27.2025.08.11.16.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 16:37:16 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:37:14 -0700
From: Joe Damato <joe@dama.to>
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
	jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH net] Octeontx2-af: Fix negative array index read warning
Message-ID: <aJp-qm55O_ka7vSv@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
	jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
References: <20250810180339.228231-1-chandramohan.explore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810180339.228231-1-chandramohan.explore@gmail.com>

On Sun, Aug 10, 2025 at 11:33:27PM +0530, Chandra Mohan Sundar wrote:
> The cgx_get_cgxid function may return a negative value.
> Using this value directly as an array index triggers Coverity warnings.
> 
> Validate the returned value and handle the case gracefully.
> 
> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
> index 8375f18c8e07..b14de93a2481 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
> @@ -3005,6 +3005,8 @@ static int cgx_print_fwdata(struct seq_file *s, int lmac_id)
>  		return -EAGAIN;
>  
>  	cgx_id = cgx_get_cgxid(cgxd);
> +	if (cgx_id < 0)
> +		return -EINVAL;
>  
>  	if (rvu->hw->lmac_per_cgx == CGX_LMACS_USX)
>  		fwdata =  &rvu->fwdata->cgx_fw_data_usx[cgx_id][lmac_id];

A couple pieces of feedback for you:

1. Since this is a fixes it needs a Fixes tag and a commit SHA that it is fixing.
2. cgx_get_cgxid is called in 3 places, so your patch would probably need to
   be expanded to fix all uses?

Overall though, did you somehow trigger this issue?

It seems like all cases where cgx_get_cgxid is used it would be extremely
difficult (maybe impossible?) for cgxd to be NULL and for it to return a
negative value.
