Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47478286416
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Jan 2026 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768671756; cv=none; b=UkuftaxsxNPCI1kOPK3KBGOqFaG0YTdVY5kZVPl4EtuLrhtTOnIOiPlytl/WYV2BERbeK+em9XemBMsfHcop5u1xWvJ+EpUAqv12oFzkpj5CGdhqqk4cR6woSGrYuCIvfAks/zLpT3Unkrq+q5f8AzAuqa0sB3Z4GK2Y6XiT1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768671756; c=relaxed/simple;
	bh=AYBzPkhdjgGJDi0kHW57cXrX2NxQBmdXVWZn8NiITpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8UvHDDMZUxyKL/mrysm2HMgmU0OCatyguoJz+nT4G1Qor4iU9sr+xGOPFtLDAEFQqirMpJS6bVUlrsek2VSKy3UnAJwdgCy91DIVgwOwF3we35E6AlmdZYTCjtr2O6sr7KWCcS9dh5X5YiCApny3RAU+RerOOVF52znmH3vDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0eyUO5b; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0eyUO5b"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0ac29fca1so19321855ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Jan 2026 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768671754; x=1769276554; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fa2C3CjBP0zf49hlsRlTlbBzJ9ToDABb44obJ64qh7o=;
        b=R0eyUO5bhb9H3Aps8Bor0nJzBBJbmKEIN8yfUx78f/17vc042tx0cLIB4cAfoOAf2k
         uF2anUHnZOay3uKOSlX4KmgJdODCgwCs6cK0oV1GEHPNlJUfnWRZqNC9cXLvyWHptU7p
         1mWd8IOiovhMPHAKwggRejYGpk5uUmVE3oIRvvbH3NQBqW3KF7bEwvU/59Glcew7C570
         VwlwZktv04PBzIJYjUulOMyH1Ct2yRxi6hiXX17y6neSAdE44m7w6DmQP8wl1aBkJiRU
         u9yIiw3PasY3XF5e4ANOdUjyxD3fnKtGZtr6c3+uPKEFfSBTBnMKcLTz9qASZdLH57Y8
         TxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768671754; x=1769276554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa2C3CjBP0zf49hlsRlTlbBzJ9ToDABb44obJ64qh7o=;
        b=QLgPFs/Z+G/d6aRfw5w8tR4S5Dx2aLHQmSe7JGs2cri94gR9r0VlXgQ4PsFTIEiOzC
         9B+ZGhPXSoNF3qjyGERf9vZpqKCNpXUpl5QkdDXQXXtsYI8dxK8iqRYDOV0kwSgi/v9z
         /6jwBi4ZKtabe0CSz6u2fNx5rw1cGh+P+q5e5yhyGrbOe4gXd8cRpEjjN5ubYXYtZakf
         EKVriBlqRIdrTpHWZRhxcneOQWvUSkU+BgvkmByGQHw29Mvc1oIgcL25TwyJf3B/pg/e
         o7B+KqxclPcXJK+WDwcZAIU/m46f7jLiLYqxBbRUhnQhMfFPJG4hhO0FHBn6RY/a04B7
         OUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9UQ7CryRK+xvwVtuUF256K6F7taw9xgCnk3IRv2GIr0u/sjw4SyQTkUW22iOJuUnApjnmtFXfTqGe6L9sgRErT0kuoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD8K0guTBVGYZM71LEW4W2TVAwNAPkA17uThjWEEtAprDJpZ9/
	Aps571IVhZUS++0d/JBoct8fHd/FyL1fs2GcRHMJ3qmF21i98qyEvmXt
X-Gm-Gg: AY/fxX7vSd2F/Yizf/zU/pVwl0smzz4HktqSCN0XWx35DSQA41wK/ab1cdBF7kauIGp
	sEHrZkHCBVzKaTKKm8N1gko7q6T9Xl8TVkiBUQrvWkP09ThPpp/oafD8ThgmseONyrcpSFEdvix
	46p00uMgjUT9c5TgcF+UwLoAn4Csa/5aEfVWqqckwPCvbqstDHE3YYSe92Q0UHfFsN2x43yYwFd
	xZ+kBYz9VdPuw4wj8PLJHL8pdgVckjCyWPrPC8Hb2BnmKIlAVT+q+TzdSkuJp/SRRbGlhgU1RWu
	A86Py1SyswvyswdzYScR64WaAixO1PpcrEOSWVdMRI6lRmXEjnBjpejUzXJKyXxrqGJ2r8vgiQU
	DuIxASvlvV1iEJwj7bIm0DA3R24GPBmDmKZ14VTBioas6RzcbqeqBsVBgcZJdAkVP3B8Vnn8s4k
	c4fZfDzqfxwO0=
X-Received: by 2002:a17:903:3508:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a7177ce73cmr67547695ad.55.1768671754499;
        Sat, 17 Jan 2026 09:42:34 -0800 (PST)
Received: from inspiron ([111.125.235.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd523sm51942115ad.62.2026.01.17.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 09:42:34 -0800 (PST)
Date: Sat, 17 Jan 2026 23:12:26 +0530
From: Prithvi <activprithvi@gmail.com>
To: Matthew Wilcox <willy@infradead.org>, joseph.qi@linux.alibaba.com
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] ocfs2: Fix circular locking dependency in
 ocfs2_del_inode_from_orphan()
Message-ID: <20260117174226.qpmlqbbsnc6pjgxo@inspiron>
References: <20260106125100.327980-1-activprithvi@gmail.com>
 <94b4189d-dfb6-4443-a336-abbae89d36ad@linux.alibaba.com>
 <20260108183652.ro4xueuj6itfaph3@inspiron>
 <20260115031809.w7ksrj2ostwyxa54@inspiron>
 <aWhxfLwUvHDswsIY@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWhxfLwUvHDswsIY@casper.infradead.org>

On Thu, Jan 15, 2026 at 04:47:56AM +0000, Matthew Wilcox wrote:
> On Thu, Jan 15, 2026 at 08:48:09AM +0530, Prithvi wrote:
> > On Fri, Jan 09, 2026 at 12:07:00AM +0530, Prithvi wrote:
> > > IIUC that would be the case when ocfs2_dio_end_io_write() operates on normal
> > > files. However, according to the report of the bug, ocfs2_dio_end_io_write()
> > > is holding &ocfs2_quota_ip_alloc_sem_key so I think due to random fuzzing by 
> > > syzkaller, the function is curently operating on a quota file.
> 
> So the right fix is probably to disallow DIO to a quota file, wouldn't
> you say?

Hello Matthew,

Thanks for the feedback! I agree that disallowing DIO on quota files can
probably be the fix for this bug. I will work in this direction. I think
Joseph was indicating earlier that DIO doesn't act on quota files, but I 
misinterpreted his feedback...apologies for that.

Thanks,
Prithvi
