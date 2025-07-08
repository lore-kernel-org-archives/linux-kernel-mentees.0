Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7422539D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751943699; cv=none; b=pD5EnEaWYvUo/Zkqjm8Je0dCeupI163Yp6HtOPFdokvaOgYgI42iQioQKJ4UIKlRtOZqbW9t3d+E9h0tPkLJTUVQYds3yVi8XrxB6F9E2SemMjSqNMMRW5z8upH8lSpAKZEckFSH2HIxA+zWNJySN7vVo9hiq13xTPfvrK7sL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751943699; c=relaxed/simple;
	bh=+BeXurnvgcec7XX2vVFhp3ZKDvZGd+M3cEDZquo5nVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XllOQFXfwBJojXD5BI+FMFhZLUVIo3lBqYbnFN5LEdpetAAuvnUowZg3LecOmaPQk+50wCiFPAFLqxQyQfCOufn2ck9qPH6JvGCDA/x+80hN4COaTppWw/RBFU2QiScvkPafcoE5GIm5ixuoGaKAov4IkMaNZDsVWkohuLhzxtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0T5p1vs; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0T5p1vs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C176A608CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 03:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9SG88VSh0uP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jul 2025 03:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=richard120310@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0189E6086F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0189E6086F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k0T5p1vs
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0189E6086F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Jul 2025 03:01:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-237311f5a54so36003625ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 07 Jul 2025 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751943695; x=1752548495; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmj1hJawcW+tXN9mS5Ft1iwKlmEiCOVLQGy2pYWMUpE=;
        b=k0T5p1vszLq5bdrLfLFvO5R7l6X3F7UjcxD9NCkAJsUvxVKWqmqfIaHTfvEpSKsM6E
         vh9IaLnisy1OfjP046fgyujtPHEBjK+soul5VV8LV8+fE0H+po7z7Zvu4fRzwVi5vGkI
         QnP85sZubf8ybvEFkfJ+bmFXFc3HuEiEtmtXqoDDWSZ1wnfvFImQ07V+G2otuSXimf+w
         DUpTUuD4vwBFfoDe63stNZCjBZR2ZeEtdTTRe7fgfRU5b14NwiXlhKeqOlwrxfYytIVz
         fRctchuWq8wkdAowAyzX9ZQyTD8RTM8iw6k/GRcfu6lXrZvJmTo5MsFyDBwcmH4f7ATW
         CwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751943695; x=1752548495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmj1hJawcW+tXN9mS5Ft1iwKlmEiCOVLQGy2pYWMUpE=;
        b=TOmaEe5r50WyW8J0n5e9fh0GVbWIgRxMTyqt1r6DC3C/wU+a1kVWWVPBVbV7eTVVS0
         PueXiRVA7Mk8qNOS13nE8IA24TpkC+FE1vqyzqkqjq4zqMdMUUHUnrBOyuBcczWD6aoU
         hbVESdZVJkTbER8prPu5l46/kmOhgLfsE7NLtu4T1uqdQL2YIF8YYB82Vhw1Gs7eAyWq
         SEyUyQZXexhm9Ozztw3+lNWtF/NAoGy/W8czihSfgtuRYr+DJ+FlOie6+QA8osJeSzPo
         uCeLUvjTjslitrA98qBalE5BaBljUBc8RokDXi8R0brl2k0vLDwiO9zqH5uRE3VU/fu5
         m01w==
X-Forwarded-Encrypted: i=1; AJvYcCWdr2EgrtvMje5TbfHy4ixMwMNSpTQbu+Xcr/fLx1l0YQJprQ94m5KwRQYhrdaXSncPRiEI7OmFd9qBuvilthjfeTfo6g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw+9ea8IIXoVT19H3oAWqSIBPfK9HgSv45I3Go1oa3rtMwsl+J7
	GVcRfq2YfziXSUPtWnFvGq7txOqiGh8px8f35iV8nJzW8QOfY8JjC924
X-Gm-Gg: ASbGncsM6hWktf+Hm41/94DlR1+NumnsfVqmZsuySN2WUFS09zFHFd+T9RxRn78SOef
	URMF8IKvaxX7ncVu/Fk9dwFb86iS2FbAus+p0H7hMqn2ZjCdcMWOoRruugE27xk95yeTzeQEK7E
	n88p1tEKCutPq+b8Gg5VcY16AUozHKmaDdKJCrBQM4lHguTZ4fXA9bJbKbNu30sul4LHIByMSAI
	JzU3R2y4f5LcQZQcal6DQOv194GtUpAgr3zLQIeLwvaRvNbSq9SUqwFzIe18ntOC24Qg+SMrbGa
	gU2LUIEjOggby++YEbEbtXaK/rByLP/TYs5pSww3KznQB5M3G/OhpaBmRuMLcL53UwJWX1kUPax
	Ju30lvPFDRbuS
X-Google-Smtp-Source: AGHT+IEubHsFAZcqzV2ApAFpsnVB/BOoENZZ4MFkRwoqv0KxUSBsMLMhMasInUVv/2TDYbP0WZzkIQ==
X-Received: by 2002:a17:903:2404:b0:23c:8f15:3d46 with SMTP id d9443c01a7336-23c8f154130mr105129025ad.37.1751943694997;
        Mon, 07 Jul 2025 20:01:34 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:a04b:8674:f746:99a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434f0d8sm98539385ad.82.2025.07.07.20.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 20:01:34 -0700 (PDT)
Date: Tue, 8 Jul 2025 11:01:31 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] ext4: Refactor breaking condition for xattr_find_entry()
Message-ID: <aGyKC3ig4N74PPcX@vaxr-BM6660-BM6360>
References: <20250708020013.175728-1-richard120310@gmail.com>
 <20250708022453.GB1845251@mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708022453.GB1845251@mit.edu>

On Mon, Jul 07, 2025 at 10:24:53PM -0400, Theodore Ts'o wrote:
> On Tue, Jul 08, 2025 at 10:00:13AM +0800, I Hsin Cheng wrote:
> > diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> > index 8d15acbacc20..1993622e3c74 100644
> > --- a/fs/ext4/xattr.c
> > +++ b/fs/ext4/xattr.c
> > @@ -338,7 +338,7 @@ xattr_find_entry(struct inode *inode, struct ext4_xattr_entry **pentry,
> >  			cmp = name_len - entry->e_name_len;
> >  		if (!cmp)
> >  			cmp = memcmp(name, entry->e_name, name_len);
> > -		if (cmp <= 0 && (sorted || cmp == 0))
> > +		if (!cmp || (cmp < 0 && sorted))
> 
> This is *not* identical.  Suppose memcmp returns a positive value
> (say, 1).  Previously, the conditional would be false.  With your
> change, !cmp would be true, so the overall conditional would be true.
> 
> So this does not appear to be a valid transformation.
> 
> (Note that valid transformations will be done by the compiler
> automatically, without needing to make code changes.)
> 
>    	     	 	      - Ted


Hi Ted,

> This is *not* identical.  Suppose memcmp returns a positive value
> (say, 1).  Previously, the conditional would be false.  With your
> change, !cmp would be true, so the overall conditional would be true.

I would argue that "!cmp" is only true when "cmp" is zero, otherwise
it'll be false no matter the number is positive or negative.

With some transformation according to Demorgan's Law, the following
expressions are equivalent
* "cmp <= 0 && (sorted || cmp == 0)"
* "(cmp <= 0 && sorted) || (cmp <= 0 && cmp == 0)"
* "(cmp <= 0 && sorted) || (cmp == 0)"
* "(cmp == 0) || (cmp <= 0 && sorted)"

Because when "cmp == 0" (which is "!cmp"), the condition is going to
take shortcut, so we can further simplify "(cmp <= 0 && sorted)" to
"(cmp < 0 && sorted)", since "cmp" isn't going to be 0 when entering
this part.

When you put any non-zero value for "cmp", "!cmp" is going to be false
so it will further check whether "(cmp < 0 && sorted)".

This is my derivation flow, let me know if there's anything wrong in it.

> (Note that valid transformations will be done by the compiler
> automatically, without needing to make code changes.)

Makes sense, thanks for the head up, but I think we do have some
benefits from it when compiling with -O2 optimization level?

As the bloat-o-meter indicates the code generation size can actually be
shrinked.

Best regards,
I Hsin Cheng

