Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1CA2D3225
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128331; cv=none; b=YgrcshulW8ZEOL+MtAOkuyKlDCoxtLgyw1CQ9CZ7pH5sFipbOwjiNWS5MaIoPDzcAXSnKNxvcNybEFjgUdBUVDmqQ2iLevONDWYr/WnG4v35iWQHHlhRYQKAKIHeqgBnDs1Rc/Brk57+8P2AGdKiQzT4xjQ7oV9N6U4HXlfP6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128331; c=relaxed/simple;
	bh=tqbs7oO63N8yR2HpmHerFlV4caaUVQvhUe66a3YmVAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNx5LxfFXx7W56r3uUW4MHSsWi1Ym3BCKuvsP2+KS5OV1hYDi9kO9ISa7ILD7oHpVE32eTLiuTwq3bzCyRIoVpRIscSJo5Yj5e1853DwuzG4Z7yoSJQ6hPxHgS/JrlcT3HAxtNU9j0p2fmtC9pDzMp0Xfv9qBlM6fYTzZ/M/Cos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdGuqGGH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdGuqGGH"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so6977637a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782128329; x=1782733129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZN0bqyKdUNtriB1CVrOhR3qldEoHheMlch+Sf/+Qju0=;
        b=pdGuqGGHf6ydYL+Z6PU/JpMK+4shFuyJwDStA3C6qz/Gqvqo8BoC/7HSwC+erwGjdb
         ssNU/OyB1jsRB14SQHSc4+tk9KywB4xPKpuRXT+k/f580r4iPcbRIk4YB5u+ehLgcon9
         iDb98zFOOjN8avS4yLz3qtGZAtlLo8nsDd3Lb5gs/Dm9vQiTtQ+bkyvCNogZlPr99WGT
         TNI/eCZ5FXf02nRKDGlW3Q1DusQCIpR5/lz0nlzimHXz6GkSkNpPEVBu+qpoX49TiEbg
         Ck3uu3y+V3GozsYzTwwXJsUpPQbviehVSncnV4xDTKcIHi7XgJloOEv73KGFKqbwFu+8
         HUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128329; x=1782733129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN0bqyKdUNtriB1CVrOhR3qldEoHheMlch+Sf/+Qju0=;
        b=FHeJJPyWzDNbMmDjfqNPWB65aCFfzur4HNE402a/v5Lnk8DzK1xUsQpcGWYpcCCY3h
         +8co188VjWDhA7gsw7KqLpGHCfgniTVVsgGkv9clwildKNPPJWmMHPhU/bGfBTZtJJL2
         TO1kCmLubslbo4euw5WByCbkoD8qMdiU0fk22jefkw8R7eSWh/LPgRB6PoW8CJCKGP9t
         6/M4Z7nzUJxLOG/VYw2ka79PZ/h0tJ9jgazk3YRSkB0O5ZlAe2/XPbhxHZK8SfQ/TCVQ
         4Geqv1j/HN5j18+l3wj05c3aFJ/JNlx+wzdgBRQamK1jtNi4gfWRMILDp6QqkL4qsUY3
         Gy9w==
X-Forwarded-Encrypted: i=1; AFNElJ/fkJWaT7/d9ImvVx5UQvdmqSTsfzRk8IzqE0ndgv9JpWJp3/UbOb5yaI1hs4xkqYv35DyG3Vz59rrVA1m/OJ9FjcJpDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyCLzgMfZ6tlEVbGZnBJOO/F3dv78pM44WhvhzhN9Y6pU/ea77
	nArPaloA0XGR0TOzJz2mhL+fRUW3NW3IpNn/eXYlRVb1Bl8F4yOtMeCN
X-Gm-Gg: AfdE7cn4g2rkYQj7mVGFnHSPXKeoAWi+D06o/3W1GrmlNWWIIX4JWoA54pAEBucKKe8
	PlIh2t1wr6VHsJO/eCeYGm5g9FwfyxAhzM5nMFArxPV+7geLmw+DbzdqgLndIEhbK5S4fS0krB9
	VXt0Om0JyzLTYuAw8LpSeb4r9jM2q9arpgySmz4kCLiWjkDiwqAM6o9MNW462i6WGOqQpwsWUnG
	avym625mSPXY3wgmUDgn+01K9N4il/YFgRlNaL8v15kIDk05TODe1YqqheDOrsoSPfxMuO73gy+
	MyIwTpHfK0AoPNTAUi6PTe6m3o1Ow7g2gwrF0PpOF4cdk6462Ar4WIG9LMC/bzvJkem8a70DG/P
	jns3bU8jPAfxRblX6niSb3rozkvV8xfI6zUdhE5h36AUbPw20hzCII1yz6x95mxImES+bHChJby
	ItfkeO7UtS
X-Received: by 2002:a05:6402:4485:b0:691:956a:cf64 with SMTP id 4fb4d7f45d1cf-697029820d7mr6096784a12.12.1782128328809;
        Mon, 22 Jun 2026 04:38:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b86f480sm3150666a12.13.2026.06.22.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:38:47 -0700 (PDT)
Date: Mon, 22 Jun 2026 14:38:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sajal Gupta <sajal2005gupta@gmail.com>
Cc: linux-raid@vger.kernel.org, song@kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] md/raid5-ppl: convert pending_flushes from atomic_t to
 refcount_t
Message-ID: <ajkexPNDqjzawft3@stanley.mountain>
References: <ajkVDGAdveCH_urr@stanley.mountain>
 <20260622112855.42685-1-sajal2005gupta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622112855.42685-1-sajal2005gupta@gmail.com>

On Mon, Jun 22, 2026 at 04:58:55PM +0530, Sajal Gupta wrote:
> > Heh.  Yeah...  There is not a chance I would merge a patch like this
> > without testing.
> 
> > It also really feels like an AI patch and you're supposed to say when you
> > use AI to generate patches.
> 
> I wrote the code myself. I did use Grammarly to help with my grammar and
> phrasing.
> 
> I'll send a v2 with just the break fix.

Thanks.

You're right that calling atomic_dec() in a loop seems pretty suspect
as a design...  But cleaning it up is risky as well.

regards,
dan carpenter
