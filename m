Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31A2AE7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739761251; cv=none; b=P3Cxsf3gz6/2LNCS9/iJlMj68pAaF5HvLt8GwnMLZ2GnNqDpKA3aGxbHBW5L79Jbs2yF7s+t9MfmAIO3SLM2vvhky0iuQdRLF7NrVGjLjrtm0aSd6wuVJ2NHRoCeLHOQZOWMjYhG6sXoj2615CAltXkI8V0ek+k8hJ0xQJAPc2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739761251; c=relaxed/simple;
	bh=098GAOcKJg2uwNyJFgX23kEQUSWjMe3wSSU467lSHII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp3e2hPHJ05jMIGDniyAOCGs8+nFLNDszDQ1sMW0UpknAvLeBAEd92KI7LkXhF856Can1bt9E0TyUj+RS5/WVmohvH4QJ+SgrdGOXJOd2GjYz7pYzz/+Ctjq2x4N9Oa1XceKEX/jApuw9uIC9shBvcY8WYjKDE9dWVmQ/OvV1OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5zbuOWD; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5zbuOWD"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F72C60D6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 03:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvz5OfF2cr54 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2025 03:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=liuhangbin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98EDB60855
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98EDB60855
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l5zbuOWD
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 98EDB60855
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 03:00:49 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f42992f608so5876480a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 19:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739761249; x=1740366049; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9oXdBZNW/iQqyTSg1FXsRacwBHB2wVEo55z428eLA=;
        b=l5zbuOWDlcM/hDcSz7pg/1D+aXHqfZSTgBShRBNp3+9a6TWjcf/Sqn9eOJR8TbOCIS
         Jaiy7Ghy+rhPM4eMiQi6x13EWXs8dVp+LVcOVt9BkskRfiZhU/xN4vWrvkpUIP+kSWSP
         DxRB7oBEbfEgO6W9njSQFOnuyf6446chtrevj82lE/Xcqz6R1MrXTNdkiGYJr+x44I0m
         F3Rx8CrDjZg6RiZ3hv6yMjMHGH1yRyKfHMjiyF9ZQWRstmJPYr0iEst7riEO8JQ0cSkd
         ZrzJTH4rI7/P3imWYsfXiYGQN/APCgDES4Zwxj2HwViW66ZelsqTNrTgNGS6FK6bOl6E
         U23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739761249; x=1740366049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM9oXdBZNW/iQqyTSg1FXsRacwBHB2wVEo55z428eLA=;
        b=n0HUy8GKDQ0+Ed8i34PQuFuPxros18j0yUWBytTEnt87o6H7cvBFekubd6eoO4RNnT
         722MJG889BjLkeu7BxKM9+qcSD3o0YEZhHu0+PUz1/j3OIK1DotixWwh+achTMMjg8nd
         BiOpAigBSlaBM5aFLa8mbPfwP7kQGsgzh48qx9UYr8G/adudf0YEfdOvfAv9wH9/h4SZ
         JNFCLa8Wsb4tYGxUtt7zgAmoaH8fzTUZIvU50yi8MRlqho6wS/BW45w6IV2J2H4k3r1b
         p97qA1zO8dvRoc9btind7lCSNAz2T9v2BhD65OA7kF8/Bo76k2MFOi0iTsSJb+lRCgUs
         EoSw==
X-Forwarded-Encrypted: i=1; AJvYcCUiDTsbqxjXefOGspxIm/7RNyXgMSHy3BmlKqhKkNbj5y7QUuD+2KFxROqoYJFsuJbKQogOrF5JtUQkAIGG/TvfPZ7OLA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyJj68zlmiM8R3YpJb8tegGMh9V4eccvR6AFYoRiCJvQqZf8mRX
	Pfa/nGv/XHBEB9WHMUMRQTIj61RIsCLCPlOoa5D39iIF1Ez59Nxa
X-Gm-Gg: ASbGncvvuLGYdymims/63deMALJc/UjE/8ajUWtV7eLB+b4t7aehBfrwzfvqZFY/BE9
	gkBm9RDEKZJ2Ft5BoH5qJyExV1hsD87Oxa/KH9tmCIGMNoRaJaMGl3Zw6UFxJ3LqrZsI3Imsg91
	Nq0+z6j/xWRqrO9GVpXSEOMNqnnroD5gI3hQXF5ibtbBOjsPufZW5QJm0d2tLEe/3c03JkEpuAO
	V86n3UIuOSZ17F+FqZYZTcJEjp1DCpnhK5xhcXvERS6YKx2NgbwppytNod0oj8wHgTpdno+TVRq
	wMIC6AWNU45PPfSxjX93
X-Google-Smtp-Source: AGHT+IFlbZXzjTjaiCfw7RWv2kRvgfxitjDjmHfqC8UYJCSB2hhBiRs+ip/IcfoDod4m+VWndDNKwQ==
X-Received: by 2002:a05:6a00:244e:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-7326179d668mr14480366b3a.7.1739761248651;
        Sun, 16 Feb 2025 19:00:48 -0800 (PST)
Received: from fedora ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265678abasm3272624b3a.27.2025.02.16.19.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 19:00:47 -0800 (PST)
Date: Mon, 17 Feb 2025 03:00:40 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Aditya Dutt <duttaditya18@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
Message-ID: <Z7KmWNNIsXCnhiax@fedora>
References: <20250216120225.324468-1-duttaditya18@gmail.com>
 <Z7IOR2UNzjy7cQA7@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7IOR2UNzjy7cQA7@slm.duckdns.org>

On Sun, Feb 16, 2025 at 06:11:51AM -1000, Tejun Heo wrote:
> On Sun, Feb 16, 2025 at 05:32:25PM +0530, Aditya Dutt wrote:
> > Changes include:
> > - Replaced [[ ... ]] with [ ... ]
> > - Replaced == with =
> > - Replaced printf -v with cur=$(printf ...).
> > - Replaced echo -e with printf "%b\n" ...
> > 
> > The above mentioned are Bash/GNU extensions and are not part of POSIX.
> > Using shells like dash or non-GNU coreutils may produce errors.
> > They have been replaced with POSIX-compatible alternatives.
> 
> Maybe just update them to use /bin/bash instead? There haven't been a lot of
> reports of actual breakges and a lot of existing tests are using /bin/bash
> already.

+1

Hangbin
