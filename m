Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0F24A18
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7qbaiyB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C874160EBB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C874160EBB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i7qbaiyB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBTYUdmqgY-u
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 12:29:26 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0206460E29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 12:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0206460E29
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cf74ad87e0so6591665ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 04:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700742565; x=1701347365; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ILlO5Ju9rH2opkKRRAf9sDu0NBM2kVszu1xEQ00T/z0=;
        b=i7qbaiyBxNZSp5B7YV5kLl77DVFV5qYZBctcA3LnyvdxzF6z/YBvDFi0i0eyoBqcq/
         ykPKraL5eRioHUjIatiyWxVOlfa3/UJWJF7ymLJJdz7lCHVwXGnQ71b8rAJmefIuQOEP
         NwanPt+9TupZDl0e5s/AWNRqxmTgSzVIl1JFuU2TJPyi9/JXhjkk1fl8eor7RtveE7eJ
         GmzLd6XGg5RES2uNLwGz2HLpJHziC7ximkxyaViiM+OAekJ0t3QmsLsAzjBIIa0G1APM
         4lVPy2apmxFRUFo2o22yRvlqML+yO5hfvyawRdmPvOD8hyPsYpeWl5toR9uwxok62Gtv
         xxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700742565; x=1701347365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILlO5Ju9rH2opkKRRAf9sDu0NBM2kVszu1xEQ00T/z0=;
        b=e8yv/qc5MYuCr2xnUnTK1sHhN5CRXA9qVLmPbtTwDe1fDUOLqCGqxbipxFmHgOHZpP
         CxOMWxGtCW9QW5+eyFdErz0Jrvjagf9AP3vKBa3AfDJeHRIOs3IOJYblubJZ4nsj82ZQ
         wsa7LsUh4a3Ev8cbWJ+563dOhUOUL1TS230OUiKa6Y8wgP+ZGsUWSEZ7WSBgW9NjmUg6
         CZhsxB0bjD/g1rmD0NSw2nm6mIj8ttO8jecdP3S55jrTv4pn5wqw4v4Z3tsOG3NrtH/h
         FBR+jNyycJ/iWKmS0qHEPoP14oe1ACfcqf8xHp9kywC/vCTAPanDZoBVWJs4cXfYX0/c
         dThA==
X-Gm-Message-State: AOJu0YyLXjDsuyzL0dRCZ4mPwR3QuvdOHqCbc5DBK8w+vaWr+SEX/uRc
	ijBfZqrpA4sTqxgkedI4i20=
X-Google-Smtp-Source: AGHT+IE1iE7RBu8GMn2U0cc1UwH2nHd9pucjqvQ6gcVhmKO5SkMfvCcHThns4O48X1qD45PdRJjCSg==
X-Received: by 2002:a17:902:ed4c:b0:1c7:5f03:8562 with SMTP id y12-20020a170902ed4c00b001c75f038562mr5742197plb.30.1700742565265;
        Thu, 23 Nov 2023 04:29:25 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.83.22])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001cc2f9fd74csm1238545plb.189.2023.11.23.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 04:29:24 -0800 (PST)
Date: Thu, 23 Nov 2023 17:59:18 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v3] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZV9FnjRH6VTwWaaX@swarup-virtual-machine>
References: <20231123100119.148324-1-swarupkotikalapudi@gmail.com>
 <ZV8lf8L8Me+T7iIW@nanopsycho>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV8lf8L8Me+T7iIW@nanopsycho>

On Thu, Nov 23, 2023 at 11:12:15AM +0100, Jiri Pirko wrote:
> Thu, Nov 23, 2023 at 11:01:19AM CET, swarupkotikalapudi@gmail.com wrote:
> >Add some missing(not all) attributes in devlink.yaml.
> >
> >Re-generate the related devlink-user.[ch] code.
> >
> >enum have been given name as devlink_stats(for trap stats)
> >and devlink_trap_metadata_type(for trap metadata type)
> >
> >Test result with trap-get command:
> >  $ sudo ./tools/net/ynl/cli.py \
> >   --spec Documentation/netlink/specs/devlink.yaml \
> >   --do trap-get --json '{"bus-name": "netdevsim", \
> >                          "dev-name": "netdevsim1", \
> >   "trap-name": "ttl_value_is_too_small"}' --process-unknown
> > {'attr-stats': {'rx-bytes': 47918326, 'rx-dropped': 21,
> >                'rx-packets': 337453},
> > 'bus-name': 'netdevsim',
> > 'dev-name': 'netdevsim1',
> > 'trap-action': 'trap',
> > 'trap-generic': True,
> > 'trap-group-name': 'l3_exceptions',
> > 'trap-metadata': {'metadata-type-in-port': True},
> > 'trap-name': 'ttl_value_is_too_small',
> > 'trap-type': 'exception'}
> 
> 1. You have to maintain 24 hours between submission of one
> patch/patchset:
> https://www.kernel.org/doc/html/v6.6/process/maintainer-netdev.html
> 2. You didn't address my comment to last version
> 
Hi Jiri,

I have read the above link, but missed the constraint
of 24 hour gap between patches.
I will be careful and not send the patch again within 24 hours.

I could not understand your 2nd point.
Does it mean i should not include
test result e.g. "Test result with trap-get command: ...."
Or
If it is something else, please elabroate more, which helps me to address your comment.

I will try to clarify review comment, henceforth before sending new patchset for review.

Thanks,
Swarup
