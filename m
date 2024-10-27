Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9618454E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730069621; cv=none; b=av6b7CznH4Wt4vsQwzsvCHd1WlcgQENs7MV9Hn+8XkW1caMiyOKsFIhdpIAEYs0d6o4mW6cysuqnklAFiFan8ixbjO1fPoZ2E69tSYg6k5VodnV3woTOp0ez8h9hKE01f5ywFkxXI6s317blSgueQBiRjYWKlfD8RkGHlKvmoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730069621; c=relaxed/simple;
	bh=u9/0ARz33371gpbvia/4zMBxB73y5XPWJIiEiIAFKo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORs+fVjAKixmj9DIFo21IC5o0Pwd5YIiFN7OccQTD2NNs7pXgjWUQxwWkCPPtHvvQXMGSx83jtXdsBjzgeCBOS8mt/0Fuh7sWDek7xHosjDR20P0GbhRz2P+nCBtj6uWmGuy0fBwOGbQyTSS5wvEYlQmQCjRdIBPgvkfLOhuOpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=fXMa7SaN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="fXMa7SaN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso2920858a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Oct 2024 15:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1730069619; x=1730674419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nro3XxCXpJF+bC6xNwB831aGBU1HecPqJX4rsBIEnQw=;
        b=fXMa7SaNHI24A28EMPX0foIjuf+0/sFTomXXT5gXwq0RlScMA6gjW7WZvpiCg8gKwb
         8IKDl38+f+xnavEh5ghuATebzbpFtwfQu7EbGyc6MMZ61gUS3SEQg3ZGaB9nSvLc+8tc
         UHx5BRct5fHApMB8KJSh1GxuDvHnEs5LRMq199C978x3PN1C2aUwS1xiL8yQmc+6eKPY
         bqlmbDVwm2Mcln5iN/ZGHJP+ocfD5TU938WGMHYk57Qeb+6DJO26u/zZ80eyRqfhk6Hd
         DjFAq2vbPU1Ijgs5w5RDmLJk6f0Uy2zww1RvAivzW3DoAxFPxkIUDuKWWIbpDLfYmJoF
         ThIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730069619; x=1730674419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nro3XxCXpJF+bC6xNwB831aGBU1HecPqJX4rsBIEnQw=;
        b=HXLFFPJu0QIhVcRYkOdDlMJ+9lObw4EFUrX3HO1e3BqbdAWC/uSDx+RmRZfNg2mu1y
         7pT+jAFywQNlc93oa03mgi8UfdGpppGzWITDwbMQP79nFyY9a5O2u1p77TUx3WiN/9by
         eVgXiTsWh8iU1AAUJSJPBnr9N9x/Nq5zL9FfuIMwr4yXPk1CHIUC/TjDWC1sX8u/9KuS
         lVzqRsFxeRTgffoUly+nWBCBrBp+PvPxhYkUrYV0sqQiJC8XpjA4LAfTnX4ZirADY43x
         4UrsPF9YNqeswO37EeJ9ahrrQf7VCLACEAM9zvVgjjzUYeQjaYsr1rtvxXbyPvaFgWkm
         uCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JGf+kXDNW1FupkHYipW8ZVvedNc6lFDzZ3cQPrXsA1LbhNyMBePDAPDQ0uuBABJLgJI97ix6gDJf3pZs7Rr3jVSygA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym1MTqeavxunzhxdmf/yWkmehw+HaFVmv+BqpHh5NWHBYwIjLt
	wg1DmPOjnHlz2T5Ooeo45LQeB01rr2bDPpw5qf6F9MVvSP6aM75yGf1l2svKds4=
X-Google-Smtp-Source: AGHT+IHJqXWaT3OZaNBdV7tF8LBOsA9mbk2i8yEcHUuwgfPiBXIf3iPvulK6GrS91qfDhUAAEqwctQ==
X-Received: by 2002:a17:90b:4b42:b0:2e2:8995:dd1b with SMTP id 98e67ed59e1d1-2e8f0f533f7mr7653538a91.3.1730069618666;
        Sun, 27 Oct 2024 15:53:38 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-86-168.pa.vic.optusnet.com.au. [49.186.86.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3555c1dsm5595585a91.4.2024.10.27.15.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:53:38 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1t5C8c-006f5z-22;
	Mon, 28 Oct 2024 09:53:34 +1100
Date: Mon, 28 Oct 2024 09:53:34 +1100
From: Dave Chinner <david@fromorbit.com>
To: MottiKumar Babu <mottikumarbabu@gmail.com>
Cc: cem@kernel.org, djwong@kernel.org, chandanbabu@kernel.org,
	dchinner@redhat.com, zhangjiachen.jaycee@bytedance.com,
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, anupnewsmail@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Fix out-of-bounds access in xfs_bmapi_allocate by
 validating whichfork
Message-ID: <Zx7EbudZfwLQDuVS@dread.disaster.area>
References: <20241027193541.14212-1-mottikumarbabu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027193541.14212-1-mottikumarbabu@gmail.com>

On Mon, Oct 28, 2024 at 01:05:27AM +0530, MottiKumar Babu wrote:
> This issue was reported by Coverity Scan.
> 
> Report:
> CID 1633175 Out-of-bounds access - Access of memory not owned by this buffer may cause crashes or incorrect computations.
> In xfs_bmapi_allocate: Out-of-bounds access to a buffer (CWE-119)

We really need more details than thisi about the issue. I have no
idea what issue this describes, nor the code which it refers to.
Where is the out of bounds memory access occurring, how does it
trigger and where does the code end up crashing as a result?

A link to the coverity report woudl certainly help....

> Signed-off-by: MottiKumar Babu <mottikumarbabu@gmail.com>
> ---
>  fs/xfs/libxfs/xfs_bmap.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
> index 36dd08d13293..6ff378d2d3d9 100644
> --- a/fs/xfs/libxfs/xfs_bmap.c
> +++ b/fs/xfs/libxfs/xfs_bmap.c
> @@ -4169,6 +4169,10 @@ xfs_bmapi_allocate(
>  		 * is not on the busy list.
>  		 */
>  		bma->datatype = XFS_ALLOC_NOBUSY;
> +		// Ensure whichfork is valid (0 or 1) before further checks
> +		if (whichfork < 0 || whichfork > 1) {
> +			return -EINVAL; // Invalid fork
> +		}
>  		if (whichfork == XFS_DATA_FORK || whichfork == XFS_COW_FORK) {
>  			bma->datatype |= XFS_ALLOC_USERDATA;
>  			if (bma->offset == 0)

That's not going to work. If you look at how whichfork is
initialised early on in the xfs_bmapi_allocate() function, you'll
see it calls this function:

static inline int xfs_bmapi_whichfork(uint32_t bmapi_flags)
{
        if (bmapi_flags & XFS_BMAPI_COWFORK)
                return XFS_COW_FORK;
        else if (bmapi_flags & XFS_BMAPI_ATTRFORK)
                return XFS_ATTR_FORK;
        return XFS_DATA_FORK;
}

A value of 2 (XFS_COW_FORK) is definitely a valid value for
whichfork to have. Indeed, the line of code after the fix checks if
whichfork == XFS_COW_FORK, indicating that such a value is expected
and should be handled correctly.

However, this patch will result in rejecting any request to allocate
blocks in the XFS_COW_FORK. This will fail any COW operation we try
to perform with -EINVAL. i.e. overwrites after a reflink copy will
fail.

This sort of regression would be picked up very quickly by fstests.
Hence it is important that any change - even simple changes - are
regression tested before they are proposed for review and merge....

-Dave.

-- 
Dave Chinner
david@fromorbit.com
