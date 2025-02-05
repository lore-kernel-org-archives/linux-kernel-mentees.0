Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573614B088
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Feb 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774019; cv=none; b=WagE1TY3bzomz3e6kB3JPH0fscC8wQ2XZmR8qk3M615pXT3A2FTupQJKgY5qJuSG9mgVD8iG704hzdPrtQUi1G9sZi3UxUddU8DagZGMqfStFbO/jQJSJPtL/FWHPGrN/876flx4Sm/LgW8kVD1Nerqngk744RdrL66V8xqz6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774019; c=relaxed/simple;
	bh=XeISXqd42exqvAVPrwIHSyfym3b34oGhEhsDoQ3MUaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np+o+80UkN4BeclzALzLN2EzpFw5Mn0A0KETfI00LtfMGc2DElqfqDD1l/L7yB7nUmhkvpGUPcUKxxFd3nPpt3p668hVp043BlYNTE37rx7IahMecUO5nbBJJHfC/70wtE+EKXb+X5Gd71K83Ta8dN4H1lJTZv9yPOjLj9aeelI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqWLPe2x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqWLPe2x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2163dc5155fso576155ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Feb 2025 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738774016; x=1739378816; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqXBwBRPHN/O69xxywYWHqng9DShzTJelOs40Bbp68A=;
        b=eqWLPe2x+o0dXW8OdKCLbMbmKEvzmuYqXyjSCeaaVmQ4+9JGlloubXyKQkaUf3E1V+
         dfCQtWRBJfv8xWDOkZ8IkSpbdj1FE1JtWROvP++Uc2E8D6kUJHLhwNUADqiHDTNI8qAK
         pXTyKkPBjI0uSDXOky+otOBY4Fm3TDYmJra7gRx5WesTGFn7GoKN9LS/lPbznKbAwvRd
         x8U4fg7ShULVDA+9ituwTkVU08xTQjQcdNY80qQzktY7bB1Vq9v4czHi3fNWHAO3V/2h
         2fUXIiKOGmcCB8BHIu3imX8VTT0xtOR7iimwTnNIzpSCxr/5gLvwQ29obpdW2kdit2dV
         dDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738774016; x=1739378816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqXBwBRPHN/O69xxywYWHqng9DShzTJelOs40Bbp68A=;
        b=lQz5OD5FRmfLiJufO+RkTCIvmCykNpOzKFrAj7QqOU7zCwAcX/OoldHYKnPo3y+LYl
         Naa4vPhBAazR6BT+gmj9S3qPnzCttLdoW/pIe85F1uZA78ydEYK5vatr9gqvjavpPNEP
         l/DYqJ7+s7KYFxHusS/nmoL2InvsK9XYsyOCWL7Bt/ud7gqrmBX+2rf6AbmcJrLGYRRJ
         QeSmDC3KAfwfiVJak34fBjBk3+gZs5Y/xPLhh4MublmYzwnsDpyMlOcElfz8mFHP9/0g
         KdjAShcJXzk67GYXA9F4ufs2d4UbShnsNAyy1uIpO1P9ueSPPm9WmPNxx0Hnm3bL3gNf
         7fiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbx1jKSfTrjEsp69H5Z0d9qaKK4it5kQJjfJ6ThOyutlPwIXeF7JqoHvB5TwY+NU1nEZYT2Twjo8NtoJ8b+bHtqWmBjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx90LNC8ZoqAa0hhL2eHJtKPpCtcMekLQfGEzI6KYh8hPHBTrPf
	IyeYu6grmLylyW+smn7c5yCUAq9uRe7e505Aji56G1nW9T9OKm4Q
X-Gm-Gg: ASbGncsB9lhBW2Zs2IpVWSg/ZfXvJzEmT9Uj8vSRZY+2ZFhnRN5jR9kOKs9tReQG/NO
	NMGD6P5XJxawFCn+HBPwD73jIaiVNU0pbgwh9bs0dKbykOgyDNt7fdORzXnL6A4yaLP72t68CC/
	p7H4XbAXe3zUrOOqQrEAV+1DgjhJ1ofUwFjSSInpoMBAfGqTsKQRmXeLUfQ7Z4s9y3jwuLjYd1w
	/2+nChk6JgXmVaD0SiuHa487NSvoT6MWShUhAVUcfMww8seWmJhJYj9BF3g8IQ/jBz4zgE/TM6x
	5dFaKhndpc4GsbOPrzu7GrX2KkgaUtVq
X-Google-Smtp-Source: AGHT+IFDah+d/asL9718yaWhEboZJgeAehLy+5t3KCxmUZ3TqnEfF2vNBCDxUP0sBXGrIXwCXLq64Q==
X-Received: by 2002:a17:903:22cf:b0:215:a05d:fb05 with SMTP id d9443c01a7336-21f17ebba7emr53432815ad.32.1738774015711;
        Wed, 05 Feb 2025 08:46:55 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:71d4:ba13:76d5:56a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796d6sm12120436a12.55.2025.02.05.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 08:46:55 -0800 (PST)
Date: Thu, 6 Feb 2025 00:46:51 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Cc: shuah@kernel.org, brauner@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] selftests: pidfd: Fix compiling errors and warning
Message-ID: <Z6OV-1CTAcK3RS4e@vaxr-BM6660-BM6360>
References: <20250205053926.257732-1-richard120310@gmail.com>
 <20250205130756.7b7b4f7e@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205130756.7b7b4f7e@gmx.net>

On Wed, Feb 05, 2025 at 01:07:56PM +0100, Peter Seiderer wrote:
> Hello *,
> 
> On Wed,  5 Feb 2025 13:39:26 +0800, I Hsin Cheng <richard120310@gmail.com> wrote:
> 
> > When compiling selftests files under tools/testing/selftests/pidfd/ ,
> > some compiling errors and warnings will pop out as the following.
> > 
> >   CC       pidfd_fdinfo_test
> > pidfd_fdinfo_test.c: In function ‘child_fdinfo_nspid_test’:
> > pidfd_fdinfo_test.c:231:13: warning: implicit declaration of function \
> > ‘mount’ [-Wimplicit-function-declaration]
> >   231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> >       |             ^~~~~
> > pidfd_fdinfo_test.c:231:36: error: ‘MS_REC’ undeclared \
> > (first use in this function)
> >   231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> >       |                                    ^~~~~~
> > pidfd_fdinfo_test.c:231:36: note: each undeclared identifier is \
> > reported only once for each function it appears in
> > pidfd_fdinfo_test.c:231:45: error: ‘MS_PRIVATE’ undeclared \
> > (first use in this function); did you mean ‘MAP_PRIVATE’?
> >   231 |         r = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> >       |                                             ^~~~~~~~~~
> >       |                                             MAP_PRIVATE
> > pidfd_fdinfo_test.c:237:15: warning: implicit declaration of function \
> > ‘umount2’; did you mean ‘SYS_umount2’? \
> > [-Wimplicit-function-declaration]
> >   237 |         (void)umount2("/proc", MNT_DETACH);
> >       |               ^~~~~~~
> >       |               SYS_umount2
> > pidfd_fdinfo_test.c:237:32: error: ‘MNT_DETACH’ undeclared \
> > (first use in this function)
> >   237 |         (void)umount2("/proc", MNT_DETACH);
> >       |                                ^~~~~~~~~~
> > make: *** [../lib.mk:222: \
> > ~/linux/tools/testing/selftests/pidfd/pidfd_fdinfo_test] Error 1
> > 
> > Solve these errors and warnings by including header file <sys/mount.h>.
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >  tools/testing/selftests/pidfd/pidfd_fdinfo_test.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
> > index f062a986e..f718aac75 100644
> > --- a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
> > +++ b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
> > @@ -13,6 +13,7 @@
> >  #include <syscall.h>
> >  #include <sys/wait.h>
> >  #include <sys/mman.h>
> > +#include <sys/mount.h>
> >  
> >  #include "pidfd.h"
> >  #include "../kselftest.h"
> 
> Predated patch already available, see
> 
> 	https://lore.kernel.org/linux-kselftest/20250115105211.390370-1-ps.report@gmx.net/
>

Hello Peter,

Thanks for the kindly reminder!

Good to know it's already solved, thanks!

Regards,
I Hsin Cheng.

> Regards,
> Peter
> 
