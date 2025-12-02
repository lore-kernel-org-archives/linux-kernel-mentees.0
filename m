Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12576321440
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  2 Dec 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764690797; cv=none; b=bnobOquI26ZaLOuXH7otxUVmb+JaNL9CLtKfm3/dBDUCGOehzbx0COoOmj9xH32jie3sNn4BEABLOnT7jIizSRu8ieOgV3agLOb0UVa1wZoavprRLciEk4DDQQRphEGqC3+1KGqyNNpHSp9wnCWCZM6r62JhI1l5dAi9TqCYOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764690797; c=relaxed/simple;
	bh=bLoq+0J4Pdz2yimFi9dyvez+MengAB4dZYv5B3C1McM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuaCGfvdq5hRJ4rV8Rt8lDY+UYvTDZ2zBRN11oDgnqjpS9kAYLyQlycucP0u9if0xaGnTJRBPEZsdnsIrOkXqJWaBaS+nChJYoOmGp7s8yz+SGmATNE2+B6j+Exjiaz53R4dZqUmBRIN5abopHCfKJJX7TEpISHaLZlJ+j31saU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SVyAGk26; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SVyAGk26"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b1e54aefc5so407237585a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 02 Dec 2025 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764690795; x=1765295595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ein3D251E2lqfEtSiRGhRdTfSxeVBVJFtAWknaD20lQ=;
        b=SVyAGk26v3b/d6vSgc9OVrIMCkE/reWOPgQr+fzsiUnKUNUCRr8ObcC2YgQ8f76bSi
         bAdREP6SNvQaEK6dXwlmSSVgV/5UTVJD8FHcILzXmV9r9Ky4FLmbFcoYwWVLV7Ofzj9x
         z2n6eYQZPlutuqd83cjjOd6QqYRigXzokzAGIVHyaea7+4QhKB0SfYdqswQ3aMQ9/NED
         joGcDr/TXckJK3hSyQ64ajHVB2kdXbTejFviEYtiaA0nqrYiOzoC2S4qWjklIxSNes6L
         p7gCKYvYj5drrKXfAJSEMpjecJb+6ZBOUluMIiJJ7kPziGzbXHr5b7a+7ZYn1tEFu4DJ
         VlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764690795; x=1765295595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ein3D251E2lqfEtSiRGhRdTfSxeVBVJFtAWknaD20lQ=;
        b=T0RZsFox3B1nNT+2BzH+dSU5TKt34mJQNfVtRk+vt0f95YG0aX4EOm3kyCFUJdBIhi
         3I/6qiFhr438qhCB0ZcEqG7v3T2JQqMQUwj+tMcMoODyjOehGiwENj70UwN2pDyCnqPC
         H9zavsrgDPFconUFFyOEnX7bmdpt75WAM5gMkS/f0O2MXmcmaAUrZZ8Wkev6005c5IBw
         dqJT7kekVEqr5TtCWFsUXWGpzNBK6nHGbavtQ5y7MZV0kJ/WyfhGj52g+ARaAO30sHHF
         qwqhYwiDVKxQKXqlzTQ+Qc8t8gXabTn0apLEA7e96YqMtFP7ULyqH8f10jT7kLoRG2ma
         ZV2w==
X-Forwarded-Encrypted: i=1; AJvYcCUmX9MF6GclWy0QN6s03/Z1voJwh3Z/P4H/xX0CVCyMy7nEcHLoO9/+fGwnO9FORX/Eayze6UiJ4dA+OMNy6FqWvv1AUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSlqU3ekbVJKyBkdjlxqJKtI7+7A+Ztt+Awr4xSC1UllKlJ6JW
	NpPmXavQ8aGnYYsF98h3+NRuag4LE8Hr9+eCOOMw8NRrk6EzjfeAiELMZn2yx6B3ag==
X-Gm-Gg: ASbGncuaXJ93dmCLV95yT3llCDNbRSL/11ujX4hu6nJ1eFSbxmX2kgdXxJPDoTVMZw8
	qKJ99YpakgSE044ATXYfJf7l3HVcgp+XuSsdNcea/Ixi6Ks6HWvEmLBJWFGLxV5qA3WCbVBVUzw
	0gkMDm5UaDLnDK8aDZUgLl33NpE3VTgVj2IL6JOaoMEwxy2eFL2MNEy4D3tj0ZB+6CUpLZzuCL7
	flOLkQe5z6DKV1sJlTzUo9Uc5nzZ8/htJe9AXPu9f8ZRFuBACYCMyeVnDNOrxJKyKp2EOM5LfTE
	id1ddpVHPzKEJlYvi9ggBnUDAKv51H891jYv5Ck58P+Os3yoqmpd3/f4YYlc9rYuhpVednVKP7Q
	pA8cvKxRReM4EFmVB6lI4h4/eCHmxcDMh0+aS/6iBu/B5PWLa3M4y5BamxKROLqyaysazVfw/jo
	s331/fHmEg6YE6
X-Google-Smtp-Source: AGHT+IG7imMaW6P034ogai9juXD7cZWXeGPG/KXNDrCibNV7M+DiAwK7QmWiAcjFYeItiAklgvwKWw==
X-Received: by 2002:a05:620a:1a8f:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8b33d48169emr5525748285a.81.1764690794744;
        Tue, 02 Dec 2025 07:53:14 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1ddd36sm1088799885a.51.2025.12.02.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:53:14 -0800 (PST)
Date: Tue, 2 Dec 2025 10:53:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
Message-ID: <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120200-backslid-endocrine-e64d@gregkh>

On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
> > As part of my LKMP mentorship i have to complete 5 patches as a criteria
> > for graduation and thus have focused on working on such
> > beginner-friendly patches so that not only do i get the required number
> > of patches but also get familiar with the process of kernel
> > developement.
> 
> The LKMP internship should be done in drivers/staging/ as generally
> coding style cleanups are NOT accepted in other parts of the kernel,
> unless you get approval from the maintainer ahead of time.
> 
> Does the maintainer of this driver want this to be used for the intern
> project?

In fact, Clint's changes are small and inoffensive enough, I wouldn't 
mind having them applied to dummy-hcd.

However, Greg is perfectly right that this kind of stylistic update is 
not something that should be submitted for most parts of the kernel.  It 
just bulks up the Git history with essentially meaningless cruft, making 
it all that much harder to see the changes that really matter.  That's 
part of the reason for the suggestion that interns and beginners should 
confine their efforts to drivers/staging.

Also, remember that trivial changes like this are fine for learning the 
procedure of submitting kernel patches, but the effects they have on the 
kernel itself are minimal.  A patch that actually fixes a bug or adds a 
functional enhancement would be a different story.

Alan Stern
