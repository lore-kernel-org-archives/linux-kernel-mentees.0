Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE646BF
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498818; cv=none; b=eeRDjyfjLrcJJI+vmgyk7MvBqukKDSBx7RgdWitQLeYxsc51OqYWaw6y7LgyKccBW68QgkkxFksrs5qIWwpP98z8NocZ0S6mwczedJ12TQXIRnucNaZ3eG7MnuQIxg+cgeUvynF6prZIv9xRJH4ddkWcWy5bjbqljHNRZe5mdGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498818; c=relaxed/simple;
	bh=Fxy1GsxFgTmyC+DciW6Y5utDV003qXLrD39oL6xyDK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=B6N2Cj0WCKUWGtAD5C9jg2TttckzxFLpeaAdIt0YKy8XF9IYtyixbMrfsPK9W6e5SgD4X3w3Kl8gsnxkQDWrUVGgwHI8VWF4LQdJ+qi8Qmja7qV/ru6xXiYRKpMFMVvMD3oT4MUF+ekDNPyrhxiwRoKz0edyqorKueBvyZF5pHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSdUI9aH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSdUI9aH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754498815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Nd9MFnTlr7WVrR7s+mCfQ91mGkWMSL7YSOVN2ZEGg4=;
	b=MSdUI9aHx+JMWzY3IlS5JbXUJxNTkfv7w1Xr5jkua4u4PVemvQeWm/1MPPEt49nDY+IRiU
	WYoiMhS1muP+VcB7Ti61+2PNb7Ihno19ZKbd70wO2EWqqXafJ8IXEfcB+Ziby3n/okasrF
	5UKGeX5e7yc0RbOnnb+wKnIo1nnUv6U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-mCvlHqxcP1aHBFDiJT0Ikg-1; Wed, 06 Aug 2025 12:46:54 -0400
X-MC-Unique: mCvlHqxcP1aHBFDiJT0Ikg-1
X-Mimecast-MFC-AGG-ID: mCvlHqxcP1aHBFDiJT0Ikg_1754498813
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e8e0f471388so101547276.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 09:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754498813; x=1755103613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nd9MFnTlr7WVrR7s+mCfQ91mGkWMSL7YSOVN2ZEGg4=;
        b=Q1dNwytd2yBBIT9GfwP/a/CScyKXx7VPZxlMjn0csA8+UJDV9FhTYNx7R3S2KwY8nC
         bcNbtRl71NP7HuSSD9ejCQ1rj+lh23lLQQJGrO4skVEdgolImj4Ru34mmsqVtF8kkn4Y
         N7DYqsHeYQRRNDeo2ok0wdfqukEU85NTj0zbITx7pD4leIBOGEenHvA0XqcBo09e164H
         Bn4uyhsqGU1U21LbLvxt+fxX3guR+BGHt4DSsOqQSCMGMIs0Twx0WvzAboviNOMxOA6k
         H/cJgYnLOTEXu3FlRtaeVZVpOjoe+rM5FDfK5+M2WOZYLSZ0pvFhQKC1woZi/hudr9FQ
         wNuw==
X-Forwarded-Encrypted: i=1; AJvYcCX73bo+LzrX0Bic05AsxXwkQjoAK5r9uTQx2wWHcbDDEdTrmnMb1TW0i1bF00i6NJQZvRagBN8Wk0U4M6pO0Ti3GTQ5+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm3zS+4m4pCf1lP/8L4MGzdjgC3w6MUzACIYRkVNP7TX/12hgr
	HytQait0R4FfH2PJYRNn68GiqFy5WpMjki10BJBsTvtK7N0Ynp4ywAHaOLRJngbndIeGNiBqGoH
	GelJ7ipBJXnyIzPG293MGgKCvtlouIxTQ+zxNSFH20n9M8saqTx9d7Zu5zw7TsuiVnEffkgr5ra
	7L6S1mKn5Y
X-Gm-Gg: ASbGncu2cRIgqnB6pQv5tdvGm8+cuSFid0leue0K/rY1McKLQjlN77AUPB7Zr6ifkQN
	Mu4ywjzufeGEnIOsMY2A/epc6ut0VVnErAYJG+9eAFp6rQB/txw965t2jSt2f9TVt9h2KtgcLok
	DN0b0TccY7Is6jCvr5uwIb+G3mNQE05G8CjQVtz724Y90cwRa2IJzcPmvrAHRjKXdIllPb8uzl5
	cTsI6jwG9zM55Ud831+WOz5WhrQ4A+z8EwnX2PIvCpF5I2W9mv/vnvRgw6aUm+dFJmPQ8gviLHO
	r4AmSNB3b+91+8bQJ+VNcCYG6Ku20D2c9Vm3TMHsG2kSIBvv8qCSYmjy98f+gaH/6I1FYgrCERy
	ukH2ojq4WEwkfL+ADfTl8rA==
X-Received: by 2002:a05:6902:1442:b0:e8e:2535:5ce with SMTP id 3f1490d57ef6-e902b825c10mr3495166276.34.1754498813146;
        Wed, 06 Aug 2025 09:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE53Eqc4ZZr2AAoa1BkY+1WkbLTnrnGZkrw+oh/AutRhwg1BqQQfEJzXdO3LO6YcxGkkHaG8Q==
X-Received: by 2002:a05:6902:1442:b0:e8e:2535:5ce with SMTP id 3f1490d57ef6-e902b825c10mr3495120276.34.1754498812599;
        Wed, 06 Aug 2025 09:46:52 -0700 (PDT)
Received: from x1.local (bras-base-aurron9134w-grc-11-174-89-135-171.dsl.bell.ca. [174.89.135.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8fd3714cb1sm5654298276.2.2025.08.06.09.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:46:51 -0700 (PDT)
Date: Wed, 6 Aug 2025 12:46:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] selftests/mm: use __auto_type in swap() macro
Message-ID: <aJOG-IAmYhjoYVf-@x1.local>
References: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
 <CAH4c4jJ8VywRUfn2z8HnA73vNxviZ53DZttcR3JaPULF3JFkQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAH4c4jJ8VywRUfn2z8HnA73vNxviZ53DZttcR3JaPULF3JFkQA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZIPvODMdRtESpAfAiGYnZV1A5iZvYSm40uCAjmkXTr8_1754498813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 06, 2025 at 09:15:50PM +0530, Pranav Tyagi wrote:
> On Wed, Jul 30, 2025 at 7:53 PM Pranav Tyagi <pranav.tyagi03@gmail.com> wrote:
> >
> > Replace typeof() with __auto_type in the swap() macro in uffd-stress.c.
> > __auto_type was introduced in GCC 4.9 and reduces the compile time for
> > all compilers. No functional changes intended.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  tools/testing/selftests/mm/uffd-stress.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
> > index 40af7f67c407..c0f64df5085c 100644
> > --- a/tools/testing/selftests/mm/uffd-stress.c
> > +++ b/tools/testing/selftests/mm/uffd-stress.c
> > @@ -51,7 +51,7 @@ static char *zeropage;
> >  pthread_attr_t attr;
> >
> >  #define swap(a, b) \
> > -       do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
> > +       do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
> >
> >  const char *examples =
> >         "# Run anonymous memory test on 100MiB region with 99999 bounces:\n"
> > --
> > 2.49.0
> >
> 
> Hi,
> 
> Just a gentle follow-up on this cleanup patch. From what I could find,
> this is the only use of
> typeof() left in the mm selftests, so this should be the only instance
> needing this change.
> 
> Thanks for considering!

Hi,

Andrew should have queued this one in branch akpm/mm-nonmm-unstable (even
though I'm not familiar with the branch).

Said that, I'm also not familiar with __auto_type.  Looks like it's more
efficiently processed by the compiler in some special use cases, however
it's also new so maybe some tools (sparse?) may not recognize it.

Is it the plan that the whole Linux kernel is moving towards __auto_type?
I still see quite a few of typeof() usages (not "a few", but 2966 instances).

Thanks,

-- 
Peter Xu

