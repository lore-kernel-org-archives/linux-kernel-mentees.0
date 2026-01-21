Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4027530E83A
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 13:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002849; cv=none; b=QlpWtnJlGCYTTtfyH9eYsiHPfeGZuAvZVP9mdsmxGrxG0B6pbh8OsIW4zswm2FuC9AyolqdXeKhdZX9k1RmtwV/U9V02K1WntBfJnvc6KfbmlJ+nUxDvParVkulLrxNdHz7RONIUFQ43uX26DAlh8qsQBwLC/BkP1k46/qUSbVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002849; c=relaxed/simple;
	bh=Zj98ZO/ts5b/MYgZaQn1CeOkJWBxcPQsjM8uYXM3aaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecOpJCnmuxh+wDWcURwZcGYIBAP9pQ9Gdk92m1YZys1JIhOepBROLrcT4S8UDIZPdUPT7cb86HypaMvL7BCml6TnDn+oAwGFQnm7tpQSxcmkaxhYdi9N50Hg5C0p1CjN47wzgFVGrXQdEWl4jev8dAxv3IFAmcg6lZTg4rPEh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdkzKOyJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdkzKOyJ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso3419020b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 05:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002847; x=1769607647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPaaLejyMj+/qnEy2gN+yRCN0UmH2KujytP4NRWmWr8=;
        b=QdkzKOyJXQxO8r0QERnfhVF4E9cJHgLuegF6rY0bSIA0mW3ZhIt1vj8VHxFZLAD4yo
         YOSVWnMBQS/cFSqeflbqRTPp1unf2jiXo80wL4gjQtgT2aUmSpgxPD9WPnk3X7JDo64Z
         /zirBZH/xxrdhBsEM4Iu8WfDABrfSr3Wbs33KHIAMWQLRB7/Z1LLSQKcWp2BEO/J9tQZ
         o9tMBTPUPq7AxOtvWKnHAJdx/W5B23Uxspv6q83FIG8enujPaWkyAglFxdFDg8vNhDQx
         914haSu/ZLhKIOXwgc45DBGxiBsqfZBAi0yQKJhWPcqdiUOTDSWWlqWlzmY30PMRJWo3
         HUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002847; x=1769607647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPaaLejyMj+/qnEy2gN+yRCN0UmH2KujytP4NRWmWr8=;
        b=FQSkAERIi0u9n4F9hV4yobD7SCIq5exmRPmWGyL2N36NkzvXR1PX4eCoAGlqqd4d/l
         KQFvOYdp0t9vf4CzjilUbhwwQYq3SndFOIUcDfSe4t5aFdec6mQZL67jqgQLG7VTqYTC
         rHkRKSB2yk+VEu/kKsnOjbq5eu23jvvs5cPDL4RlG9epgI0dPD/Pw2kjdnVoyCqApxeF
         TnSQ4WluyjY2eM7I7tbwsm/k/umlmLFDhhjca9I7c248AtRlz4+bxemAdOeSicWsNrRh
         asW+eUGyzJRbLv2n+wFw2oaFHvsghDYCaIvnACCe5ZFHkRt4tssrEych4i52QVHy2r4I
         UaMA==
X-Forwarded-Encrypted: i=1; AJvYcCXkfWDrbcZDXSvRCCI0SygfyY4pa2/lH7/8it/+Gargkhopi9bqLKy3zlZFgCoGkA108pnlnPDYbtPIDuqS8meIVlMTEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtjlpBgD8eBkSraMTK5fFzqvO7+QTg3UEudnC0yrnitO1Ktv+g
	7KTItqH/OzMwo36D/04z9vZVi8Xoctgl0epFZwllvmNnWObzCZKykHLN
X-Gm-Gg: AZuq6aK6JvwG4vJbECkASjR0VtF0BeTZ+P4NBMKAeVMgixAIOQQpAyszdnax3uOnwUt
	ZIuZYqBKsKoylU6URHup+KXKdcONYzVPJ8wd4GZ0Xbt6iyGnVclyN8sedruuZBYTmxghiVyFRVP
	bnkDx9JgUUWlKEulDfx67GWFpr+ZGh/Ab9fPVNIfOiuJeM6ZIBgcSzNTxEq5Uja+oXrok19D7FC
	d6s+fx25NexJS9KDmw0200GyTXgcwPSmI5Bd2hkq7Wv46GgYFb0wxZtKwm8sfxLOHw9NlhRm16S
	QIGtKzMiIfGtMWRzF0yfiUTd+I2bDm/dPZCRrsPc7mC/H21FmbtnoqeDsmFCMw909kVz1gI4BYl
	DV3DFy++4lUD8A0sMBAaB80Nr4xOnl7rOIqwGlD7OJl8oy1vMyY6ecRDA5E507aZzRFYX/YdlqZ
	t2I57zKn4DtLk=
X-Received: by 2002:a17:90b:4fc2:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-352c4055083mr3706750a91.31.1769002847164;
        Wed, 21 Jan 2026 05:40:47 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c114c2absm5238039a91.13.2026.01.21.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:40:46 -0800 (PST)
Date: Wed, 21 Jan 2026 19:10:37 +0530
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
Message-ID: <20260121134037.kh3rfrgmwsylcl5r@inspiron>
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

Sure. I will make v2 patch for the same.

Thanks,
Prithvi
