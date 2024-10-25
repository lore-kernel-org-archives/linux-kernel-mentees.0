Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E7214410
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729883809; cv=none; b=Qxrwecj06P7Jc1A3wbrdbcHldpBkl94Quoa3wNJU1BZ7Ob49ztvEysijHuQIakt6Bggynef88ZGzwhQq7OFVvuQWYD3z4lm2S2jEGaWdff5nD8ATMgzmQrJToDvDNswJPOpaNoBcmLaM4b2weJmH8UjdnchuGrWVb5paIo0OK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729883809; c=relaxed/simple;
	bh=dubQIxc40UXqFzy5w0FvByzSpEMCMZVqqzf2vV3whpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjGlVMlDPEFE1RQe3/JaIeyeny+JM69wAc5LkazHbIZrZ22pKadxTZolll5P47PGR83s2C8IE6AmrjZYZLHUxGVPbj7hapmDtj4ldWsAa2MWC3guTOj2tMSGnqYlJd9dImoxh1j2G1dn571zYz/sD+3rahDEuAiWwBveJHh2szQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni0VRhyL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni0VRhyL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8610560D93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 19:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMQC8dMc5e6X for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Oct 2024 19:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7813F60D71
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7813F60D71
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ni0VRhyL
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7813F60D71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 19:16:46 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-50d479aef64so764447e0c.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 25 Oct 2024 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729883805; x=1730488605; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dubQIxc40UXqFzy5w0FvByzSpEMCMZVqqzf2vV3whpo=;
        b=Ni0VRhyLrmBgy0/7xzP1k5LhQ3/XB8CFNZw+cGieCzxQixhbmXPZKSaqIhwammPvjW
         RhSCMXdOdtdFWhyT9D2xcyRcgn/utEMZRjarEUv1lH8HVN/qdbAlydcwR0/ZJUv/pkX1
         K8erjvVAmixkyp0L605yXAfT6uj2xT38X9pJDtg6+BQRUSmeoe413yk4QC9v3pARTTJV
         GUkn2mU+O43yYYSR+MmurGmNxxcVhi63BhKMmgpWRfCopWZdmv0wwwCGoG4Qp1ec4jiw
         RLJge/j2efbclT2+c6WVVWyIuEUNwzqZVHQ9/3b5mCmFthU0480IQ+vY/lBv0KIHO9Ls
         G5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729883805; x=1730488605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dubQIxc40UXqFzy5w0FvByzSpEMCMZVqqzf2vV3whpo=;
        b=v1G8jx41DjzKU7kc+I5Y04bE3+BOAXKYmSa8Foat6LKvQcA6l0Kox6HGLTdfscTOy8
         vMjXGjfJWUmwYJ3D7i3LjiwCjjiEWN3vwlDxgRripeKXC3LtJ5R4G/t97WhtNPgBCPgE
         tkTaQF+hFXIXknZmeTib/fwxnlgS3a7g2/Qc7d6COgUVZ0OEOwEAdTwqCrWUUFAUT03M
         4FpTmCF8QIJNV1PDcDKftJCmBlUAYZ3dVlpr0E71V7bF6XHGtDcXYnjaAC8F8G+UrAwK
         zJNkEVrM3HvQpTCz5rMcMW6vjKT+fK9i7lgZGXCIMAyxUr8a1A9I3Zs3hki+749bz28s
         88Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXnmm3Si4clj7SOGzb9CLkjj7BS6IlpmnqKOY7d0lvVsJIoMDVP9/hdVTfikGUdgTOsIhlGwvcKlOTPWxXrXqv+4gxTLw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy+IfHQGy/TE0XsMul8qFmjlzZt+rGV3VOXM41N9gQmrKV9v/iD
	zRsGJ9XatS9hrs1lNIP/4g+c6IzxRZHEBsR9bJuA5MjkntazBvXx
X-Google-Smtp-Source: AGHT+IGSI9It2r8yCOmuUigZnEh6/tjoKL4cFTuPj72HzyWQKLiDq7KWpY2RcB3vOGrBZ3npSh4EBg==
X-Received: by 2002:a05:6122:1786:b0:509:e278:c28a with SMTP id 71dfb90a1353d-5101504d301mr278237e0c.7.1729883804985;
        Fri, 25 Oct 2024 12:16:44 -0700 (PDT)
Received: from x13 (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-510043a6416sm226119e0c.14.2024.10.25.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:16:44 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:16:41 -0400
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: brendan.higgins@linux.dev, davidgow@google.com,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] lib/math: Add int_sqrt test suite
Message-ID: <ZxvumQ3Od2lXYknp@x13>
References: <20241024195511.72674-1-luis.hernandez093@gmail.com>
 <Zxu3Nd_xdOIdyYl9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxu3Nd_xdOIdyYl9@smile.fi.intel.com>

Thank you for your feedback and patience Andy. I apologize about the
hastiness of the v2 patch. I've addressed the feedback and would like to
wait for any additional reviews before sending out a v3.

In the meantime I wanted to answer the questions posed to the best of
my ability.

> Shouldn't the thing to be in lib/tests/Kconfig?

The Kconfig entries for lib/math are located in lib/Kconfig.debug as per
David Gow in https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/

> Where is this? I don't see it right now in the Linux Next...

It's a previous kunit test suite, it should be in both next and mainline
Makefile: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/lib/math/tests/Makefile?h=next-20241025
Kunit Test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/lib/math/tests/int_pow_kunit.c?h=next-20241025
Kconfig entry: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/lib/Kconfig.debug?h=next-20241025#n3103

The Kconfig entry was fixed in next by Kuan-Wei Chiu in https://lore.kernel.org/all/20241005222221.2154393-1-visitorckw@gmail.com/
which I had incorrectly placed at the top-level in my original patch,
hence the discrepancy in the location on mainline: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/Kconfig.debug?h=v6.12-rc4#n3092

One more thing to note is that there is a patch that organized the tests
in lib/math as per the documentation:
https://lore.kernel.org/all/20241005222446.10471-1-luis.hernandez093@gmail.com/
Which resulted in a conflict and the fix was carried over:
https://lore.kernel.org/all/20241009162719.0adaea37@canb.auug.org.au/

Again, I appreciate your time and review. I hope this answered some of your questions.
I'll continue to follow this thread so as to make any additional fixes
from further reviews before sending out the next version.

Best regards,

Felipe
