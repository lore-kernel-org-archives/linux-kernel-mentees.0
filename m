Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED731DF986
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971990; cv=none; b=S8aSsXEAupdqwXyGg8JfsoSDv6k30Dsj+o9Ush5BJcwhG0N/3TLSoTLK9iGAPry0luWvb6K5j7KJeAf9qQAiWkdrjLfaYUvFsrXRDrYVlI747gDaGBLBRmzeoG6M0SLIZJH76oQXRBz3LCKdQSOd4NiCyY1G+aHAZvsnAkId5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971990; c=relaxed/simple;
	bh=cjD26/2UAwFHsgSeZprQTMz/5m3GY77SlSgA4q9tIqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUyiX0RV3hcBHzfecWCz20vXZ1vd1efwd2WVmlYEirzYxOfy3OkcHwuV3QjZDj1blEYQ37KBetsuFipxbKwGNwLMN4S98cMUr2HJggZVP+eIWw3fd6ox8CxUCpBGVQfu/cw/j6dqSvtm5GLNg9APPG8fPK9lef+bKu9cgIFhuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Q1+TIC7e; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q1+TIC7e"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so5184725e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Feb 2025 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739971987; x=1740576787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
        b=Q1+TIC7eEHsbL2WzoHlI2NwANlyfYPFS4Ef8FENrWi8+gnL61AY/lTbHiCr1Zkqg4x
         svAXFW8b7ixA9gUSoZmdBrfL5dGXY4RJ/P6mNsDuBMy1a+9kG4yeJJfqwYoPtnVCrg36
         DFCob5upJzdQu/ntr6bbKy169pd68IGQqzALk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971987; x=1740576787;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qeYnr6jPu3lSIUMnd641DJ0EkSXG3SudMAp417EhFus=;
        b=jgC8KSQEMEulSTRl/guxgp7t8DPHcCdMvRW7UQaK9rmYEpMNhcFYGksqKvIIm7c8O3
         ce+l/l+d/VCNrbd5F6IIktpIIwqnCNowdEAehGhsofd/jL1hG93ZJS+bF2ZNNG2qjcM0
         hD5XpbYoFC46Uo1hF4eVk1Ox+UcMk+bzlW1rx+REqWiRJ6GZCc2J6gMScnWoxN1VGitG
         FFN6lKBSqDhTZ86Zky3DIwrIsegZfy2aykSE+5kc8b2hrhkRLlY7+V8xZLN2LCX2HYs4
         6yhxOTMG/oMtXQh5YqTIM0hiW0j6WXdm0Ta7J+wUjj6muf9TuyIpz1Pu1+lTENuTKKYj
         pcgw==
X-Forwarded-Encrypted: i=1; AJvYcCX9qKmfet3zEmk7/e2k9CgIRWZjx6m26538xwUCHOjKBeEbX0OlptuJ8oKtl8ntEUXOCC7LtQm0bQh4jAw5z6W7WlcyrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMR3Cet37CbkBXhlXslEr4Or5idjRyLt97aqn6mZXVrmdNvncL
	+HBFoWS6St8PYCBveXX0B4s9jdoPeHBMA0KMhsvkkvYD+LQbTXQiOGu7I91+3jE=
X-Gm-Gg: ASbGncs7luJ/fCaYbDPtIgwbEwlya9Z/wRC7ee7n0dRnupOh1GFabCX52AfNPNdLxQD
	8RWrae4evx+T51CRhbHwhlfcp1ik8CTcWxrtdyq+Hpx7ny/TxNpvYnxL8b3GoHKKhzZazcQm/m8
	9BSkvZmtDkrWlV3q4kOh3LWdpS2Z2iahc/AHP9GKGaBsGFsvBVXIdnrDzSGGBG4t7sDJis8NHU9
	vvM6IZEpAxaSWVpn0g+f3toFeBOqbest4lQB44sLVx7V0MSgrFmZdyVmHJaT77W2c+FPndXTT/1
	GH9ze/H0ASAtqLJv3OkDzgst+4E=
X-Google-Smtp-Source: AGHT+IEfr4282QBqEmzNfVUxfuk6xB0RBCkHqhW01JOw3jzUDHaoP/nFjPNWk6Jdq6rqr+AuCCpqyA==
X-Received: by 2002:a05:600c:19ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-43999b44505mr33869735e9.10.1739971987073;
        Wed, 19 Feb 2025 05:33:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f208sm211702665e9.6.2025.02.19.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:33:06 -0800 (PST)
Date: Wed, 19 Feb 2025 14:33:04 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Pranav Tyagi <pranav.tyagi03@gmail.com>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
 <Z7WOym9fl8GNPJiO@archie.me>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7WOym9fl8GNPJiO@archie.me>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Feb 19, 2025 at 02:56:58PM +0700, Bagas Sanjaya wrote:
> On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> > Hi,
> > 
> > Just a gentle follow-up on this patch. It has been reviewed but hasn't
> > been applied yet.
> 
> You may need to resend the patch, but with scripts/get_maintainer.pl
> output Cc'ed so that DRM maintainers can be notified on the patch.

I don't have the patch since it wasn't cc'ed to dri-devel. Can you please
resend with r-b tag included?

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
