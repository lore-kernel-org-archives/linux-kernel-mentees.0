Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306B21771F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085750; cv=none; b=dYcj1sF6SLnS4gYVOh1k12dO/WadnZI39J2LbQRsYso86RxQ+NlJFUrYqaoChcUqX6CrUF48eO+zZOMIekISon/97ncKKlInCrnr8G/4Mg8R7ToExOp3LzFkw0hGrwk7VV0aRgvZXwphcao03dhqajrYD7F3fdYyg+ciroyD098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085750; c=relaxed/simple;
	bh=NiNtawr9A+v8YCmvyfEAy8wjPDxpKpRJsTNG3j+fQ28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeRvlt22uNJsmBsarQe/Gk7JIQjff3wAn+qpiCcykp0tywFPtw2KHVNXzgut4G+2O3pJKOekeqk/J9UE4WoNxhhrE9bzO2aSC7udgAypgwyRprEv/6dp9FXBUgSdZgRJp+ZbGVsZJDiEWkIMonU7AkiyP0Ir/ld3V6FNBuhWqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyxoOF+K; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyxoOF+K"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so21151265ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743085748; x=1743690548; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDAG6v2LHjM6KDlx2nFQi5f53vc0tn2ixt91kpIk98k=;
        b=WyxoOF+KsWiHVtrGEWPeLmE0B/ciYnu9/WC20wEaZ0G8UBPVuDwhkEumpu62/eK+Ua
         ku6NygNj8iF6sNleDJWktJb7Ji9C4WhjHUlWkibhi/L8EAQDBbSV4uXFSeqmOYaLoZgi
         s0xsSvHTwS6VOl1DgldFUZNzqPCqwBuPyX/JsGvv4q/h89jl9ycm/FEd7upXP18Sdr94
         /vcSfqCtDzKzunym9bJqA3sYs6qxx2HJM9Z6p86DIVUHv6ikjyq9BnFNYrxiQAd3Dss1
         DCD3JudgIyRvQHR+FGtCj9CxSywY2NfZT86VIkbmi5c/VaHvn+FE2WdB3EwZzS5WbLwm
         /2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085748; x=1743690548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDAG6v2LHjM6KDlx2nFQi5f53vc0tn2ixt91kpIk98k=;
        b=jy7uru7GiQ2DyvCN0zQP4tX+5+RtQXPjX0uZQn0rXOBWZFXPg4Z0JIkDhgS3DjRIvZ
         WTCyh+UL0P1/qud/5dXxyFZQi7+3iJauV/d7pU50gN3MWAeFK3Ql+nvqbzAG/K5F90rW
         2I+ahHn68GxFFU033RX4ce2q+gonVnW8cjkNo0w/hzoipF5/Kx+/YLmMwL87vz+3o4x/
         c35xpmsqHfyLCJ56CUFwbQEdtVOk5Auhu2VlSe26ACPTEnlHHHx9jP15ilZu7Sxhv2uX
         6Y+KKX4AobWnkCFqxhhzgmGEZwXT3pItw43SGBYFiqx57SBkg16gPpkJ0A6ChKtWk47f
         SDeg==
X-Forwarded-Encrypted: i=1; AJvYcCXHkUBHpQGl3dqA5TYl0U2+ohKwww2lq1jHclqVEulC276CzBcthDZYWZcnMX9tXn5knG6I9zfkOZk8RFNCUyic5UlO9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu+r1blDYMnK04eWaJDTxQbfXrdGVBjX0d4OVKWZhJN6EDVcI5
	r8a6ec8GZ2jIzbMyDEoDiHAuzqEw0UCqgyNtidc27L9/lu4cvj1b
X-Gm-Gg: ASbGncvRvwayzyrWXkAv1EA1rqBbMm7J1ZkC7M1eikmNO2az8oSzHU+28A/Wu3hxRhd
	VPOaC2dWddhI4hsN/wVr+YLs+YGfaTGBDPgMdJEx9CZQt8zBKNxZskNNnVQN/3suZp2C4D1IGw+
	sBz3i5TzojuimZxHo0zK+nXdgxeE50oGSUBZzbjzODZRqBbK7L58nfYpEuvlDQ2l5+b+8uUjK1H
	KCiZ8BJrpCKEEjWPCER+zCPtdegp7NsQOCgB5cb9hGni6kkgp5PGQj2SnNu6brV6i2p2hLh7Dfa
	83avQk4ZCxhW1nacAjsLvYZFJeGHWJFtWXbaiKAC5o26mnXGjUTWHQlsArb70EGLcCGJdvtB
X-Google-Smtp-Source: AGHT+IGNWcsPx7tNMqqWJOiOb+NqlelcQPXCaG5itHSGXRVxKNM4Et0vtqGeM2qGNRiqHZhvKiWapw==
X-Received: by 2002:a17:903:2f85:b0:220:d601:a704 with SMTP id d9443c01a7336-22804858faamr37358655ad.18.1743085747950;
        Thu, 27 Mar 2025 07:29:07 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:ccef:3c67:33df:4a11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811bc272sm128939295ad.146.2025.03.27.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:29:07 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:29:03 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: corbet@lwn.net, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: vfs: Update struct file_system_type
Message-ID: <Z-Vgrx0XSDASGnpg@vaxr-BM6660-BM6360>
References: <20250323034725.32329-1-richard120310@gmail.com>
 <Z-AZiYwkE9PsST90@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-AZiYwkE9PsST90@casper.infradead.org>

On Sun, Mar 23, 2025 at 02:24:09PM +0000, Matthew Wilcox wrote:
> On Sun, Mar 23, 2025 at 11:47:25AM +0800, I Hsin Cheng wrote:
> > The structure definition now in the kernel adds macros defining the
> > value of "fs_flags", and the value "FS_NO_DCACHE" no longer exists,
> > update it to an existing flag value.
> 
> What value does it add to duplicate these flag definitions in the
> documentation?  I would not do this.
> 
> > @@ -140,7 +148,7 @@ members are defined:
> >  	"msdos" and so on
> >  
> >  ``fs_flags``
> > -	various flags (i.e. FS_REQUIRES_DEV, FS_NO_DCACHE, etc.)
> > +	various flags (i.e. FS_REQUIRES_DEV, FS_BINARY_MOUNTDATA, etc.)
> 
> This should be "eg.", not "i.e."

Hi Matthew,

Thanks for your kindly reply!

> What value does it add to duplicate these flag definitions in the
> documentation?  I would not do this.

I thought the documentation should follow the exact code as in the
kernel, if it only serves as a roughly example, I agree with you then.

> This should be "eg.", not "i.e."

Sure, I'll change it and send v2.

Let me know if anything more is needed to be correct, thanks!

Best regards,
I Hsin Cheng
