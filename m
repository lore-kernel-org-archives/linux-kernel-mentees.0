Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3472D1308
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755091319; cv=none; b=Q2hnc9jV8WC8xL7ldiHJK9odTYDVfAhix4YnlcJa4XTEGi8FCbwQy5bpuj6jlW6CwtSKJh0ldvxgzLYp46KFyFwLmcLNKEQU3JQYxSBAwrGFf2bbJ1iICAt/1o284OGMDazSxqOyYNoupwhz2ydccjtH3vQmdkMvur4CYgeFX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755091319; c=relaxed/simple;
	bh=SJE6fsMy/q/x1sFepPBQD+jE3uBfNRoLWaulGq/HAxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxUOzHiHp9p0KASPoIDJrc35tIoo9xwEt97jws8zkjFKmy5qeAHWaE2AkswOPFSuHs/bFyVRZADiTRtrILm7fm2EGqe1xRDbvuBYHZzvpShlyHdwwi06CdTnub2mIKtAhaBDITGom5wLsGMRZdHauWRBj5cE9lDja3SbsEVKf+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwY39uBQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwY39uBQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so6040198b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755091317; x=1755696117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeW3YS6ZpEp6cb21mzmL/tJL4kz2qFZdu1xrCIw6JEE=;
        b=GwY39uBQQ0sy1yXRIo37oznECIsG9XoegtxURYM9Nebk8ScE2q1/+fCWgaYleYKA3h
         GRkPM/f6F7hezvhypdvFkLu/HCmWjesX9NXtJkRwG4QKuvU1a68R5P5F/kiqfm7fRwVu
         ZX20hATkucpb1B70W9LGEprp90WbfYExLAUmhKuWFpkbr5I7L4pf688w46rFnbNIJAKU
         xbVpQ/bTVXaRaMGdVw9rS0JlUh0Mjvp9fSKc5sm1BxT6Em+hEBGGq243zh5fibn272pu
         YVV+wstAMIs+bRi2Jr31XBME4oc0Oc9Bvhfb5VHiDbSukIu3s/4NBA9FjXtdCOc8L9Hr
         kMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755091317; x=1755696117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeW3YS6ZpEp6cb21mzmL/tJL4kz2qFZdu1xrCIw6JEE=;
        b=WpiAKJS8c+mf9X/ThkBcNiW4G6D/o+1LGemnmgdwlZlBdHtE4klAZ2C/EgZ3KCsllo
         BrOs/PKBvBFF6GGcTWE9MCTWrGMkMs69lrWOwVso/YMkJuDp1zlsY9uPfYdUv6JWSr8G
         uGAQPdkXUlVdL3fYJb74QWlgqykBcEK3RH5R7NYvbORzqUHVSxsChG7KnH8zD4IgGI9Y
         DzPG4O1xNzS6Xu7LuY0M6Y75hjB+rtn5SAV3MMd2fIxmGo65imMYbHBed2YJCfBB4pwX
         LHJFulQT5On4VOyWtnBQBs8h+srtkz2HAEQreTMCqZl+Ylp+mo/sXbxVPzNohv4gbnvF
         UoDw==
X-Forwarded-Encrypted: i=1; AJvYcCWSPhdW3+wuHW8HRk0NoB5op9ZwupRV5/AyU1rZd4/FwVL6RA56moBXuILL6bogE87+S3hlKffbg9niB7hZds5nYSCOVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXMtcX/5tLk8AU1vInNBb0U+u1jJn/6NJ86vMRm2ebYrB1bdmm
	q8DqtDKfg/ZI31RufIp7rIHP8zMEQVxt1cdDxaUI6wmXkr18dZwtWzedAYjaQavI
X-Gm-Gg: ASbGncscdsqlEK6+2Q6AcT7FQtMA365+KMv1x3B8wNODkjK5c1Q06W3dekkr1byXuHU
	k51dhHlCnUwzH2AQpvERA1Vdt8DnkwhMeyjG7Jqup/kYusFzUN3AnwfFSKuqhr/RHiLI36TBqd6
	hQlNp5q6jc+JDoApyzrMoiTGH15vr7fp50isXrf5M4YtJWGMiQIXlFPwztolasnO5dkE6qC6UVn
	ZqouV+y52BfK4xx675hk8F0wbbH7UpnzT90B1GPwysERWa/X1hfW3hBdJLWMq0UKk8acJcA3kZL
	iNzD0CYvjUyPvnwEOfADGsJhmmW/PVa2X9ymYQ+7dlS5hQrtJYaqU1ef1XEcSrN0nyNjfD3fZEy
	6Le5p7KDy
X-Google-Smtp-Source: AGHT+IEO2C51W4ZA2n9RzuoiCubS/KwacyY8G27bYXr+yJ18kOOHtunnabAfnRZE8xyAQM+j5BjvUA==
X-Received: by 2002:aa7:8889:0:b0:769:9f87:1dfa with SMTP id d2e1a72fcca58-76e20fba1damr4367769b3a.23.1755091316718;
        Wed, 13 Aug 2025 06:21:56 -0700 (PDT)
Received: from gmail.com ([2406:5900:2:f21::2a1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd156sm32006909b3a.84.2025.08.13.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:21:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 22:21:50 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyer@efficios.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] trace/trace_fprobe.c: TODO: handle filter, nofilter or
 symbol list
Message-ID: <aJyRblXjHcxz4EGF@gmail.com>
References: <20250812162101.5981-1-seokwoo.chung130@gmail.com>
 <20250812140357.65d19062@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812140357.65d19062@gandalf.local.home>

On Tue, Aug 12, 2025 at 02:03:57PM -0400, Steven Rostedt wrote:
> On Wed, 13 Aug 2025 01:21:01 +0900
> Ryan Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > Resolve TODO in `__register_trace_fprobe()`: 
> > parse `tf->symbol` robustly (support `sym!filter` and comma-separated lists), trim tokens, ignore empties, deduplicate symbols, use bulk registration for lists, return `-EEXIST` if already registered, and preserve lockdown/tracepoint deferral semantics.
> 
> Hi Ryan,
> 
> Please read the Submitting Patches document to have proper format.
> 
>  https://docs.kernel.org/process/submitting-patches.html
> 
> 
> For example, the change long should have a max column of 74 (with the
> exception of cut and paste commands or output)
> 

Thank you. I will make sure to follow the style guide.

> > 
> > Please note that this was my personal interpretation of what TODO
> > required here. Welcoming any feedback. 
> > 
> > Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> > ---
> >  kernel/trace/trace_fprobe.c | 102 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 100 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/trace/trace_fprobe.c b/kernel/trace/trace_fprobe.c
> > index b40fa59159ac..37d4260b9012 100644
> > --- a/kernel/trace/trace_fprobe.c
> > +++ b/kernel/trace/trace_fprobe.c
> > @@ -12,6 +12,8 @@
> >  #include <linux/security.h>
> >  #include <linux/tracepoint.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/string.h>
> > +#include <linux/slab.h>
> >  
> >  #include "trace_dynevent.h"
> >  #include "trace_probe.h"
> > @@ -762,8 +764,104 @@ static int __register_trace_fprobe(struct trace_fprobe *tf)
> >  		return __regsiter_tracepoint_fprobe(tf);
> >  	}
> >  
> > -	/* TODO: handle filter, nofilter or symbol list */
> > -	return register_fprobe(&tf->fp, tf->symbol, NULL);
> > +    /* Parse tf->symbol */
> > +    {
> 
> Code does not add random blocks.
> 

I will remove the block and integrate the code directly. 
Is this the recommended way in linux kernel development?

> > +        char *spec, *bang, *p;
> > +        int n = 0, w = 0, j, rc;
> 
> Indentation is always 8 byte tabs (not spaces).
> 

I will convert to 8 byte tabs as mentioned.

> > +        char **syms = NULL;
> > +
> > +        spec = kstrdup(tf->symbol, GFP_KERNEL);
> 
> Why did you declare spec as "char **" when you use it as "char *"?
> 

This is my mistake. 
I will correct the declaration. 

> > +        if (!spec)
> > +            return -ENOMEM;
> > +
> > +        /* If a '!' exists, treat it as single symbol + filter */
> > +        bang = strchr(spec, '!');
> > +        if (bang) {
> > +            char *sym, *flt;
> > +
> > +            *bang = '\0';
> > +            sym = strim(spec);
> > +            flt = strim(bang + 1);
> > +
> > +            if (!*sym || !*flt) {
> > +                kfree(spec);
> > +                return -EINVAL; /* reject empty symbol/filter */
> > +            }
> > +
> > +            rc = register_fprobe(&tf->fp, sym, flt);
> > +            kfree(spec);
> > +            return rc;
> > +        }
> > +
> > +        /* Comma list (or single symbol without '!') */
> > +        /* First pass: count non-empty tokens */
> 
> Strange comments. Did you use AI to help you write this?
> 

Yes I did use AI but not in a blatant way of copy-and-paste.
I am relatively new to the codebase and kernel development and therefore used
AI to help me get up to speed. 
Please let me know if you don't recommend using AI.

> -- Steve
> 
> > +        p = spec;
> > +        while (p) {
> > +            char *tok = strsep(&p, ",");
> > +            if (tok && *strim(tok))
> > +                n++;
> > +        }
> > +
> > +        if (n == 0){
> > +            kfree(spec);
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Allocate array for pointers into spec (callee copies/consumes) */
> > +        syms = kcalloc(n, sizeof(*syms), GFP_KERNEL);
> > +        if (!syms) {
> > +            kfree(spec);
> > +            return -ENOMEM;
> > +        }
> > +
> > +        /* Second pass: fill, skipping empties */
> > +        p = spec;
> > +        while (p) {
> > +            char *tok = strsep(&p, ",");
> > +            char *s;
> > +
> > +            if (!tok)
> > +                break;
> > +            s = strim(tok);
> > +            if (!*s)
> > +                continue;
> > +            syms[w++] = s; 
> > +        }
> > +        
> > +        /* Dedup in-place */
> > +        for (i = 0; i < w; i++){
> > +            if (!syms[i])
> > +                continue;
> > +            for (j = i + 1; j < w; j++) {
> > +                if (syms[j] && !strcmp(syms[i], syms[j]))
> > +                    syms[j] = NULL;
> > +            }
> > +        }
> > +
> > +        /* Compact */
> > +        for (i = 0, j = 0; i < w; i++) {
> > +            if (syms[i])
> > +                syms[j++] = syms[i];
> > +        }
> > +        w = j;
> > +
> > +        /* After dedup, ensure we still have at least one symbol */
> > +        if (w == 0){
> > +            kfree(syms);
> > +            kfree(spec);
> > +            return -EINVAL;
> > +        }
> > +
> > +        /* Register list or single symbol, using the existing bulk API */
> > +        if (w == 1)
> > +            rc = register_fprobe(&tf->fp, syms[0], NULL);
> > +        else
> > +            rc = register_fprobe_syms(&tf->fp, (const char **)syms, w);
> > +
> > +        kfree(syms);
> > +        kfree(spec);
> > +        return rc;
> > +    }
> >  }
> >  
> >  /* Internal unregister function - just handle fprobe and flags */
> 

I will send v2 shortly with the above comments in mind.

Best regards,
Ryan Chung
