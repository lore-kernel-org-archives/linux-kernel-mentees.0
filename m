Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038EB307AC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732803; cv=none; b=MUmPfz8lEP4VyE2dp6OFQS0MHSnVe38sfaDQC+uybPFIfIM0OWamonUAqRS61u1tab2gbF2ZCs4RpWkI2NjS+WvFvLJH4vs2xbrRs84N391ji1yPyc2S+s36wSyRRXJB9nu2q8XNzrKbiFm2qE8F8Ae09LVYXada8tqneLUJCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732803; c=relaxed/simple;
	bh=B3YNCCU3Rk8SaouEBFlE0myl4qXDShsUV7b0iDM/Dzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhA5AHJxx3N4pJeY7dM2k1rQj51KXxSlQlfAiecNRjI8HSGwSMASzBRgKB5QnRMMXWuuqJdTv9dAVcia+Cta/ONVLZzbns0sJy79vNCWSMKZzgMDFkvK7X0Lnqlq/6m5LyL9atAq3rIUVZUEL1FjYJ0hGSCx6ay3Q072G4yEyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEKYS2bn; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEKYS2bn"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B566F60760
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 21:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OcXFLU6bdas for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2026 21:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CDB6606CB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDB6606CB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dEKYS2bn
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0CDB6606CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 21:46:40 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso2636565ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 17 Jun 2026 14:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781732800; x=1782337600; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldvcow43iF9SpjScIRNlK9Yg1AzDJ3co3e/z/l84bQU=;
        b=dEKYS2bnx6uzuTx8R8SWTUgTqGjuAscrw0aJXt3FUUthxb7S2yRdA91W9iZJ7IK6fX
         errliygFtYyyskF8yU65hBd6mCLVamZ13xneUAr4doIhPWVFTWP7hBsEv8O5PJLfG4Uw
         H5flpEi/dVHlfVTyFG+Xpha0w2Yv/weI6vofLVqy5Ij3+aGQDzyKwkcl+DUzhKc3bSc9
         tZuhquiXqqyDhBhwhtQbYVD7TXQ/2jhiV+RtIdmkDOnEpudH6TU+PzvBUA7GUeGryO1d
         gYr5CarTeVOtnJ6dgBCp70Xxrv5MgUlkuq8eK8cv1nm0eN3QOZi6YDi7mqHHR6sdeJu7
         OGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732800; x=1782337600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ldvcow43iF9SpjScIRNlK9Yg1AzDJ3co3e/z/l84bQU=;
        b=F8JG8fH6XOG3XeUkHAvj4njMIng5yrD/Jfqq0xQJ63fmQpgCnsWNfxiGGjIby9vBd8
         I6OC0WrbEW9NYfLz9Hck83chm8150wlTK+NYye/fPXsKPOGt1mjDxgxNMsl7TZ1jk+33
         0cadx29Tp0HHAPTnh6KJl3FM2psI5teM/vTGQYDEV8maq3sQPzFj+515kEVvU1i7jFvT
         T12y9VnngOCSD3fUMT7vhiZTPITBlYGYkaGem1C5jJs18v3o/kBPs4v2RAn2jafeyVa9
         ydZKBMY/0wMrfGqTAZM/ynJOZ4Sygu3+mLlAZmf0+rCJ2jF6etqZ/roTMRbICo7SdM8U
         03EQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7mYccLrDbRR/alB07muojEFmViXA6ceF5P0Fyls57RiuW47eWvQqDyqlk3fouTdhNH6rdhF0b0IadYXNaALCPeyHEqw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwS92Jmjv57VuYTh/7jxJSCkArD8UYoAnDVaINb1SB+lD7E3eQ6
	9zeO75lCsc/qK/68BhD14jFFY/4BzwXDQ5S7IeM6xMlLyAkw1tsXzcRX
X-Gm-Gg: AfdE7cms1AxRZ4I5WNLfpzNo5pi/hAWpCTVVNMwLAXS4igkiUpYsuBBUZzx3QRfJkTW
	//5wuwjMl31VqxgMsp0bCs6jPP0dIT0G8Uf4nNdbi7u21JChkr+QfPG2avU9rARQOYdS6N+RgIv
	l/ByZShZ5UGv3+h0YQkuxXSh4GLzomiU/dnLV0JJMqUb7C0sCNyYIWFdsIvHj8fcQA/EpiQi6KG
	GMvbKOSALLL8Q0cBjVWKrS+vApczL93AaTb36/7z5dQ5bAEBrYdSh7wW4FCij1yJK1pcwIVEJ/Y
	VmlGgx0wTYcnp3JUPOAkLhDsld5NlDcSQLuFfvE28dO12aJB1jKdNpjx+FIafafHMkgsBffmbDw
	c2lgbbFQdjyOLEvWHI60l78pB1fOfPpCljy1W+HSm/PSgt8IieJEpGAovikguRowOTg+7j3QGM8
	rZrcMeLkWulmrVAE3p
X-Received: by 2002:a17:903:2b0f:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c6bbf98e47mr59486285ad.8.1781732800024;
        Wed, 17 Jun 2026 14:46:40 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:857b:d001:f2a2:fc3a:85db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm181860165ad.78.2026.06.17.14.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:46:39 -0700 (PDT)
Date: Thu, 18 Jun 2026 04:46:35 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] modpost: release allocation when early return no suffix
 .o in read_symbols()
Message-ID: <20260617214635.GA4766@soyboi>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
 <178167011232.2064238.5669414796099955471.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178167011232.2064238.5669414796099955471.b4-review@b4>

Hello Nathan,

On Tue, Jun 16, 2026 at 09:21:52PM -0700, Nathan Chancellor wrote:
> On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index abbcd3fc1394..8e231544f9f3 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
> >
> >  	if (!strends(modname, ".o")) {
> >  		error("%s: filename must be suffixed with .o\n", modname);
> > +		parse_elf_finish(&info);
> >  		return;
> >  	}
> >
>
> Thanks for the patch! While this change appears to be correct, would
> moving the strends() if block before the parse_elf() one resolve this as
> well?

Yes, moving the strends() if block before the parse_elf() also resolve
this too. The reason I didn't do that because I am still not sure if
changing the order will have any effect. I already take a look at the
code and it looks like strends() if block and the parse_elf() didn't
depends on each other, but just in case I missed something, I decided
not to change the execution order and just add parse_elf_finish().

> I think I would prefer going that route because neither check really
> depends on the other and we have to think less about unwinding
> with the checks flipped.

Now that you already confirm that neither check depends on each other, I
am more confident to take this approach.

> Furthermore, modpost is a relatively short running host utility, so
> I don't really think it is worth optimizing for resource leaks like
> this.

I want to confirm something first, do you mind if I send v2 patch with
the change of moving strends() if block before parse_elf() in
read_symbols()? I mean, if you feel like this is unnecessary, I will
drop this patch. I don't mind either way.

Thank you for the feedback.

Best regards,
Robertus Diawan Chris
