Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D33B34DB41
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413552; cv=none; b=bQ4gMJ/2Af+ZvwDSPiWm30gZ0ceyjJ8sibiAnt+tTZ///kdXA4h9pn0uo7FG7Bu15WQKI5DlXszL/rop0MO3H2rvJL4PPS4Dqfu0721QzJgFNHJS75dGYPriiBzWU2s7KXk5aUSxX1Y491DvT8QH7fv/QZQnqtPfPzCJvhHPWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413552; c=relaxed/simple;
	bh=cLYvnwc6UGgUBcOApKiLbl+8MABmd8vFaw9UwBXkSik=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS4dKvBp+/BGPdTfENTTndFZMG9Rb5X6HnVO3nbKWlXTZy3BebEsRtgV28STLBUMpSVvcRyVdR2jyioJsRLOrUS4zjNxXDtpB1spnYMPRWKnT3UsWe1xOh5HI++WuWpO5pVocgqtIy1Si7weecbEkbOxA2fnDx+1GOl/5hLWmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rX3vWYYd; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rX3vWYYd"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so236901966b.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Sep 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790413549; x=1791018349; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeAHyC+9N6Co7JC4GWq1L6y5uc5GROrj5CA6iuWEnjE=;
        b=rX3vWYYd/4XjTImuBiPvrbi5fnjvKl1AnkODWQUwPOrYy9vitrAdGNTj9d43v/2Hkq
         YGp9Mifc4ymQByc/kMppqTF9VzmVjE/GTFKahNOnTLWMamSB/e+1+l76PXYq8hD0RX9L
         B0DPA2MTCQJEzp9cqFK0SMlPuoWDcaVLNBfgD4Wb27L+AzthQymw0HzRxEcw8GjU5rMe
         9R4t5WfPiaRHtUZ1WJdOxCJ+RHdo7eWbr1+fXdwMcVU780dFWz078HDAjlb2mPWKoKsw
         VeW/LcElR+fu5JHWtdjw9lDi+tQaqlTlL1DNyWzX149q/6xgJPtAddTcFAFFo+iaz692
         FAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413549; x=1791018349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeAHyC+9N6Co7JC4GWq1L6y5uc5GROrj5CA6iuWEnjE=;
        b=wC3V1epdqwyEByFUofwKrp3dSAobAsyzWfvmC0uWqHWdoGST87JfhCa8iYf4tvurVj
         KRVUXg89DL9aBvc+B4AfcsIM/5q85j/CZGjCAM9dc7SAASA/MquOAm+blFK9etcJ+7Jq
         U8/2vqcZSvAMbrwgqjLBkT3OdwIENvpfEs4hSLXD16o4Vnj1Z1OjiMRIUXvR18CP9yKd
         e0ZfBKIQGLrRj5DFcd8tKkzBeuma6XJF3N+L63usybL9xmy2QEvJluW6wyr8tukFlmT2
         oO8wWnee39um8zTertHYIRaBaLU4vSlzbGac202DCBEc+gKJun+wLvejgj3qXJPPlcCY
         tzLA==
X-Forwarded-Encrypted: i=1; AKwUvBzM9Q7JsKiowoRtCuhwRjHRJz4QtXtLIfmULCiQguPs/zPUhrI4JH1cDI8Rz/VPD3NrPtLmDI+/XDJLzqFhuGI6aLK71A==@lists.linux.dev
X-Gm-Message-State: AFuF++lt/L367y4MZoqmOI9IhhOLRHKjAsGJNPaSgNOYlBiSEU3zxnT1
	72NWPSdN2um3pC5P68/LJ2dhrbH3QLxabnvPvB9l75x1Iv4zDhp9GPhz
X-Gm-Gg: AYBFou3m2Jd5E+Q3evCcohyVz3iJDlgtjimWFpCfgAwWRwTSMo3CAb+soNrvkLznWmR
	KusVIjdjd2LT1F2vqgSgeZqJk85Nw0aKpGk32AxOexvUh63bm9La/jpmulcnh8vSkYugsAel4jL
	3shKH+pSosXjYw6Ke6ygXhqTppHzd1aUz5yrMxUfwOjxH8h+F7VPe3qE67SZay1KDyZCwi8AMyT
	IiVSAxyoUn0oSYFAS8G8xRk3i1ZaZDyTIJK1z2R9thiPApqoML4QgiWvzDjHArliaiQfwwhYEbh
	o6YkamvTSYh+QJtmBEpm70pRd9pd8iGZDLporUrHZ1516mird8vco3/Xni/Wo22oF0rURfJ1e9j
	cfDcHe7puTOnvBb1FFdpswN7MXMI4wGbFgtM2UT4QmzRaSkY3TPguqe7W1A3G9xmIFpCT4i9hmy
	8F+Pd4nrOd1wqK3VZtEwMmLjCdrIUH7y7IP9Q=
X-Received: by 2002:a17:907:da1:b0:c2d:bc33:7be3 with SMTP id a640c23a62f3a-c2dbc33c16dmr67023066b.47.1790413549220;
        Sat, 26 Sep 2026 02:05:49 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm224612366b.17.2026.09.26.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:05:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sat, 26 Sep 2026 11:05:45 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Palla Raghunath <raghunathpalla.0209@gmail.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+442828bb356b10813a47@syzkaller.appspotmail.com,
	Uladzislau Rezki <urezki@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org
Subject: Re: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in
 pcpu_get_vm_areas()
Message-ID: <areK6Z34m3gP7qe5@milan>
References: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
 <20260925151500.75fcb001ef8cd7f4842e62aa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925151500.75fcb001ef8cd7f4842e62aa@linux-foundation.org>

On Fri, Sep 25, 2026 at 03:15:00PM -0700, Andrew Morton wrote:
> On Fri, 25 Sep 2026 21:54:49 +0100 Palla Raghunath <raghunathpalla.0209@gmail.com> wrote:
> 
> > When pcpu_get_vm_areas() has to split a free vmap_area in the middle
> > (NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
> > per-cpu ne_fit_preload_node if one is there, and otherwise falls back
> > to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
> > pcpu_get_vm_areas() never preloads, and a single call can do more than
> > one such split: on a NUMA system it places one area per node group, so
> > the first split consumes the preloaded object and the next one depends
> > on the GFP_NOWAIT allocation.
> > 
> > That failure is expected and already handled: the recovery path returns
> > the areas clipped so far to the free tree, purges lazily freed areas and
> > retries. But the error is checked with WARN_ON_ONCE(), so a transient
> > allocation failure under memory pressure or fault injection triggers a
> > kernel warning, and a panic with panic_on_warn. syzbot hit this on a
> > two-node VM while creating a per-cpu BPF array map.
> > 
> > Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
> > a bug, and take the recovery path either way. This matches what commit
> > b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
> > for the other va_clip() caller.
> > 
> > Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
> > Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47
> 
> I assume sysbot hit this via fault injection.    The report doesn't make this
> info easily available.  Or maybe it wasn't fault injection.
> 
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
> >  
> >  		ret = va_clip(&free_vmap_area_root,
> >  			&free_vmap_area_list, va, start, size);
> > -		if (WARN_ON_ONCE(unlikely(ret)))
> > -			/* It is a BUG(), but trigger recovery instead. */
> > +		if (unlikely(ret)) {
> > +			/*
> > +			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
> > +			 * Anything else is a BUG(), but trigger recovery instead.
> > +			 */
> > +			WARN_ON_ONCE(ret != -ENOMEM);
> 
> Look good.
> 
> The WARN_ON_ONCE() is potentially redundant.  We could make va_clip()
> remove __GFP_NOWARN from its kmem_cache_alloc() and let the page
> allocator do the warn for us.  Doesn't matter.
> 
The patch looks good to me also:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
