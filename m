Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8A34D4EC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018908; cv=none; b=LCynfxV5XbbPdmxtfKVYa/W7DnOk+Q0kbkbaCVZEFuvbQnCGteuMXWyclsfrrjKNFJ7JHAb+dBv6cQ6hRESDQC3r5o2M8iaFZyGe0JSlXfblbNItrweyJqoTYYejkrfE6T0wZQw82LXWH41zWJYUIXG4FWu3zQlTgKekh94tXhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018908; c=relaxed/simple;
	bh=vVxmaTN6DfAQMnybaHcGPQ0UAXYghYLqHrfg83IBi0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+Ij3LDSCzir82N94Gb1u28fVUIXDGjbdszwMcUzenwlSOFkgVD7SvdgkmyEHwz8odTlU9fxWWTkd4AHqrlAgl0pDxPLuGhuKHpaOqGs59OtgW6R66eRcD4NqrCjEnHxOfGWZDBxD9qhdETZHJVvXWunXCi1Dxyh6xdAH0KtS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFdQnluz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFdQnluz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a12ebe4b74so1161975ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 10:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769018905; x=1769623705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72auvTTn3y/RhhBaaOjOnqHUYFhZMWqSD++rNQfrdXE=;
        b=bFdQnluzW6Oa2JHaqVW8w3VxQmPHJH3e39CNMuSWSWuBBjpdzsxw0mpVXnAeIkj4/P
         DXO/XYkTIPrUxBP5y2R0nIyqhXk09wlbX3P9GeINXAo9OGyJcGvjD9cAoPoqMuogipa0
         MrNGa4mq5azsduZtH4bl8OPP3HEnAekmJ8wdwRBrWcmG5fnWJG4joGZJ9zHKsZUOpmiL
         jzL+DutTJwKCS33sAWcWTH4lsKN8LLyUse17dMRqO6oYMb+XPrV2ZI5Ki4smuflxn0W9
         TV9JByS7IwogIdz5Vh5o9jjvT1HWb0VkfKg6gOeNRuIr27NstsKE5sNEysUDRsA9e9fY
         00jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769018905; x=1769623705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72auvTTn3y/RhhBaaOjOnqHUYFhZMWqSD++rNQfrdXE=;
        b=Z6ckh9bSsXXLsVbZYKTtlSHgVXkeSAcIpNRu+FmscUJ1mhMNX9B+I9qNQxL0DYGgZz
         /8O8+Inev7qstwT0g2Ycrlc0ma89Y+1imzJrXevxORZHTObcIis8PQErJyZUtpeZOsyM
         mXwCxb0Hsjexr+Ng2/VSpEV7PLU7UpO72jsmXn19dMnLC69uzigukbFGrLgR8hUHGLIK
         fdpjn1G1ja0mfjcsIq1Q7rxVDlDkLI6iZLJiAeWm6vGW2nYnY972J1SM/EkBT+/q7ZAU
         n9zc3/wmoahPMNPnOrLSZ7rSpblBvsxIL6AG3j/x0pIZpkj9Wb7HfywuUAGaZS8SCY3H
         9Jaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSyGIsZTlrDpCujLwDqWFc2IYobkhC4Y7KZE06sk2Nx1RAnBLNVZdCX0DGfrYzRqhAuYsplbBIiIOb/AUShuOXjqaUHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeJ3bOt+BqSGv2wYIrHT/nn1BPq9kuJyTCeze5zxAZFPMlPviT
	m1x/a/Hh1V+qnSUKuukJqZGkRQ7JMAWzMsyR0H6Vcg07jwy5Xed+IJpb
X-Gm-Gg: AZuq6aJK/wQ73BndEdQnk+2Tw23NAoZ/1R7XtUpUQyMFnMmHDRQ1q6x35lwE+zfxzU1
	HRwDLpFe5yERq6Njq1d6ixrcsxTFGD6asJMObUFXn/XxwN151LriArFrlISiH4FeG0eTkGBR7XS
	t4WyoMgF/DM87qVZpCGsw7BjIcA8I7GI6NDPEYcVUf0ZgBHq0zUEyXZhegu1VK3Au22ltCSzAYQ
	3BieSQAxnwiphLdiHMaHugKH2N47h5HvQ5pTRkUCpvY6Xg7r+BssABPkOBx1NcAqvcYWVLVIv93
	UQWnVPO9iMxmJItREJz9iyUtLD72mce/RLvoOVVlJNLk50KcYLei2tiTkoyfRcsSHUK5Lkb1jrd
	46801i7gfNwGmOiIfhR9HTxGiD6+hH24pbIxWHaChWIKDEJOo0mp4L0V84LedDCJCJUyLV1Zvc4
	9B012VwJrlhcM=
X-Received: by 2002:a17:903:22ce:b0:2a3:e7fe:646e with SMTP id d9443c01a7336-2a768a7e6e7mr60039705ad.5.1769018905199;
        Wed, 21 Jan 2026 10:08:25 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a719406505sm157012105ad.84.2026.01.21.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:08:24 -0800 (PST)
Date: Wed, 21 Jan 2026 23:38:15 +0530
From: Prithvi <activprithvi@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	hch@lst.de, jlbec@evilplan.org, linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix recursive locking in
 __configfs_open_file()
Message-ID: <20260121180815.usbtlsqxqdgriqqs@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
 <2f88aa9b-b1c2-4b02-81e8-1c43b982db1b@acm.org>
 <20260119185049.mvcjjntdkmtdk4je@inspiron>
 <ac604919-1620-4fea-9401-869fd15f3533@acm.org>
 <20260121175136.2ku57xskhwwg7syz@inspiron>
 <6927d0f7-5bf5-4035-b1c2-50f3edae4b7f@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6927d0f7-5bf5-4035-b1c2-50f3edae4b7f@acm.org>

On Wed, Jan 21, 2026 at 09:59:49AM -0800, Bart Van Assche wrote:
> On 1/21/26 9:51 AM, Prithvi wrote:
> > I tried using lockdep_register_key() and lockdep_unregister_key() for the
> > frag_sem lock, however it stil gives the possible recursive locking
> > warning. Here is the patch and the bug report from its test:
> > 
> > https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#m3203ceddf3423b7116ba9225d182771608f93a6f
> > 
> > Would using down_read_nested() and subclasses be a better option here?
> > 
> > I also checked out some documentation regarding it and learnt that to use
> > the _nested() form, the hierarchy among the locks should be mapped
> > accurately; however, IIUC, there isn't any hierarchy between the locks in
> > this case, is this right?
> > 
> > Apologies if I am missing something obvious here, and thanks for your
> > time and guidance.
> 
> This is unexpected. Please ask help from someone who is familiar with VFS
> internals. I'm not familiar with these internals.
> 
> Thanks,
> 
> Bart.

Sure, no problem...thank you very much for your time and guidance :)

Best regards,
Prithvi
