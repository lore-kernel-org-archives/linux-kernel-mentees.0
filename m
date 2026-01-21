Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2C343D88
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017909; cv=none; b=Zlnxg2eEz3Agzu16nRlVPJF/kODTMYwpv8fkAZTFGRV2aHqwN43ESq/b8YANpd5Z5JWfWKQQVh3rqtkss5hfZny0HsXe21UiCfwLmw291DE8zhCqIKt8aQ1a0fq5IpDvzXhHtYfqrPbNkCuQxgOnJ7H0bTX3GSTeb6Wsu1e9qN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017909; c=relaxed/simple;
	bh=1qYGgZ9c1b8r3u+ifdHQSBBS7lpLzGEKtldRnalLi6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRUNFVpHzWNninMncNIRfQHPBvNSFRDnrDG1LbRBWGWZV80XLAGwEfchATRTDqyK6B9RdyNlR96KIa55yO+SZ0MP7ycpmlCzAdpuq1O8suqnJ/C2Y8WCV9tjI9b/loapPT4MB/cHPPGGEpXvhuQOMQra210UpNwtj0UboGBzcbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abq0tL3a; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abq0tL3a"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f47610542so110580b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 09:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769017906; x=1769622706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xSB1wkD3tnNMvDpX/kYDMDj0XcHDa2KakGtOpJoZJvw=;
        b=abq0tL3aPKAy8Vi4eTuKPnZcXUIJlsvkih/D/TU31TUYBismjriCn3FjG3ANYZM1rJ
         VEyBSlA933eviniTVCEwDXeVz2+Rd57LttQ9qp73thq4OLrPVvmmvFddSbwsPVlTxxA6
         HXYl2t4GWwMUmHZqJ9Bu9MwVpJThxzvdRCRFGI4oDPTDxu6h5XGrMfvAK7PC1YcdBTn6
         yagofcJt2Ko/ui5f/i1XI+7HkgGjEMiauy+rJZoaEraJP8+8s7JwzfwD30V7FAt9/C6A
         XYMrb5BwQwvfeZFxMFHaCMOKj3ata2MQBthYP6NVJOrGRiwbHYLrqIM2m8BnqRKm+mjp
         kbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769017906; x=1769622706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSB1wkD3tnNMvDpX/kYDMDj0XcHDa2KakGtOpJoZJvw=;
        b=Ac2iCVnqXBxDhrpq/IoOXKVLc2NUQaWO7oqwaD06PuIFiWiemg/AthW6nB55n+6RzC
         VoyYlbRZloc2VIfd1YVSkwSVh3GGMnKU/NShsT09/Am+WF4WTb/2gNy/jdaqtBV1Kq2C
         zCytZRlL9OcGhh0jd+V8mlihTjlxW90uxexSPiB7QR5RI1i2TbAGAfbJtszR1eG/jOp5
         VSHdIOdPhl9kopywrvXEFxHZlyQ69i5bIW/WiEId9Zw6ahg6TuJZdjerRATCizMg+Hw4
         AoE4Kez3AU6rznapjHRD+FsDZVaTGwpY226evNI2Wad9T+7chsY/cZ+yPK2GXmfxwmew
         Rc7g==
X-Forwarded-Encrypted: i=1; AJvYcCXxHfEQjYuk/gq17GQ0rHZzF74q9LGjQ+dGp7AQ4VuD3J6FqFXsKITKWp62hvbRuSYe227qeCZEbFmeU7Ydhfc4/5JW7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsjtj6dfAWnYSSrLnoBYSvP9FJH3dLa3YAibjaV5EwIpVEC6My
	N+EyC/WzunI/6uYcjnU/Y8ITppJXDdxasJCw5mgVadtMqOPZbUb04F5I
X-Gm-Gg: AZuq6aLR8gGmnxj7gV4Iz7lrBCoBpZSSrCzI0k2cVL0T1IcEYSaWg3l7Mx0Ev3fZvlN
	UwO0NxrTM2WlO/Uc+P+VCqmk5QlmkRvs5bAn7m+CRjSpeet7wg25nfIeHODwUTBvnRzyLbnLyM3
	HVH73fwz/NCTasFgcNF5vpxnhlSIgPY3lRLYzKgn/7Lx+slUrv34LwIpniPgDz4H4oArx271ari
	nS1FRhTvByJVZqO0ynrqw1XIgguJJVv5QGsTcOqTiPdLI/onaSOrSIHpZFwYkVCosc4AFbhtH9i
	HK2+Q6N03/q7ysDDv+cH3sz3Pp5EzZjLfqc7NXCXAB+7HGism3xdP3BXAySBjbx2khN+YRLVA1b
	Deo/Q3IBNeUhfr3AvSF+2o7chiT92V2x3QOV4fhlCBbfjoyO4X69i5DXw5pAB67hwNn+ajAgYPY
	mWm6N8kE/bZo0=
X-Received: by 2002:a05:6a00:8d2:b0:81e:408e:47c9 with SMTP id d2e1a72fcca58-81f9f69002amr15459101b3a.11.1769017906237;
        Wed, 21 Jan 2026 09:51:46 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fddd12fcasm7382081b3a.0.2026.01.21.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 09:51:45 -0800 (PST)
Date: Wed, 21 Jan 2026 23:21:36 +0530
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
Message-ID: <20260121175136.2ku57xskhwwg7syz@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
 <2f88aa9b-b1c2-4b02-81e8-1c43b982db1b@acm.org>
 <20260119185049.mvcjjntdkmtdk4je@inspiron>
 <ac604919-1620-4fea-9401-869fd15f3533@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac604919-1620-4fea-9401-869fd15f3533@acm.org>

On Tue, Jan 20, 2026 at 05:48:16AM -0800, Bart Van Assche wrote:
> On 1/19/26 10:50 AM, Prithvi wrote:
> >   Possible unsafe locking scenario:
> > 
> >         CPU0
> >         ----
> >    lock(&p->frag_sem);
> >    lock(&p->frag_sem);
> The least intrusive way to suppress this type of lockdep complaints is
> by using lockdep_register_key() and lockdep_unregister_key().
> 
> Thanks,
> 
> Bart.

Hello Bart,

I tried using lockdep_register_key() and lockdep_unregister_key() for the
frag_sem lock, however it stil gives the possible recursive locking
warning. Here is the patch and the bug report from its test:

https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#m3203ceddf3423b7116ba9225d182771608f93a6f

Would using down_read_nested() and subclasses be a better option here?

I also checked out some documentation regarding it and learnt that to use
the _nested() form, the hierarchy among the locks should be mapped
accurately; however, IIUC, there isn't any hierarchy between the locks in
this case, is this right?

Apologies if I am missing something obvious here, and thanks for your 
time and guidance.

Best Regards,
Prithvi
