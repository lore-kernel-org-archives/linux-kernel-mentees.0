Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942A8287E
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791761; cv=none; b=EnQdjq+KjR9dftC58kNK4hGBttmhhwUWqrjau15nLo3B8wXEYc0/kYBUktZgJNCm1mN5pNH0brjOCIgxN4FxCT9JWjDKIdxkzha7m68smMlbOqnmuJyPuZyqTi9xN3IPzzjlgdoe6sU+PQCdd9Jx4MVsTLc0pUMI4lL+LSCKsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791761; c=relaxed/simple;
	bh=4MTBUHheRoqjhOd7BBqxKj4o02h2M7yKv1+pjK7zjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsocve03ANnR8qQzmZFR8Xxvdp0V3CJ6fUKVXsvRCbD0/lTP/9kn1ROQDWIKAp8FAGYYMJpCMvAZzs8JTpg77dQvzg28Aw/tRKVjwBYAG4OWNyPAnMvtIw5B7bFMV4aYkp+fffW8UqYvMgMuryw/Tp+rvCVuULgiI4Wmn1fQSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOtBI7GP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOtBI7GP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2897522a1dfso28736695ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791759; x=1761396559; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=XOtBI7GPHLzPwRS+48zTmwnKkRlfKJDF9iqPg7cOHlRnd9p90wC5aRL4NjlAAPBu3N
         ac2NAfASXXhLYjnsqt1eTcOb/8BSEC+rRr0pMx30EbA1jPM3a7CvSUoLqN10ZnGWLPAW
         lNEevpkk9C5BCeX9qqaWZOU7ZqB9a0cp+MOlgpRhoXZKQVKLXk5Po3Z+4QLtxhG/WMN1
         0WgyGD1zW4Jhl7S/DEJkHtXeAibyCOO9C9wLT1fzQLTmREULWdnz1usqj1fIrDHyoyMx
         MEjnVG7eOIQE3uqbn9H/WcrLeS+DaI22NabvXetEeVhkFJzH6tE/JrVrQnbhQ4hFyvyW
         E5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791759; x=1761396559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=dybyRfpjNeqzWSMBHkhAxyqyD6jI7gbVcLwe+wOaueRsBDvr/gWwh5sLFI3prWWBH8
         aFlW/ie1UbaOtddXd5Rkd4CEoACkRJ12Z8u6qxkk930cB7ZV1iJfvyrCAhkTvY7A2tSA
         GF+Y2uDJ93i+imiXDqmUh3LdeAoY+aZwmjcI93HQqNpwxvb0XgzRzdznGKbLQft1XM9O
         VNA72+yOWcoTXJnZL7p6jXLTTmAdoYiH23tIGXnESb1vLMFlkkOTyhHu0/7UuiGfWziu
         +A2V5HWhNbMJwa3DGLv92ai6KIOtIiT5k9/QrB9Dc4mwG/OfKY+6YFlm9WUCzj+pCA7/
         badg==
X-Forwarded-Encrypted: i=1; AJvYcCUZADUdrBjHDOSCXcmeYQtKmpmlEeR7oK0DEY22aYGZLso6iEwkRqvBIK2wetLOsvLwPlA4L/x8WlxiFC0TZ8ccat5KMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyloDeZSlpxFZnUQThXaghNZ2wadwQ6tHBs8c1AQFBPS9DxVmSe
	p/zldMO27zbVtN67h1PKCRoV6+jC9OQ+wm3bbfR536KU5hbM29EGSOPg
X-Gm-Gg: ASbGncsoIb298JQNUDTVuAl0YHeqmhmxSKp7H5trrBmJokS3nmzyPxzcRtC/ozLhdiV
	UMPGMMTXsNOwuvHSdLIw8oWHfRqIKGYekGLSiWR/xBj59jg3Gx2wG/I0bwVc/ucnd6s6FGeWNWt
	xRBSAjOiw9W04rr5tntxWJVwh31PSqZ4HrBzMzO4Qpc+FEd9wHW4daUJ1CCN8FRl+vD/xC/bytP
	W3s/72HiLBH0BHQqqEkfFHkKs/ssXH2IqPvcBf+wKVa6Pc+zOYyz1E4UQdVOj6B4uUdQqEfvKY2
	PM5BIpvLTnkAQhA3CoMKN1g4ZhGhgcTW7QnAjGu5prJHrR3moMIAjMJsWmRVyGKp+80c5EGdTSt
	NeG8gqxEtSHeii3iPF+m7grclUrDokz2cNOxdmesGksc4//EEOXK6toz4BmmdU38hkCQcOx6fGh
	pxGYGZlEOCw9nSGQuLNsk5Hlk=
X-Google-Smtp-Source: AGHT+IGwvhlN1brRCS1BniG2CAvahGot/00JMhfB9nXhMtLgvouUhBqkuQKg7h/T0YyFAsClGr+64A==
X-Received: by 2002:a17:902:f551:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-290dc5dc3d6mr85320885ad.49.1760791758880;
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df5c142sm2564379a91.14.2025.10.18.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:49:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 1/3] Fix broken maxim-ic.com links to analog.com
Message-ID: <4cf1dfdd-6df1-43e8-a396-eb705e46aae7@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017154755.32105-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017154755.32105-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:17:47PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
