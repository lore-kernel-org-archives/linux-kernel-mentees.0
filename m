Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142291F37BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 22:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733956409; cv=none; b=TQ2VvCYT4qbWfkhUucRMwH3RcT2rdBya2x0udEfXWx1IKS6BayL55PeO4Prk3lsGjTVFzfEC/kVNsE4xFgo2Po+iyH8eGTOMkvc8YmLfZjEHwDaJ5TXOeqVojk1SGHP4BgfOV1eJIeHWGhdhssv1qYdDp8xs13HDdUcpjSOf44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733956409; c=relaxed/simple;
	bh=hJzLzUCdutP40QODZOuWNWc476NWXbIFA8vEAw6MtLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl5CcwljOQYzTtiLZuFtllNkHcr8rTwcP8UJ7S/x05DPXvjMq7/2nsLRSarmLO3/z0lSonF8CaFf4E0umg+c9UlSxzRChODBovw+mYRRK2yMjkx3wWMqdc5z0n+gRcN8STPk+BZfYpZlZOeI8bAHsjK/QV2vSU9RgPrjt12G0B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnxpEx7x; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnxpEx7x"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B628482095
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 22:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnW_9RDx09Fx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2024 22:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCBFC8208F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCBFC8208F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gnxpEx7x
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DCBFC8208F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 22:33:26 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6ef9b8b4f13so70506177b3.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 14:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733956405; x=1734561205; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OesgqZoKOnUmsMZ0y45VbDn9q4aedLqh2tLJxCl9AN8=;
        b=gnxpEx7xetuOBpEm+Efo9xa3syaAdyWbOct3O5nt8HjTTf+0N98Be9R3QN5NkcLObP
         qT+MHoW+tyo9owZTVWoaftxO38Y3PgxohYCx7zUfF82DndZIDNH0p1PMazxcxuv3JciA
         kXO54SirpgPXwnzetVDUj3Su9Ji7hvq7f1nsbLhUftIU0Q7hrcOfS4LhT9K2RFhMFuHg
         heMFhUgzvHY38w4LTVJJuK5zC1gp4kg/FQVPpt99PkYqIXJOIzVN1XanenyYcEDidA/w
         Jl3IzXyLsaZMPC/7pVgS36Eb42ug2hLvFiVE4rM2xXi0pAMQT1FW4w0wgVHAwVwt1FvP
         0PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733956405; x=1734561205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OesgqZoKOnUmsMZ0y45VbDn9q4aedLqh2tLJxCl9AN8=;
        b=T8qOPk7eum9Ynd04GO7TAX28WKamcxQsU6ClRC+zjhKXG1pp4cIrjMG0asQ2Y+fp5T
         /jS/C6ikkp6K9hVowvMoh383W7zYVV8pHvxxYOaN0iD9xV6FW/govZIPYTiEZ1s94FzE
         hnSdW1h0GFzcRDugyrma7B/b2eUbAMZFFP/6DY6MBrZWXLEIC3E2iVG/Bbfj8lXGRvdi
         pL4VwKEeS58HhR/zrjaVjOKpIt6qvr8QDzREaSiWuS7jkpShqOBwmHeItPyI0jUqRLDg
         DotVJ6x4PHtWe1Sr02ivqhw2nYwUgIxilgdQivFdm9w4gCXUuzCGkcYKwUxHvaoaYX4v
         nqUA==
X-Forwarded-Encrypted: i=1; AJvYcCXoEetLjM/kAPrJKaZjXJxguBU0yYhQNXqFz1RmoO7XTbZi8/0EMSuCQGCu3dhoI0mXC3yAX9bQt5ICal+U+aK8gaWUKA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzBqv9e+D0aZo0Fy0JgA5tC8J5gyaV0utcGZMdKgycUHtshQAO/
	6AQNT1izXEZ/PMaeEirCFAiAso3y/CvhbtzSlY9V10WMV3cn0gBK
X-Gm-Gg: ASbGncvCAe2JQA/Rd29RdSGFkDWaratraeIn87H+hFzZ8vvloP8C2O55Kc8SPyFFmjU
	8igW/FD2p9K7VMOEpTCoIzthImH02z/HFtTw3rxdL5R7/W7GhjmZWqFYbZ3BHEXUkJ6smNIMOCT
	3NPxMFb482m7U82y9hbKWsDT8lfA8n2vHLfFaiQmk4REn77wCb8gaW7GyUfLSnBLS4hX1wZoxA9
	r5/Ju7jMGYhRGuGCOdNUC2910Rh+5bGXFoyAe9cRjIMHMr1L6k9
X-Google-Smtp-Source: AGHT+IHIBeSIkgzah4X8/DMcrST/Vu4XTiKeBjmK1CaaT4Xbdhtb+WmG+sDiueAMysqzRffOiRZvJA==
X-Received: by 2002:a05:6902:70b:b0:e38:a637:7824 with SMTP id 3f1490d57ef6-e3d90230563mr1113451276.16.1733956405498;
        Wed, 11 Dec 2024 14:33:25 -0800 (PST)
Received: from x13 ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3c94b7b09asm508191276.60.2024.12.11.14.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 14:33:24 -0800 (PST)
Date: Wed, 11 Dec 2024 17:33:23 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, rbm@suse.com,
	skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] lib/math: Add int_sqrt test suite
Message-ID: <Z1oTM-ZW7u0_TML7@x13>
References: <20241211203425.26136-1-luis.hernandez093@gmail.com>
 <ad95d09e-ddbe-4d43-bf22-00c2008823d8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad95d09e-ddbe-4d43-bf22-00c2008823d8@rowland.harvard.edu>

On Wed, Dec 11, 2024 at 03:42:33PM -0500, Alan Stern wrote:
Hi Alan,

Thank you for the review and feedback. I apologize about my previous
patch, particularly CC'ing the linux-usb list unnecessarily and the
spelling errors.

I'll address your suggestions in a subsequent revision of this patch.

> I don't know why you CC'ed linux-usb for this patch.  But as long as you 
> did...
This was mas my mistake, I must've pulled it from my bash history of a
previous patch I created with git format-patch. I will be more thorough
and ensure I use b4 in new patches to help generate the recipients list.

>> +     { 3, 1, "non-perfect square: sqaure root of 3" },
> s/sqau/squa/
>> +     { 5, 2, "non-perfect square: square  root of 5" },
> s/square  root/square root/
I failed to run checkpatch with --strict --codespell, it could've
easily caught this. I'll update my post-commit hook to prevent missing
this step in the future.
I'll update these accoridngly:
{ 3, 1, "non-perfect square: square root of 3" },
...
{ 5, 2, "non-perfect square: square root of 5" },

> For the higher numbers (16, 81, etc.), you should test N-1 (and maybe 
> also N+1) as well as N.

Good point, I'm assuming this will help ensure the test suite validates
int_sqrt() behavior around the boundaries of a perfect square.

I'll add the following test cases as per your suggestion:
{ 15, 3, "non-perfect square: square root of 15 (N-1 from 16)" },
{ 16, 4, "perfect square: square root of 16" },
{ 17, 4, "non-perfect square: square root of 17 (N+1 from 16)" },
{ 80, 8, "non-perfect square: square root of 80 (N-1 from 81)" },
{ 81, 9, "perfect square: square root of 81" },
{ 82, 9, "non-perfect square: square root of 82 (N+1 from 81)" },
{ 255, 15, "non-perfect square: square root of 255 (N-1 from 256)" },
{ 256, 16, "perfect square: square root of 256" },
{ 257, 16, "non-perfect square: square root of 257 (N+1 from 256)" },

Thank you for your time Alan, and again I apologize to you and the
linux-usb mailing list.

Best,

Felipe
