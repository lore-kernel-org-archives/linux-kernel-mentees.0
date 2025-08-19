Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED422D4C3
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755621446; cv=none; b=C1j9ZftAf9EhGe8BNieM6rnXmD065FwjpRrzrOMSsIRObknbcFf3mHAYbJ7NjNJAZtjqK5BYG3oYiVkXwoUMceiFEAeT/rqATDW4VwUOd251h+HK4UutgeAFD74J5ECwi4uTFci2TBelp5WTg8v64MWzCLzXveNObENkNvvv19c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755621446; c=relaxed/simple;
	bh=scbaPHNUfafnIekgS1W/IcAwZjeclgXRiBG9pKjzDeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnDSWZKWhcUM8RdV7P1JYQbdf85cIG//w/0xLhzvsXViOt3fG6KEmyXguEpC+S3lxN7T5+Q5Ox4gBtkvDFzJ7E8+hOFHTFhZePJoW1GrStZUOSQNOves4Z2SUYX0YG9i9cT16Oolox1e7ldDJwfHzE9m5ap8P1SVKFigO1wo7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwJpxRHC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwJpxRHC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24458298aedso47170975ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755621444; x=1756226244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3oR61/c0uiXLRfyBJRzpXCbawo5PgtjuwTdlJFdps=;
        b=dwJpxRHCnUMJ6Z1szHWxNDnkYOjYoRDwGMKUxdQb0/udhv/mOWx3diuPAj4PNx4CUQ
         ySTRTk3sSMjtAzDnlAcruEjiFDgRpLKStlcSxilbiBG0lL46XRtfY/9dprisxPTNitdB
         drHKwACXPQm5c3Wn1TGQPsDAmn/mqlcraPeUqrWZsY76ijhgICR2rNwKgyqff+nf4lZF
         s2e7w+ZVSTacie63y6UzgqvSzUSeoGzoDASlp6q21LB/w2sglGUuyev8SX7Fw3JIA4Ws
         dVEC+vphRW2sWvvLDY/zxHSEzz8A1f//p7jHpisQN3CyJgij0U6pEzATsH69C52BlfD1
         foGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755621444; x=1756226244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN3oR61/c0uiXLRfyBJRzpXCbawo5PgtjuwTdlJFdps=;
        b=QWupLPwvqyFUn6QIfKOdVBOyc+h4PlxRExoKOJ13IUylGuZvVxEE+FSCiS27YxGxUG
         OIo8hs8xpEfZUuXGMEzMSYwnl3NROGfq70Cjx5NphyCFHfgtM3mf92UZFKKkAd1ORqDJ
         cQppZJ5Ai7up8HYbs6M4IYQMFuGZAiT3btVw1qrZ9pRdX+JeVP4BbF/cDF88pD/Wmudj
         5wjFYEUi+i44c08+JfmdibXuMpzFbmSYDc+5GQCjaKVJsSoTErMCUSuVgZMK4AW1iJ0X
         wV90e6nFZRF3V/uQUtvpYpGTkLFUWPql35gMHAah9iePi653F0+/0oO3ZQNg5vMUUrRW
         rnFg==
X-Forwarded-Encrypted: i=1; AJvYcCUJla0hbW85wjZ2RVCHKSgLmEHvHVYNVXqh6KVReYdILeeH2S5V3ql+9IsTlREwg3NvzBgFIdShOGUvfCtOpeIjELFKRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Mq98W77SIEDl5eH0wBhne7QbmiA9mO5ff1iq+r0pJsZd956a
	JVqqObSEuoKuDnFu9F7jfvxgYQ+KgbnMwIAe4KAg/0RV5RpuKHokZFGW
X-Gm-Gg: ASbGnctAvQEH0+FBLWTiLGZh/VMW4rzzNaXwIisAoYPX53GuQwycyJtIhkTo+dMABDb
	ve39rGMvmXPl4oWDwbK9eg4Gmpj5QytY51wygadR3JuiEMR9MeO8Mwhf2ohsBG6eUfOeDXn2ED5
	QJu1JPQ7kY+6cW9lpUU3z3ZNmc4o886+tXe0McbkFnde+C7SFt/eckMEmVp2WSsOsU0vwLnX4ss
	dtawXDWjLNdq/KuDSrA3eBcv3lCmb90JZ2qtMA52gv+bAR03uVjFhSYprtz8berHecMWR+ZUrbR
	NyoAT+IZluUiWiAur0jxIqQ2OAbVj6NF16c0G7uleI+Kqy2x+c7DcKDQ7egQPeDEK3VnqEJPFLJ
	8fRPsUeLZ
X-Google-Smtp-Source: AGHT+IElLHXy5Z0g7yBhgA4isDUqzATIIqXde4d2BmuwggJSAMpaov5koyT/PbDQ1G2u3jDfv9QvHg==
X-Received: by 2002:a17:902:d48f:b0:242:a0b0:3c1f with SMTP id d9443c01a7336-245e02cfc12mr45322725ad.7.1755621444380;
        Tue, 19 Aug 2025 09:37:24 -0700 (PDT)
Received: from gmail.com ([2406:5900:2:f21::2a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51c0aasm1428815ad.144.2025.08.19.09.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:37:23 -0700 (PDT)
Date: Wed, 20 Aug 2025 01:37:18 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, mathieu.desnoyer@efficios.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] trace/trace_fprobe.c: TODO: handle filter, nofilter or
 symbol list
Message-ID: <aKSoPiEeixEtcxys@gmail.com>
References: <20250812162101.5981-1-seokwoo.chung130@gmail.com>
 <20250814121504.2784e740a4e6fd4e0dd563d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814121504.2784e740a4e6fd4e0dd563d6@kernel.org>

On Thu, Aug 14, 2025 at 12:15:04PM +0900, Masami Hiramatsu wrote:
> Hi Ryan,
> 
> On Wed, 13 Aug 2025 01:21:01 +0900
> Ryan Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > Resolve TODO in `__register_trace_fprobe()`: 
> > parse `tf->symbol` robustly (support `sym!filter` and comma-separated lists), trim tokens, ignore empties, deduplicate symbols, use bulk registration for lists, return `-EEXIST` if already registered, and preserve lockdown/tracepoint deferral semantics.
> 
> Thanks for the improvement!
> And could you add the new syntax in the document too ?
> 

Yes. I will add the syntax in the document.
To clarify, by document, you mean
Documentation/trace/fprobetrace.rst?

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
> 
> Headers should be sorted alphabetically.
> 

I will fix this in v2.

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
> 
> Please make this parse and check as a sub-function instead of new
> scope. Also, it should be done in parse_symbol_and_return(), so that
> we can handle wrong syntax when parsing it.
> 

I will move the parsing into parse_symbol_and_return()
so syntax errors are detected at parse time.

> > +    {
> > +        char *spec, *bang, *p;
> > +        int n = 0, w = 0, j, rc;
> > +        char **syms = NULL;
> > +
> > +        spec = kstrdup(tf->symbol, GFP_KERNEL);
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
> 
> You don't need to do strim, since if there is a space, it
> should be parsed already. New syntax must be ',' separated.
> My basic syntax for this probe event is;
> 
> WORD WORD WORD[:OPTWORD] SUBWORD[,SUBWORD]
> 
> OPTWORD is qualifying the previous WORD, SUBWORDs are not
> quarifying, but the same-level words. (Currently using "%return"
> for the return of the function, that is a special case.)
> 

Understood. I will drop strim() and treat tokens as you mentioned.
I will leave return behavior unchanged.

> > +
> > +            if (!*sym || !*flt) {
> > +                kfree(spec);
> 
> Please use __free(kfree) instead of repeating kfree().
> 

I will also include this in v2.

> > +                return -EINVAL; /* reject empty symbol/filter */
> 
> Also, before returning an error, use trace_probe_log_err() to
> notice the reason and the place of the error to user.
> 

I will log parse failiures with trace_probe_log_err().

> > +            }
> > +
> > +            rc = register_fprobe(&tf->fp, sym, flt);
> > +            kfree(spec);
> > +            return rc;
> > +        }
> > +
> > +        /* Comma list (or single symbol without '!') */
> > +        /* First pass: count non-empty tokens */
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
> 
> Again, symbol should not have a space.
> 

Understood. I will also fix this in v2.

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
> 
> I think dedup will be done in ftrace, so we don't need to do this
> costly operation.
> 

I see. I will remove the dedup here.

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
> 
> Hmm, you might misunderstand this. What you need to do is to classify
> the list of symbols with '!' as nofilter, and others as "filter",
> and pass those as "register_fprobe(&tf->fp, filter, nofilter)".
> 

Thank you for the clarification.
I will change as followed:
- tokens prefixed with '!' go to the nofileter list
- all other tokens go to filter list
- pass both to register_fprobe(&tf->fp, filter, nofilter)

> Thank you,
> 
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
> > -- 
> > 2.43.0
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you. Please let me know if you have any questions or concerns.

Best regards,
Ryan Chung
