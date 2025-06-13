Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4842F4321
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792182; cv=none; b=UlO5gPacJRqqPJaKF8Cwti2UW+gRrugkpFcLVWX+Nd00I+efgWy+mA94VTHdYWi+kd7cK2aO+F0fdFQnw6JCGFPuoA4kwrFabUghk3CTkVFSBu2kN1ZNHHt3URJ38JjQET2CK8QdC87eTbofECKD3ohTnJ+6B8ppB3LqbiAhrBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792182; c=relaxed/simple;
	bh=CzfUoU/F6OeWFirpLwxi5VsjH9jIIE4t1ioTm3n+IkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTZXqNqZW/EQxAKWBrzDVFfcGLHdPkp7iV6kf9OCrZ+ccuLbGo6E3LJaN7OwD2vvN48ThRm0NZRk62szG95C/hnFoa/2FzOSk6XVlAmiMctEImhGdfeuGwYEMnwYcKjpqANf0CtznxXI4Tn8IQbO7dgclWfDDQUOqT2RtCYq078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndcbF0UE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndcbF0UE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236470b2dceso16304545ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792180; x=1750396980; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvMoFYwoxd+5v+JlYcXvt8KEYE3zUwaZzStFo0AwJ1g=;
        b=ndcbF0UE4ZbNztl/JlQLYTTP7v5aZtjLgHZRtfHKhgXaQ67ojQYRn59X0FSxNK6eL6
         9t5L6qn+Bon69Lb1OblUuoFXNaO4EduT3jmm3AcDZ7l/AZNb9pJ0Um0nj+LkOGiJLzVS
         qxmzb6chGy6gYB3sTn+QoMJI78anbdjipmlXm3A6HtxIr+9aXQ4W3Q8ta8s2Vc85Nrul
         8yRBSKnI6ACYlZEQAHHvoHorYjfAoyKq5zz1D9jWpGeTklwOw9lLKn8/ramGi0+xifP4
         OvotysvSASzQHwyPd/NCMvwnL72xQKGzffgXSHnVRhR6pbCu5BWOQAJzKRB1xB+ia9De
         5TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792180; x=1750396980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvMoFYwoxd+5v+JlYcXvt8KEYE3zUwaZzStFo0AwJ1g=;
        b=eBx5VRR3rdw0hDHJyFG8aTpU7rhTBu069r53TLfRiEvG58L6iaUJsH4aI7jN9Pa1RR
         dNUgCNJNcqWKIsHNND7BPV9hpv65tjIzYq2JxYgFaPoQ+1dL2DtDpb0Bxstqs0y17ljl
         Vx017cbdky4gU1GiJhk479ryEqwC359vCCIsoFmSscXJ3Z8jss6mzJNFOJ77oMnvevaH
         Fzp+D5EVGoNs9BI/IJdnl1OMEhLn55x/6VqQG1BP3xP2MTD4NvTMQl09d/1CFM0ZITLQ
         5lWFBnBwFLwa70AaGLXxAu8TjAoBjPK4dg2XAyhg2BIeKopxRM0HaUG0Wh1Xto6/OSwU
         FR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVAEjqmRn8ZC31Pi0DmdHA2Hos6dZZya9XrBPRI+M3qmKpsoNqt1FVUd6LotM6oplEd7SqNayD5ZrQbU9MSqrDXlu6kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQVhjfbGwoYeFJOw6BqUnkIsBG/8QJLDTQjN9NXPKXwvflQfXH
	7HStEqtg4xK8otrpKcTQ+e7Hi1Vq6FamjmlthwBYLiMzlLLxrXCs67MA
X-Gm-Gg: ASbGnctghtBmQu8ToBgC0s+to273EKxBgGmQ/ctIMPWnXAQSP+Yh2JClN3+fn5T2zVN
	SAsVheU6N5ch1BdIWC0xOEqzuUmf5zYVSViPtSLfPq+uZ+2JpJfXC5iy9OLC+bv5nDFqUNY7ns+
	+siz+ZBsVoAEwr+KZrXIJo+8qrql40S2eTzxheV1h2fU3th4L/zi0XfXwwuTXLZqU9UogDhga6v
	7Apr4CZNHTZYwPelf6oNGRjaczkOCba2ryWgR4c1hfaTwTF2JoEhPhNwL/Ac8ybLWthasulNtRT
	We6NxkPTC1tGmhZGyTjAAZeBne6ResTuud6mqAqO0s4ULrM0fY6ccVunFjjqudBfn0bCwOr9Z2H
	yias=
X-Google-Smtp-Source: AGHT+IH/+q1AAngn1g1v5S0pRF3/srqeZGaw+VXxABBS2AqgAEONOjQel6ro0wVKKJxQ8DwpOzCG5Q==
X-Received: by 2002:a17:902:ccc2:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-2365dc0f622mr23088165ad.37.1749792180339;
        Thu, 12 Jun 2025 22:23:00 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfc56a7sm6232405ad.233.2025.06.12.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:22:59 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:22:55 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
 <aEuw7ls9hieUv_Ox@yury>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuw7ls9hieUv_Ox@yury>

On Fri, Jun 13, 2025 at 01:02:38AM -0400, Yury Norov wrote:
> I Hsin,
> 
> This exact change has already been submitted by me and is under review.
> 
> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
> 
> I don't understand why are you undercutting my work, and moreover do it 
> for the second time.
> 
> For the first time you submitted something that duplicates my another
> patch from the exact same series. John Stultz has pointed that, so you're
> surely aware.
> 
> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
> 
> Kernel development process implies that one makes sure that his work
> is unique and doesn't break someone else's development, at one's best
> knowledge.
> 
> What you're doing not only breaks this rule. You're in fact trying to
> get credit for the work that is done by someone else. This is the
> definition of fraud.
> 
> I cannot make sure that any other patches from you are unique and
> written by actually you. Therefore, I will not take your work anymore.
> 
> I encourage everyone else to be careful working with I Hsing Cheng
> and check his patches for uniqueness, at minimum.  
> 
> NAKed-by: Yury Norov <yury.norov@gmail.com>
> 
> Thanks,
> Yury
>

Hello Yury,

Sorry to make troubles, I didn't mean to do this, I wasn't aware that
you've send the same work and nor do I mean to interrupt your work. I
didn't have the habit to check others patches regularly, I'm sorry for
that.

I just saw Kuan-Wei's patch from months ago and I asked him whether I
can continue that work, and he agrees, so I try to do something from
there.

Again sorry for causing troubles, I'll make sure to look for others
patches first before submitting them.

Sincerely sorry for this.

Thanks,
I Hsin Cheng

> On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
> > Utilize cpumask_first_but() helper instead of first using
> > cpumask_first() and then cpumask_next(). The logic is the same here,
> > using the new helper will make it more conscious.
> > 
> > Use bloat-o-meter to check the impact on code size, the result is the
> > same, does not have positive impact nor negative impact.
> > 
> > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> > Function                                     old     new   delta
> > Total: Before=22590709, After=22590709, chg +0.00%
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > Generally speaking, I think this is just a small tweak on the code,
> > making it more readable. However, no benefit in code size or performance
> > as the implementation behind the helper is in fact the same as the one
> > used here.
> > 
> > Maybe more tests should be done to ensure the change is solid, I hope to
> > seek some suggestions from everyone who has any ideas, or this is enough
> > then it's good.
> > 
> > Best regards,
> > I Hsin Cheng
> > ---
> >  kernel/time/clocksource.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index bb48498ebb5a..12ff0c048570 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
> >  		return;
> >  
> >  	/* Make sure to select at least one CPU other than the current CPU. */
> > -	cpu = cpumask_first(cpu_online_mask);
> > -	if (cpu == smp_processor_id())
> > -		cpu = cpumask_next(cpu, cpu_online_mask);
> > +	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
> >  	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
> >  		return;
> >  	cpumask_set_cpu(cpu, &cpus_chosen);
> > -- 
> > 2.43.0
