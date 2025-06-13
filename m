Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8472F4323
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792313; cv=none; b=AUX8jQm7KofKcocwvwU8QBzU2C6YrbQOB8LWhmwQncKgZ1kL3yhuQ3Fuj+slzDl5XssmQ0RQlm9iAQkPUK+cADQxpa7LO0bTcCgOhmQ7r4+rpwKHi7URkSD21bysy+YmrhF28PAUY57y+0O+SGqsnN9IX4VTHGHBfJ2e6M+sltc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792313; c=relaxed/simple;
	bh=LqGi/GVuiJuKzx6sAg0njNn+GQDScv8Mw1vCnScSIEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pij2bLtQEPaMB9RgYnFF0A42vawzcORCnaSKDVEtjT16Lu8dTU5kQjD/+wab0mI7YA201JcHsHyPZ0r7aEn3LzvdDHxaVNGw0MuYnRgVnaAXKgS5AjByc25LA5iUkioxCuzHDPUtUBnD1OqyVhmpsFCd6911kb8GZKjRcskACzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuD1fPIf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuD1fPIf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74877ac9d42so1201455b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792312; x=1750397112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGSmVyn8JVOsse5Q+wWmIXSSI7N5bPKSTxyET9kQl64=;
        b=OuD1fPIfM0VfAiJkGNjn+z2tcV9gnkiFUI7LHi4HsgKzbYDFbrzNff1tsvAFE7t/nQ
         HqBMSUet4MMqkL5EnVJea2Sz2jiNvk+1k0UvAWFLcxjl+i2vU+2/Nf1l+TiO80maEC35
         FyjgTuVpKbjhEAE/QSXcTF26prjEEG5fuNWHmbpX5adfKZeKv+OMwo5xGFh0+jXnkwFb
         +wfr/GbiMY8qYk5bld0R8Rx2+yRe7QiZuWo3w+bLcKbLr9eRVdkunihtBPgOnjJOsgDK
         xI4vgg0PDNdWYsYH2Cef2k87WkdTYbbdT84LFtvvpOOrTKHS0PQ8i0zZbG9ZFzgmyQ/C
         tBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792312; x=1750397112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGSmVyn8JVOsse5Q+wWmIXSSI7N5bPKSTxyET9kQl64=;
        b=DqMCj2fq3Pdl3RKqvUoYZtH7CEIsA7ORXJI1Q5/0aV9hGDQseUA0cBvxPIIoWdAt5H
         CCjkO8UsI9fRbohry9DW8laKwQjYmAKKpPr17VV7U70uNGn22wb8ipyanL2rfDbyiGYc
         ZoAjudU2HbOWalECSDC5SraYa4SwkUr/cO4zUM6iTOfAF/F5HLTq2/xLUqgx0XkGrdu5
         bjInqK04jKCJZ9XiM6fuB6XoUNmZenX2gzIfcFfJGe0+/jdUHAsjGx0gU0HAb8wZmSYK
         cyDUTJh9Gaz2lUgFTMHVc+fl3eDGO30D5qJIf6F+M0sWlyJ8EvcEIZvGFeDaF16CaZ67
         breA==
X-Forwarded-Encrypted: i=1; AJvYcCV7O1lgxYnEXq2QsyNR8Oq/YrFuY4xa2ArvBPFjxDzK1GLv9lpQTirwBjANVeyKJsf5FN2DZ3MR0QJTw9Y/Y9GpYPxPqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbSgTmpN12f/TSaCe4Nck7qiWOrNuvmRklkA9xLHvInvckmuP
	VQ2QIEcP3a8bqGxSEYfIcIBBkzh+idV7Ita52Lg3QMgVh1ijl1BuPNNo
X-Gm-Gg: ASbGncvytP6b9n6aMQWohR+/3Ttj34TILBMHdvM4NWtTOoVvMBu0zbn+kvZ8qpegREH
	sMam24CmbqoC63FbJNofL7WaqNgan3smNTu6bNL6oUnrP2FBEAeAu0B4zeqK2oGsvkelMzvyBGw
	MccrwB59fBd6ucQbYgXy6H7A5C4f6Jon5oEP+5z+uACnkQWU7G5KhH1PGA0LzxascdF69Z2gV/I
	tqO40DA6TECGLr0Gl5Y3UbXaD3ruXU0nnDgsuYUPkGAswd0ZhhREPBlIiXx74Sf0kce99owGJCW
	cgRX3sy0Mj08I6KV1/cRIc658WFKLI/ylMm58AEivWNHnckH7usV0nc7xhXm2rzlMLUc8+cILlq
	Brto=
X-Google-Smtp-Source: AGHT+IF/woDHkJ4tnpyarFqr6T68PWGIh6rQiQMAvWFFF+F0teh1Jdkz9fJ+Q3BPpThuQbP9fTiKTw==
X-Received: by 2002:a05:6a00:3cd2:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-7488f6e7e26mr2383065b3a.5.1749792311676;
        Thu, 12 Jun 2025 22:25:11 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d24c6sm699177b3a.168.2025.06.12.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:25:11 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:25:07 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEu2M2jyU3wbviVc@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
 <aEuzgmClrimyc0RY@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuzgmClrimyc0RY@yury>

On Fri, Jun 13, 2025 at 01:13:38AM -0400, Yury Norov wrote:
> > > > > I think Yury submitted the same change here recently:
> > > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > > 
> > > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > > on the subject line.
> > > > > 
> > > > > The bloat-o-meter data is a nice inclusion here!
> > > > > 
> > > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > > (Assuming I Hsin Cheng agrees - See
> > > > > Documentation/process/submitting-patches.rst for how to do this
> > > > > properly).
> > > > 
> > > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > > I Hsin, do you agree?
> > > 
> > > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > > patch work?
> > 
> > I'll send v2 and include your results.
> 
> John, FYI.
> 
> I Hsing submitted another patch that duplicates this series. You're in
> CC, but just in case:
> 
> https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/
> 
> I think it's pretty disgusting. I will not make him co-author, and
> will not give any credit for this work.
> 
> Thanks,
> Yury

I'm really sorry for this, I really didn't notice others have already
send the patches.

I didn't mean to copy others work on purpose, I am very sorry.

Thanks,
I Hsin Cheng.
