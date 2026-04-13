Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE861399365
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066603; cv=none; b=Ac0cLVgrY49tkvKqtdJcq15UPbGzzKtWUZmnWLm6TYdGptuREbWLpIxS8tJ/rZKOZnCfTGGXd0uwKLlf4Nq8Q9sk1DpzsaQcKr13QToN+1aY2pEtt4M4rrDKMJIBVSFeXntP+WuCGJBBeA5jEiNyDTjiHTM+55y58XODC3o7nEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066603; c=relaxed/simple;
	bh=p1JIwpiE8WyS1G2umPT/FSZ8Zr/GEnNXT20hxvR/ly4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pS0MkjokCNWFbUAqEb/QrenWdntmA9c776fFYojqRnnl0pcD0tlKytNS4XydY3X54NiHWLTjCxSYTqYg5i4xDbH/f8UuPzdv1eB2okp4qD0zNqidAPwOdvQzdlFNjj/fPKh2/yY/OuqjapHT18rTWYzGgW/IchUN651g1IHcuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJyn3OnE; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJyn3OnE"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B49A940071
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cc69rECXAqFB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Apr 2026 07:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0A454002D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0A454002D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJyn3OnE
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D0A454002D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 07:50:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d74086e5bso726137f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Apr 2026 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066599; x=1776671399; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HC7LQ8RAmg7bI/yzALEW4YdRB8hh0C/jyOgOuDqTf+o=;
        b=CJyn3OnE3RqCtFpF5peExj888GksFLBgvVAFQh+G/ovolZu5SgsgMtoR2OyWwKNJoh
         mCVZXipUSrLmzDfOc11C0CBvoOP2heA33X1iZLMdEWBk0ZKpCtu9jBmfF+EMZqM7Qywb
         8P9HJzO0zWd1QIi4MZ8zWyH8XNPErWuzKGT/5oEbPoAbj8Bvf5pUW8BSzweNLpFxxCRE
         TgNDq4qCBvfAokPaorlVE/bgQ1ev6OIv7N/sZIBaZONZtWaDzposrGFdxlbIaZKXgahU
         yhzwK212H6howR63q7ZKXklMA49Ov9u/tfFgJbyAHWiyiUxFYQXk/ceGsOkjVuAReh5Z
         bWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066599; x=1776671399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HC7LQ8RAmg7bI/yzALEW4YdRB8hh0C/jyOgOuDqTf+o=;
        b=LYMfuxdrvuuEc1KTRvK20Fv2FR6fBZsApIUMVZpAkV/PSMm5EqgNcDlrUPCgjzEmVu
         CzSjbpkw3EZnsa2VBgLNAEaHc0fuiNZDGncW99YOvmP5YvizykzxoU/tn4TJcw3W/+1e
         tAMKIIpnpa4x3Y3Qpv+Iqv1SAXPUsBx8mU66UWtj4iOy2hCdmCYDaiM/aNYGOdNdCgq3
         lfiJgyenahtEhWTflQ0iu5Mxfdqdc1lT/tfoVDIsw3wj9DVQv+uXjRM4qQQtz7MARHB7
         1u2c3qnsHPeofTUyfC7XfTXsOlFd+4leJI5KHByGUuxImWQluDjBmUnl5xmsiPx9VPju
         on6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1qsDJbbiYUzJ0isZYHF//P8FlNGnrEaYFX27o7BTHMLDWY6owDSZlKo0eK0hzWpygEc1Nn/Bhi9qXL1wdOhYAeacP2Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzf6AmZHnqzIsntFcAt+x8J8eMFEm2kvQT+IvNxLu+1ZPcHqeF6
	rSk8FfOVh639mEjWEsFRS3hfspCdsHwpn/4XYRNUOHs+hIXbBTF0FFGP
X-Gm-Gg: AeBDiesmSIHq14UHfs1qIUrIxy3WkGg1jmNNH7z2bZURTZHF1TBtwWzdbjhZhB8YNxv
	xB4THoIdYJcTZR/tJXO4kklmoHkKcCnGWt/L7+WtPM4TIsbt2RAIRNCItN5DR2AkTW5ExsUGe0X
	EOsdwPS6F0pv9vtS2Eoi6nUeGnMAsnRIdg/SJHlGkWrZcUwyUVBK9Sk69Zg05YX6EIsJlFmvd7m
	3FVKyp7ctv3spqxLPwD/QQzMCi/wLhVRwXeF5l0s/wncKr3/gD09KUnY1vvKfFuqtce5PnjBHkj
	vN//3fHOqWXnEXiMMEDObKEJ+bGZM+zhWXywMInJhY7a8e0W9SnPKB5V4RpTTLipPpre2HaHGvt
	zPFkR6/CLnGhZtS5YIUPHQolZYl+1emsckPwaSRF2YhN9cKN+9uLJL+BgB9EIjuyuVjTp3Cw+TB
	xSP2A1ombjsuB0ps+jC3c=
X-Received: by 2002:a05:6000:2212:b0:43d:795d:5dda with SMTP id ffacd0b85a97d-43d795d5eb4mr2951035f8f.2.1776066598511;
        Mon, 13 Apr 2026 00:49:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5062fsm29721599f8f.31.2026.04.13.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:49:57 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:49:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use %pe format specifier for error
 pointers
Message-ID: <adygIkRhnsGv-LwM@stanley.mountain>
References: <20260412144552.18493-1-mahad.ibrahim.dev@gmail.com>
 <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdu6pih=NqkYT0CR_oLyr3YgNKBeqYM3+naqVp52UCgVw@mail.gmail.com>

On Mon, Apr 13, 2026 at 10:03:58AM +0300, Andy Shevchenko wrote:
> On Sun, Apr 12, 2026 at 5:46 PM Mahad Ibrahim
> <mahad.ibrahim.dev@gmail.com> wrote:
> >
> > The %pe format specifier resolves error pointers to their symbolic
> > representation. Previously %ld with PTR_ERR() was being used, %pe is a
> > better alternative.
> >
> > Fixes the following coccinelle warnings reported by coccicheck:
> > WARNING: Consider using %pe to print PTR_ERR()
> >
> > Testing: I do not own the hardware, therefore I could not perform
> > hardware testing. Compile tested only.
> 
> I don't think it makes any difference for this driver. But I am not
> objecting to the change. Up to Greg if he wants to apply or not.

I always like these changes.  I wish that there were an equivalent
%e which printed error codes that weren't stored in an error pointer.

KTODO: introduce a %e type format thing which prints error codes

regards,
dan carpenter
